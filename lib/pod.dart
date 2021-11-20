import 'package:flutter/material.dart';
import 'profile.dart';

class POD extends StatefulWidget {
  final String pic ;
  const POD({Key? key, required this.pic}) : super(key: key);

  @override
  State<POD> createState() => _PODState();
}

class _PODState extends State<POD> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Picture of the Day',style: TextStyle(
            color: Colors.white,
          ),),
          centerTitle: true,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        endDrawer: Drawer(
          elevation: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const Profile();
              }),);
            },
            child: const DrawerHeader(
              child: Text('Profile',style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),),
            ),
          ),
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/pod.png',
                      height: MediaQuery.of(context).size.height*0.2,
                    ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.network(widget.pic,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
