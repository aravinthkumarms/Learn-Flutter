import 'package:flight_ticket/utils/app_layout.dart';
import 'package:flight_ticket/utils/app_styles.dart';
import 'package:flight_ticket/widgets/column_layout.dart';
import 'package:flight_ticket/widgets/dot_line_generator.dart';
import 'package:flight_ticket/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({Key? key, required this.ticket, this.isColor})
      : super(key: key);

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
      height: getLayoutValue(172, "h"),
      width: size.width * 0.88,
      child: Container(
        margin: EdgeInsets.only(right: value16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          /*
            showing the blue part of the card/ticket
            */
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(value21),
                      topRight: Radius.circular(value21)),
                  color:
                      isColor == null ? const Color(0xFF526799) : Colors.white),
              padding: EdgeInsets.all(value16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(ticket['from']['code'],
                          style: isColor != null
                              ? Styles.headLineStyle3
                                  .copyWith(color: Colors.black)
                              : Styles.headLineStyle3
                                  .copyWith(color: Colors.white)),
                      const Spacer(),
                      ThickContainer(isColor: isColor),
                      Expanded(
                        child: Stack(children: [
                          SizedBox(
                              height: getLayoutValue(24, "h"),
                              child: AppDotLayoutBuilder(
                                  sections: 6, isColor: isColor)),
                          Center(
                            child: Transform.rotate(
                              angle: 1.5,
                              child: Icon(
                                Icons.local_airport_rounded,
                                color: isColor != null
                                    ? const Color(0xFF8AccF7)
                                    : Colors.white,
                              ),
                            ),
                          )
                        ]),
                      ),
                      ThickContainer(isColor: isColor),
                      const Spacer(),
                      Text(ticket['to']['code'],
                          style: isColor != null
                              ? Styles.headLineStyle3
                                  .copyWith(color: Colors.black)
                              : Styles.headLineStyle3
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
                          style: isColor != null
                              ? Styles.headLineStyle3
                              : Styles.headLineStyle3
                                  .copyWith(color: Colors.white),
                        ),
                      ),
                      Text(
                        ticket['flying_time'],
                        style: isColor != null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.black)
                            : Styles.headLineStyle3
                                .copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        width: getLayoutValue(100, "w"),
                        child: Text(
                          ticket['to']['name'],
                          textAlign: TextAlign.end,
                          style: isColor != null
                              ? Styles.headLineStyle3
                              : Styles.headLineStyle3
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
            color: isColor == null ? Styles.orangeColor : Colors.white,
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
                    child: AppDotLayoutBuilder(
                      sections: 15,
                      isColor: isColor,
                      width: 5,
                    )),
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
                    bottomLeft: Radius.circular(isColor == null ? value21 : 0),
                    bottomRight:
                        Radius.circular(isColor == null ? value21 : 0)),
                color: isColor == null ? Styles.orangeColor : Colors.white),
            padding: EdgeInsets.only(
                left: value16, top: value10, right: value16, bottom: value16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppColumnLayout(
                    firstText: ticket['date'],
                    secondText: "Date",
                    alignment: CrossAxisAlignment.start,
                    isColor: isColor),
                AppColumnLayout(
                    firstText: ticket['departure_time'],
                    secondText: "Departure time",
                    alignment: CrossAxisAlignment.center,
                    isColor: isColor),
                AppColumnLayout(
                    firstText: '${ticket['number']}',
                    secondText: "Number",
                    alignment: CrossAxisAlignment.end,
                    isColor: isColor),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
