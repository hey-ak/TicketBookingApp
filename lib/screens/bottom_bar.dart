import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ticketbooking/screens/home_screen.dart';
import 'package:ticketbooking/screens/search.dart';
import 'package:ticketbooking/screens/ticket_scrren.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selected_index = 0;
  static final List<Widget> _widgetoptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    const TicketScreen(),
    const Text("Profile"),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selected_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: Center(
        child: _widgetoptions[selected_index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected_index,
          onTap: _onItemTapped,
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color(0xFF526480),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
                label: "Ticket"),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                label: "Ticket"),
          ]),
    );
  }
}
