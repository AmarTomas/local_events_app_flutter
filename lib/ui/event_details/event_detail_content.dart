import 'package:flutter/material.dart';
import '../../Model/event.dart';
import '../../Model/guest.dart';
import '../../styleguide.dart';
import 'package:provider/provider.dart';
class EventDetailsContent extends StatelessWidget {
  const EventDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final event=Provider.of<Event>(context);
    final screenWidth=MediaQuery.of(context).size.width;
    return SingleChildScrollView(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),Padding(padding: EdgeInsets.symmetric(horizontal: screenWidth *0.2),child:
            Text(event.title!,style: eventWhiteTitleTextStyle,maxLines: 2,),),
          const SizedBox(height: 10,),
          Padding(padding: EdgeInsets.symmetric(horizontal: screenWidth *0.24),child:
          FittedBox(
            child:  Row(
              children: <Widget>[
                Text('-',
                  style: eventLocationTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                  ),
                ),
                const Icon(Icons.location_on,color: Colors.white,size: 15,),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  event.location!,
                  style: eventLocationTextStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
          ),),
          const SizedBox(height: 80,),
          const Padding(padding: EdgeInsets.only(left: 16.0),
          child: Text('GUESTS',style: guestTextStyle,),),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget> [
                for (final guest in guests) Padding(padding: const EdgeInsets.all(8),
                child: ClipOval(
                  child: Image.asset(guest.imagePath!,height: 90,width: 90,fit: BoxFit.cover,),
                ),)
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(16),
          child: RichText(text: TextSpan(children: [
            TextSpan(text: event.punchLinel,style: punchLine1TextStyle),
            TextSpan(text: event.punchLine2,style: punchLine2TextStyle),

          ]))),
          if(event.description!.isNotEmpty) Padding(padding: const EdgeInsets.all(16),
          child: Text(event.description! ,style: eventLocationTextStyle,),),
          if(event.galleryImages != null && event.galleryImages!.isNotEmpty)
            const Padding(padding: EdgeInsets.only(left: 16.0,top: 16,bottom: 16),
          child: Text('GALLERY',style: guestTextStyle,),),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget> [
               for (final galleryImagePath in event.galleryImages!)
                 Container(
                 margin: const EdgeInsets.only(left: 16,right: 16,bottom: 32),
                 child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                   child: Image.asset(galleryImagePath,height: 180,width: 180,fit: BoxFit.cover,),
                 ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
