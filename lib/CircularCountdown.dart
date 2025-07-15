import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class SmartCircularCountdown extends StatefulWidget {
  final String timeInput;
  final double size;
  final double strokeWidth;
  final Color progressColor;

  const SmartCircularCountdown({
    super.key,
    required this.timeInput,
    this.size = 200,
    this.strokeWidth = 12,
    this.progressColor = Colors.white70,
  });

  @override
  State<SmartCircularCountdown> createState() => _SmartCircularCountdownState();
}

class _SmartCircularCountdownState extends State<SmartCircularCountdown> {
  late int _totalSeconds;
  late int _remainingSeconds;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _totalSeconds = _parseTimeInput(widget.timeInput);
    _remainingSeconds = _totalSeconds;
    _startTimer();
  }

  int _parseTimeInput(String input) {
    // تحليل التواريخ (مثل 2024-07-15 18:00)
    if (input.contains('-')) {
      try {
        final format = DateFormat('yyyy-MM-dd HH:mm');
        final targetDate = format.parse(input);
        final now = DateTime.now();
        return targetDate.difference(now).inSeconds;
      } catch (e) {
        return 20;
      }
    }

    // تحليل المدخلات الزمنية (مثل 3h، 2d 4h)
    int seconds = 0;
    final parts = input.split(' ');

    for (var part in parts) {
      if (part.contains('d')) {
        seconds += int.parse(part.replaceAll('d', '')) * 24 * 3600;
      } else if (part.contains('h')) {
        seconds += int.parse(part.replaceAll('h', '')) * 3600;
      } else if (part.contains('m')) {
        seconds += int.parse(part.replaceAll('m', '')) * 60;
      } else if (part.contains('s')) {
        seconds += int.parse(part.replaceAll('s', ''));
      }
    }

    return seconds > 0 ? seconds : 3600;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  String _formatDuration() {
    if (_remainingSeconds <= 0) return 'انتهى';

    final days = _remainingSeconds ~/ (24 * 3600);
    final hours = (_remainingSeconds % (24 * 3600)) ~/ 3600;
    final minutes = (_remainingSeconds % 3600) ~/ 60;
    final seconds = _remainingSeconds % 60;

    if (days > 0) return '${days}D';
    if (hours > 0) return '${hours}H';
    if (minutes > 0) return '${minutes}M';
    return '${seconds}S';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = _totalSeconds > 0
        ? 1.0 - (_remainingSeconds / _totalSeconds)
        : 0.0;
    final timeText = _formatDuration();

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: 1.0,

            strokeWidth: widget.strokeWidth,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.black54),
          ),
          CircularProgressIndicator(
            value: progress,
            strokeWidth: widget.strokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(widget.progressColor),
          ),
          Text(
            timeText,
            style: TextStyle(
              fontSize: widget.size * 0.3,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}