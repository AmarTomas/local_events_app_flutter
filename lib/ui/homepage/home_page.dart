import 'package:flutter/material.dart';
import 'package:localevents/Model/category.dart';
import 'package:localevents/app_state.dart';
import 'package:localevents/styleguide.dart';
import 'package:localevents/ui/event_details/event_details_page.dart';
import 'package:localevents/ui/homepage/category_widget.dart';
import 'package:localevents/ui/homepage/event_widget.dart';
import 'package:localevents/ui/homepage/home_page_background.dart';
import 'package:provider/provider.dart';
import '../../Model/event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: <Widget>[
            HomePageBackground(
                screenHeight: MediaQuery.of(context).size.height),
            SafeArea(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'LOCAL EVENTS',
                          style: fadedTextStyle,
                        ),
                        Spacer(),
                        Icon(
                          Icons.person_outlined,
                          color: Color(0x99FFFFFF),
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      'What`s Up',
                      style: whiteHeadingTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Consumer<AppState>(
                      builder: (context, appState, _) => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            for (final category in categories)
                              CategoryWidget(category: category)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Consumer<AppState>(
                      builder: (context, appState, _) => Column(
                        children: [
                          for (final event in Event.events.where((e) => e
                              .categoryIds!
                              .contains(appState.selectedCategoryId)))
                            GestureDetector(
                              onTap: () {

                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EventDetailsPage(event:event),));
                              },
                              child: EventWidget(event: event),
                            )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
