import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:ticketbooking/screens/hotels_screen.dart';
import 'package:ticketbooking/screens/search.dart';
import 'package:ticketbooking/screens/ticket_scrren.dart';
import 'package:ticketbooking/screens/ticket_view.dart';
import 'package:ticketbooking/utils/app_info_list.dart';
import 'package:ticketbooking/utils/app_styles.dart';
import 'package:ticketbooking/widgets/double_text_widget.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ticketbooking/models/Flight.dart';

Future<List<Flight>> getRequest() async {
  //replace your restFull API here.
  String url = "";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body);

  //Creating a list to store input data;
  List<Flight> flights = [];
  for (var singleFlight in responseData) {
    // {"_id":"63c7c89091bffc1e7aab66c4","flightNumber":"DL123","airline":"Delta","departure":{"airport":"JFK","time":"2022-05-15T14:00:00.000Z"},"arrival":{"airport":"SFO","time":"2022-05-15T17:00:00.000Z"},"duration":180,"price":350,"capacity":200,"availableSeats":150,"status":"On
// Time"}
    Flight flight = Flight(
        id: singleFlight["_id"],
        flightNumber: singleFlight["flightnumber"],
        departure_time: singleFlight["departure"]["time"],
        departure_place: singleFlight["departure"]["airport"],
        arrival_place: singleFlight["arrival"]["airport"],
        arrival_time: singleFlight["departure"]["time"],
        flight_duration: singleFlight["duration"]);

    //Adding user to the list.
    flights.add(flight);
  }
  return flights;
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
    
  }
}

class HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgcolor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Elite Booking",
                          style: Styles.headLineStyle3,
                        ),
                        const Gap(5),
                        Text(
                          "Flight & Hotels",
                          style: Styles.headLineStyle,
                        ),
                        const Gap(25),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage("assets/images/p1.png"))),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF4F6FD)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Color(0xFFBFC205),
                      ),
                      ElevatedButton(
                        child: Text(
                          "Search",
                          style: Styles.headLineStyle4,
                        
                          
                          
                        ),
                        onPressed:(() =>  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SearchScreen()))),
                        
                      )
                    ],
                  ),
                ),
                const Gap(40),
                AppDoubleTextWidget(
                    bigText: "Upcoming Flights", smallText: "View All"),
              ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: ticketList
                  .map((singleTicket) => TicketView(ticket: singleTicket))
                  .toList(),
            ),
          ),
          const Gap(15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                AppDoubleTextWidget(bigText: "Hotels", smallText: "View All"),
          ),
          const Gap(15),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: hotelList
                    .map((singlehotel) => HotelScreen(hotel: singlehotel))
                    .toList(),
              ))
        ],
      ),
    );
  }
}
