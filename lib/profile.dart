import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  //Name (start)

  String name = 'Name' ;

  final nameControl = TextEditingController();

  Future<void> getName() async {
    showDialog(context: context, builder: (_) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Name',style: TextStyle(
          color: Colors.black,
        ),),
        content: TextFormField(
          controller: nameControl,
          cursorColor: Colors.black,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'Enter Your Name',
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel',style: TextStyle(
                color: Colors.black,
              ),),
          ),
          ElevatedButton(
              onPressed: () {
                    setState(() {
                      name = nameControl.text;
                    });
                    Navigator.pop(context);
                },
              child: const Text('Save',style: TextStyle(
                color: Colors.black,
              ),),
          ),
        ],
      );
    });
  }

  //Name (end)

  //Phone (start)

  String phone = 'Phone Number' ;

  final phoneControl = TextEditingController();

  Future<void> getPhone() async {
    showDialog(context: context, builder: (_) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Phone Number',style: TextStyle(
          color: Colors.black,
        ),),
        content: TextFormField(
          controller: phoneControl,
          cursorColor: Colors.black,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter Your Phone Number',
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel',style: TextStyle(
              color: Colors.black,
            ),),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                phone = phoneControl.text;
              });
              Navigator.pop(context);
            },
            child: const Text('Save',style: TextStyle(
              color: Colors.black,
            ),),
          ),
        ],
      );
    });
  }

  //Phone (end)

  //Mail (start)

  String mail = 'E-Mail ID' ;

  final mailControl = TextEditingController();

  Future<void> getMail() async {
    showDialog(context: context, builder: (_) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('E-Mail ID',style: TextStyle(
          color: Colors.black,
        ),),
        content: TextFormField(
          controller: mailControl,
          cursorColor: Colors.black,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Enter Your E-Mail ID',
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel',style: TextStyle(
              color: Colors.black,
            ),),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                mail = mailControl.text;
              });
              Navigator.pop(context);
            },
            child: const Text('Save',style: TextStyle(
              color: Colors.black,
            ),),
          ),
        ],
      );
    });
  }

  //Mail (end)

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Profile',style: TextStyle(
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
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/profile.png',
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
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 44,
                    width: double.infinity,
                    color: Colors.white,
                    child: const Center(
                      child: Text('Tap on Category to enter your information.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      getName();
                    },
                    child: SizedBox(
                      height: 25,
                      width: double.infinity,
                      child: Center(
                        child: Text(name,style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      getPhone();
                    },
                    child: SizedBox(
                      height: 25,
                      width: double.infinity,
                      child: Center(
                        child: Text(phone,style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      getMail();
                    },
                    child: SizedBox(
                      height: 25,
                      width: double.infinity,
                      child: Center(
                        child: Text(mail,style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
