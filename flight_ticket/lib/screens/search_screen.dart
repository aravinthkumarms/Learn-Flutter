import 'package:flight_ticket/utils/app_layout.dart';
import 'package:flight_ticket/utils/app_styles.dart';
import 'package:flight_ticket/widgets/icon_text_widget.dart';
import 'package:flight_ticket/widgets/ticket_tab.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/title_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
        backgroundColor: Styles.bgColor,
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(20),
              vertical: AppLayout.getHeight(20)),
          children: [
            Gap(AppLayout.getHeight(40)),
            Text(
              "What are\nyou looking for?",
              style: Styles.headLineStyle.copyWith(fontSize: 35),
            ),
            Gap(AppLayout.getHeight(20)),
            const AppTicketTab(firstTab: "Airline", secondTab: "Hotels"),
            Gap(AppLayout.getHeight(25)),
            const AppIconText(
                icon: Icons.flight_takeoff_rounded, text: "Departure"),
            Gap(AppLayout.getHeight(15)),
            const AppIconText(icon: Icons.flight_land_rounded, text: "Arrival"),
            Gap(AppLayout.getHeight(25)),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: AppLayout.getHeight(18),
                  horizontal: AppLayout.getWidth(15)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
                color: const Color(0xD91130CE),
              ),
              child: Center(
                child: Text(
                  'Find Tickets',
                  style: Styles.textStyle.copyWith(color: Colors.white),
                ),
              ),
            ),
            Gap(AppLayout.getHeight(40)),
            const TitleBar(title: "Upcoming Flights", subTitle: "View All"),
            Gap(AppLayout.getHeight(15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(AppLayout.getHeight(15)),
                  height: AppLayout.getHeight(425),
                  width: size.width * 0.42,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppLayout.getHeight(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 1,
                          spreadRadius: 2)
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                          height: AppLayout.getHeight(190),
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/sit.jpg')),
                              borderRadius: BorderRadius.circular(
                                  AppLayout.getHeight(12)))),
                      Gap(AppLayout.getHeight(12)),
                      Text(
                        "20% discount on the early booking of this flight.Don't miss.",
                        style: Styles.headLineStyle2.copyWith(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: size.width * 0.44,
                          height: AppLayout.getHeight(190),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3AB8B8),
                            borderRadius:
                                BorderRadius.circular(AppLayout.getHeight(18)),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: AppLayout.getHeight(15),
                              horizontal: AppLayout.getWidth(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Discount\nfor survey",
                                style: Styles.headLineStyle2.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Gap(AppLayout.getHeight(10)),
                              Text(
                                "Take the survey about our services and get discount",
                                style: Styles.headLineStyle3.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          right: -45,
                          top: -40,
                          child: Container(
                            padding: EdgeInsets.all(AppLayout.getHeight(30)),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 18, color: const Color(0xFF189999)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Gap(AppLayout.getHeight(15)),
                    Container(
                      height: AppLayout.getHeight(210),
                      padding: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(15),
                          horizontal: AppLayout.getWidth(15)),
                      width: size.width * 0.44,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppLayout.getHeight(18)),
                          color: const Color(0xFFEC6545)),
                      child: Column(
                        children: [
                          Text(
                            "Take Love",
                            style: Styles.headLineStyle2.copyWith(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Gap(AppLayout.getHeight(15)),
                          RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text: '😍', style: TextStyle(fontSize: 28)),
                              TextSpan(
                                  text: '🥰', style: TextStyle(fontSize: 44)),
                              TextSpan(
                                  text: '😘', style: TextStyle(fontSize: 28))
                            ]),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
