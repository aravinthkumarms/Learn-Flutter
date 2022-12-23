import 'package:barcode_widget/barcode_widget.dart';
import 'package:flight_ticket/screens/ticket_view.dart';
import 'package:flight_ticket/utils/app_info_list.dart';
import 'package:flight_ticket/utils/app_styles.dart';
import 'package:flight_ticket/widgets/dot_line_generator.dart';
import 'package:flight_ticket/widgets/ticket_tab.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../widgets/column_layout.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getHeight(15.5),
                vertical: AppLayout.getWidth(15.5)),
            children: [
              Gap(AppLayout.getHeight(40)),
              Text("Tickets",
                  style: Styles.headLineStyle.copyWith(fontSize: 32)),
              Gap(AppLayout.getHeight(20)),
              const AppTicketTab(firstTab: "Upcoming", secondTab: "Previous"),
              Gap(AppLayout.getHeight(20)),
              Container(
                  padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                  child: TicketView(ticket: ticketList[0], isColor: true)),
              const SizedBox(
                height: 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getHeight(15),
                    vertical: AppLayout.getWidth(15)),
                margin:
                    EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout(
                            firstText: "Flutter DB",
                            secondText: "Passenger",
                            alignment: CrossAxisAlignment.start,
                            isColor: true),
                        AppColumnLayout(
                            firstText: "5221 3421348",
                            secondText: "passport",
                            alignment: CrossAxisAlignment.end,
                            isColor: true),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const AppDotLayoutBuilder(
                      sections: 15,
                      isColor: true,
                      width: 5,
                    ),
                    Gap(AppLayout.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout(
                            firstText: "4378389 3488834",
                            secondText: "Number of E-Ticket",
                            alignment: CrossAxisAlignment.start,
                            isColor: true),
                        AppColumnLayout(
                            firstText: "B2SG28",
                            secondText: "Booking code",
                            alignment: CrossAxisAlignment.end,
                            isColor: true),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const AppDotLayoutBuilder(
                      sections: 15,
                      isColor: true,
                      width: 5,
                    ),
                    Gap(AppLayout.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/visa.png",
                                  scale: 11,
                                ),
                                Text(" *** 8743",
                                    style: Styles.headLineStyle3
                                        .copyWith(color: Colors.black))
                              ],
                            ),
                            const Gap(5),
                            Text(
                              "Payment method",
                              style: Styles.headLineStyle4,
                            )
                          ],
                        ),
                        const AppColumnLayout(
                            firstText: "\$323.88",
                            secondText: "Price",
                            alignment: CrossAxisAlignment.end,
                            isColor: true),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const SizedBox(
                      height: 1,
                    )
                  ],
                ),
              ),
              /*
                bar code
               */
              const SizedBox(
                height: 1,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: AppLayout.getHeight(15),
                    right: AppLayout.getHeight(15)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(AppLayout.getHeight(21)),
                      bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                    )),
                padding: EdgeInsets.only(
                    top: AppLayout.getHeight(20),
                    bottom: AppLayout.getHeight(20)),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppLayout.getHeight(15)),
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: 'https://github.com/aravinthkumarms',
                      drawText: false,
                      color: Styles.textColor,
                      width: double.infinity,
                      height: AppLayout.getHeight(70),
                    ),
                  ),
                ),
              ),
              Gap(AppLayout.getHeight(20)),
              Container(
                  padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                  child: TicketView(ticket: ticketList[0])),
            ],
          )
        ],
      ),
    );
  }
}
