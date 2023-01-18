import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:ticketbooking/utils/App_layout.dart';
import 'package:ticketbooking/utils/app_info_list.dart';
import 'package:ticketbooking/widgets/thick_container.dart';

import '../utils/app_styles.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({Key? key, required this.ticket, this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: 200,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // showing the blue part of ticket
          Container(
            decoration: BoxDecoration(
                color:isColor==null? const Color(0xFF526799):Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                )),
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    ticket["from"]["code"],
                    style:isColor==null? Styles.headLineStyle3.copyWith(color: Colors.white):Styles.headLineStyle3,
                  ),
                  Expanded(child: Container()),
                  ThickContainer(isColor:true),
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
                        color: isColor==null? Colors.white:Color(0xFF8ACCF7),
                      ),
                    )),
                  ])),
                  ThickContainer(isColor:true),
                  Expanded(child: Container()),
                  Text(ticket["to"]["code"],
                      style: isColor==null?Styles.headLineStyle3.copyWith(
                        color: Colors.white,
                      ):Styles.headLineStyle3)
                ],
              ),
              const Gap(3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      ticket["from"]["name"],
                      style:isColor==null?
                          Styles.headLineStyle4.copyWith(color: Colors.white):Styles.headLineStyle4,
                    ),
                  ),
                  Text(
                    ticket["flying_time"],
                    style: isColor==null?Styles.headLineStyle4.copyWith(color: Colors.white):Styles.headLineStyle4,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      ticket["to"]["name"],
                      textAlign: TextAlign.end,
                      style:isColor==null?
                          Styles.headLineStyle4.copyWith(color: Colors.white):Styles.headLineStyle4,
                    ),
                  ),
                ],
              )
            ]),
          ),
          Container(
            color:isColor==null? Styles.orangeColor:Colors.white,
            child: Row(
              children: [
                 SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: isColor==null? Colors.grey.shade200: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ))),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                          (constraints.constrainWidth() / 15).floor(),
                          (index) =>  SizedBox(
                            width: 5,
                            height: 1,
                            child: DecoratedBox(
                                decoration: BoxDecoration(color:isColor==null? Colors.white:Colors.grey.shade300)),
                          ),
                        ),
                      );
                    },
                  ),
                )),
                 SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: isColor==null? Colors.grey.shade200: Colors.white,
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
                color: isColor==null? Styles.orangeColor: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(21),
                  bottomRight: Radius.circular(21),
                )),
            padding:
                const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ticket["date"],
                          style: isColor==null?Styles.headLineStyle3
                              .copyWith(color: Colors.white):Styles.headLineStyle3,
                        ),
                        const Gap(5),
                        Text(
                          "Date",
                          style: isColor==null? Styles.headLineStyle4
                              .copyWith(color: Colors.white):Styles.headLineStyle4,
                        ),
                      
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ticket["departure_time"],
                          style: isColor==null? Styles.headLineStyle3
                              .copyWith(color: Colors.white):Styles.headLineStyle3,
                        ),
                        const Gap(5),
                        Text(
                          "Departure time",
                          style: isColor==null? Styles.headLineStyle4
                              .copyWith(color: Colors.white):Styles.headLineStyle4,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          ticket["number"].toString(),
                          style: isColor==null? Styles.headLineStyle3
                              .copyWith(color: Colors.white):Styles.headLineStyle3,
                        ),
                        const Gap(5),
                        Text(
                          "Number",
                          style: isColor ==null?Styles.headLineStyle4
                              .copyWith(color: Colors.white):Styles.headLineStyle4,
                        ),
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
