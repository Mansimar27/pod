import 'package:date_time_picker_widget/date_time_picker_widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'pod.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color color = Colors.grey.shade300;
  Color text = Colors.black;

  String poddate = ' ';
  String day = ' ';

  String api = 'https://api.nasa.gov/planetary/apod?api_key=mdGBo9zvTZtMPs850E74FGGK0NCRLfYmuTubJv9I';

  String pic = 'https://www.elegantthemes.com/blog/wp-content/uploads/2020/02/000-404.png' ;

  Future<void> call() async {
    var url = await http.get(Uri.parse('$api&date=$poddate'));
    setState(() {
      pic = jsonDecode(url.body)['url'];
    });
  }

  Future<void> getDate() async {
    showModalBottomSheet<void>(
        context: context,
        builder: (_) {
          return Container(
            height: MediaQuery.of(context).size.height*0.4,
            width: double.infinity,
            color: Colors.white,
            child: Center(
              child: DateTimePicker(
                datePickerTitle: 'Select Date',
                type: DateTimePickerType.Date,
                numberOfWeeksToDisplay: 4,
                endDate: DateTime.now(),
                startDate: DateTime.utc(1999),
                initialSelectedDate: DateTime.utc(2000),
                onDateChanged: (date) {
                  setState(() {
                    poddate = DateFormat('yyyy-MM-dd').format(date) ;
                    day = DateFormat('EEEEE').format(date);
                    if(day == 'Monday') {
                      color = Colors.blue;
                    }
                    else if(day == 'Tuesday') {
                      color = Colors.grey;
                    }
                    else if(day == 'Wednesday') {
                      color = Colors.white;
                    }
                    else if(day == 'Thursday') {
                      color = Colors.green;
                    }
                    else if(day == 'Friday') {
                      color = Colors.red;
                    }
                    else if(day == 'Saturday') {
                      color = Colors.pink;
                    }
                    else if(day == 'Sunday') {
                      color = Colors.yellow;
                    }
                  });
                },
              ),
            ),
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Zealth POD',style: TextStyle(
            color: Colors.white,
          ),),
          centerTitle: true,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/date.png',
                  width: double.infinity,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 125,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Text('Select a Date, for which you would like to see NASA\'s Picture of the Day!',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                        ),),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          getDate();
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: color,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.event,
                              color: text,
                              size: 33,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        call();
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return POD(pic: pic,);
                        }),);
                      },
                      child: Container(
                        width: 99,
                        height: 33,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text('Show',style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 44,
                          width: MediaQuery.of(context).size.width*0.49,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(poddate,style: TextStyle(
                              fontSize: 22,
                              color: text
                            ),),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 44,
                          width: MediaQuery.of(context).size.width*0.49,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(day,style: TextStyle(
                              fontSize: 22,
                              color: text,
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
