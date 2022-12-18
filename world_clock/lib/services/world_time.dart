import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime{
  String location = '';
  String time = '';
  String flag = '';
  String url = '';
  bool isDayTime = true;

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async {
    //make the request
    var url = Uri.http("worldtimeapi.org", "/api/timezone/${this.url}");
    try {
      Response response = await get(url);
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(dateTime);
      // print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time to property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }catch (e){
      print('Caught Error: $e');
      time = 'oh! oh! please try again';
    }
  }

}



