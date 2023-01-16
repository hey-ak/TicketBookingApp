import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbooking/widgets/icon_text_widget.dart';

import '../utils/App_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/double_text_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    return Scaffold(
      backgroundColor: Styles.bgcolor,
      body:ListView(
        padding: EdgeInsets.symmetric(horizontal:AppLayout.getWidth(10), vertical: AppLayout.getHeight(10)),
        children:[
        
         Gap(AppLayout.getHeight(40)),
         Text("What are\nyou looking for?",style: Styles.headLineStyle.copyWith(fontSize: AppLayout.getWidth(35)),),
         Gap(AppLayout.getHeight(20)),
         FittedBox(
           child: Container(
            padding: const EdgeInsets.all(3.5),
            child: Row(children: [
              // airline tickets
              Container(
                 decoration: BoxDecoration( borderRadius:BorderRadius.horizontal(left: Radius.circular(AppLayout.getHeight(50),),
            ),
            color: Colors.white,
            ),
                width: size.width*.44,

                padding: EdgeInsets.symmetric(vertical:AppLayout.getHeight(7)),
                child: Center(child: Text("Airline tickets")),
              ),
              // hotels
              Container(
                 decoration: BoxDecoration( borderRadius:BorderRadius.horizontal(right: Radius.circular(AppLayout.getHeight(50),),
            ),
            color: Colors.transparent,
            ),
                width: size.width*.44,

                padding: EdgeInsets.symmetric(vertical:AppLayout.getHeight(7)),
                child: Center(child: Text("Hotels")),
              )
            ],),
            decoration: BoxDecoration( borderRadius:BorderRadius.circular(AppLayout.getHeight(50),
            ),
            color: const Color (0xFFF4F6FD),
            ),
           ),
         ),
         Gap(AppLayout.getHeight(25)),
     const   AppIconText(icon: Icons.flight_takeoff_rounded, text: "Departure"),
     Gap(AppLayout.getHeight(20)),
      const  AppIconText(icon: Icons.flight_land_rounded, text: "Arrival"),
      Gap(AppLayout.getHeight(25)),

         Container(
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getWidth(18), horizontal: AppLayout.getWidth(18)),
      decoration: BoxDecoration(
          color: const Color(0xD91130CE),
          borderRadius: BorderRadius.circular(AppLayout.getWidth(10))),
      child:  Center(
        child: Text(
              "Find tickets",
              style: Styles.textStyle.copyWith(color: Colors.white,),
            ),
      )
      ),
      Gap(AppLayout.getHeight(40)),
      const  AppDoubleTextWidget(bigText: "Upcoming Flights", smallText: "View All"),
    

      ])
    );
  }
}