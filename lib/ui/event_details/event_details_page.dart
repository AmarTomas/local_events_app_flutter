import 'package:flutter/material.dart';
import '../../ui/event_details/event_detail_background.dart';
import '../../ui/event_details/event_detail_content.dart';
import 'package:provider/provider.dart';
import '../../Model/event.dart';
class EventDetailsPage extends StatelessWidget {
  final Event event;
  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Provider.value(value:event,child:
    const Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          EventDetailsBackground(),
          EventDetailsContent(),
        ],
      ),
    ),);
  }
}
