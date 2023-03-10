import 'package:flight_ticket/screens/hotel_view.dart';
import 'package:flight_ticket/screens/ticket_view.dart';
import 'package:flight_ticket/utils/app_info_list.dart';
import 'package:flight_ticket/utils/app_styles.dart';
import 'package:flight_ticket/widgets/title_bar.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgColor,
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
                            Text("Good Morning", style: Styles.headLineStyle3),
                            const Gap(5),
                            Text('Book Tickets', style: Styles.headLineStyle)
                          ]),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/img_1.png'))),
                      )
                    ],
                  ),
                  const Gap(25),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF4F6FD)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: Row(
                      children: [
                        const Icon(FluentSystemIcons.ic_fluent_search_regular,
                            color: Color(0xFFBFC205)),
                        const Gap(10),
                        Text(
                          "Search",
                          style: Styles.headLineStyle4,
                        )
                      ],
                    ),
                  ),
                  const Gap(40),
                  const TitleBar(
                      title: "Upcoming Flights", subTitle: "View All"),
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
                        .toList())),
            const Gap(15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const TitleBar(title: "Hotels", subTitle: "View All"),
            ),
            const Gap(15),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                    children: hotelList
                        .map((singleHotel) => HotelView(hotel: singleHotel))
                        .toList())),
          ],
        ));
  }
}
