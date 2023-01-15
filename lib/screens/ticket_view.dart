import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:ticketbooking/utils/App_layout.dart';
import 'package:ticketbooking/widgets/thick_container.dart';

import '../utils/app_styles.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    return SizedBox(
      width: size.width*0.85,
      height: 200,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // showing the blue part of ticket
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFF526799),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                )),
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "PB",
                    style: Styles.headLineStyle3.copyWith(color: Colors.white),
                  ),
                  Expanded(child: Container()),
                  ThickContainer(),
                  Expanded(
                      child: Stack(children: [
                    SizedBox(
                      height: 24,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              (constraints.constrainWidth() / 6).floor(),
                              (index) => SizedBox(
                                  width: 3,
                                  height: 1,
                                  child: DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                  )),
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                        child: Transform.rotate(
                      angle: 1.5,
                      child: Icon(
                        Icons.local_airport_rounded,
                        color: Colors.white,
                      ),
                    )),
                  ])),
                  ThickContainer(),
                  Expanded(child: Container()),
                  Text("DL",
                      style: Styles.headLineStyle3.copyWith(
                        color: Colors.white,
                      ))
                ],
              ),
              const Gap(3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Punjab",
                      style:
                          Styles.headLineStyle4.copyWith(color: Colors.white),
                    ),
                  ),
                  Text(
                    "8H 30M",
                    style: Styles.headLineStyle4.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Delhi",
                      textAlign: TextAlign.end,
                      style:
                          Styles.headLineStyle4.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              )
            ]),
          ),
          Container(
            color: Styles.orangeColor,
            child: Row(
              children: [
                const SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ))),
                ),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                          (constraints.constrainWidth()/15).floor(),
                          (index) => const SizedBox(
                            width: 5,
                            height: 1,
                            child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white)),
                          ),
                        ),
                      );
                    },
                  ),
                )),
                const SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ))),
                ),
              ],
            ),
          ),
          // Bottom Orange Part
          Container(
             decoration: BoxDecoration(
                color: Styles.orangeColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(21),
                  bottomRight: Radius.circular(21),
                )),
            padding: const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("15 JAN", style: Styles.headLineStyle3.copyWith(color:Colors.white),),
                        const Gap(5),
                        Text("Date", style: Styles.headLineStyle4.copyWith(color:Colors.white),),

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("08:00 AM", style: Styles.headLineStyle3.copyWith(color:Colors.white),),
                        const Gap(5),
                        Text("Departure time", style: Styles.headLineStyle4.copyWith(color:Colors.white),),

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("23", style: Styles.headLineStyle3.copyWith(color:Colors.white),),
                        const Gap(5),
                        Text("Number", style: Styles.headLineStyle4.copyWith(color:Colors.white),),

                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
