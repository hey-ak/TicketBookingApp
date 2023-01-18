import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbooking/screens/ticket_view.dart';
import 'package:ticketbooking/utils/App_layout.dart';
import 'package:ticketbooking/utils/app_info_list.dart';
import 'package:ticketbooking/widgets/tickets_tabs.dart';

import '../utils/app_styles.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    return Scaffold(
      backgroundColor: Styles.bgcolor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20,), vertical: AppLayout.getHeight(20)),
            children: [
              Gap(AppLayout.getHeight(40)),
              Text(
                "Tickets",
                style: Styles.headLineStyle,
              ),
              Gap(AppLayout.getHeight(20)),
              const AppTicketTabs(firstTab: "Upcoming", secondTab:"Previous" ),
               Gap(AppLayout.getHeight(20)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(ticket: ticketList[0],isColor: true,),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
