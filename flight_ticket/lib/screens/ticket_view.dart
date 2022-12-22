import 'package:flight_ticket/utils/app_layout.dart';
import 'package:flight_ticket/utils/app_styles.dart';
import 'package:flight_ticket/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  const TicketView({Key? key, required this.ticket}) : super(key: key);

  double getLayoutValue(double value, String axis) {
    return axis == "h" ? AppLayout.getHeight(value) : AppLayout.getWidth(value);
  }

  @override
  Widget build(BuildContext context) {
    final double value21 = getLayoutValue(21, "h");
    final double value10 = getLayoutValue(10, "h");
    final double value16 = getLayoutValue(16, "h");
    final double value12 = getLayoutValue(12, "h");
    final size = AppLayout.getSize(context);
    return SizedBox(
      height: getLayoutValue(200, "h"),
      width: size.width * 0.85,
      child: Container(
        margin: EdgeInsets.only(right: value16),
        child: Column(children: [
          /*
            showing the blue part of the card/ticket
            */
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(value21),
                      topRight: Radius.circular(value21)),
                  color: Styles.primaryColor),
              padding: EdgeInsets.all(value16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(ticket['from']['code'],
                          style: Styles.headLineStyle3
                              .copyWith(color: Colors.white)),
                      const Spacer(),
                      const ThickContainer(),
                      Expanded(
                        child: Stack(children: [
                          SizedBox(
                            height: getLayoutValue(24, "h"),
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                print(
                                    'The width is ${constraints.constrainWidth()}');
                                return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      (constraints.constrainWidth() / 6)
                                          .floor(),
                                      (index) => const SizedBox(
                                          height: 1,
                                          width: 3,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Colors.white),
                                          ))),
                                );
                              },
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: 1.5,
                              child: const Icon(
                                Icons.local_airport_rounded,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ]),
                      ),
                      const ThickContainer(),
                      const Spacer(),
                      Text(ticket['to']['code'],
                          style: Styles.headLineStyle3
                              .copyWith(color: Colors.white))
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: getLayoutValue(100, "w"),
                        child: Text(
                          ticket['from']['name'],
                          style: Styles.headLineStyle4
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Text(
                        ticket['flying_time'],
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        width: getLayoutValue(100, "w"),
                        child: Text(
                          ticket['to']['name'],
                          textAlign: TextAlign.end,
                          style: Styles.headLineStyle4
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              )),
          /*
            showing the red part dots of the card/ticket
            */
          Container(
            color: Styles.orangeColor,
            child: Row(children: [
              SizedBox(
                height: getLayoutValue(20, "h"),
                width: getLayoutValue(10, "w"),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(value10),
                          bottomRight: Radius.circular(value10)),
                      color: Colors.white),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(value12),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      print('The width is ${constraints.constrainWidth()}');
                      return Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            (constraints.constrainWidth() / 15).floor(),
                            (index) => const SizedBox(
                                height: 1,
                                width: 5,
                                child: DecoratedBox(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                ))),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: getLayoutValue(20, "h"),
                width: getLayoutValue(10, "w"),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(value10),
                          bottomLeft: Radius.circular(value10)),
                      color: Colors.white),
                ),
              ),
            ]),
          ),
          /*
            showing the red part of the card/ticket
            */
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(value21),
                    bottomRight: Radius.circular(value21)),
                color: Styles.orangeColor),
            padding: EdgeInsets.only(
                left: value16, top: value10, right: value16, bottom: value16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ticket['date'],
                        style: Styles.headLineStyle3
                            .copyWith(color: Colors.white)),
                    const Gap(5),
                    Text("Date",
                        style: Styles.headLineStyle4
                            .copyWith(color: Colors.white)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(ticket['departure_time'],
                        style: Styles.headLineStyle3
                            .copyWith(color: Colors.white)),
                    const Gap(5),
                    Text("Departure time",
                        style: Styles.headLineStyle4
                            .copyWith(color: Colors.white)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${ticket['number']}',
                        style: Styles.headLineStyle3
                            .copyWith(color: Colors.white)),
                    const Gap(5),
                    Text("Number",
                        style: Styles.headLineStyle4
                            .copyWith(color: Colors.white)),
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
