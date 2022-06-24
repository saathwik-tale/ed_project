// import 'package:awesome_app/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class SettingsOnePage extends StatefulWidget {
  static final String path = "lib/settings_page.dart";
  const SettingsOnePage({Key? key}) : super(key: key);

  @override
  State<SettingsOnePage> createState() => _SettingsOnePageState();
}

class _SettingsOnePageState extends State<SettingsOnePage> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 3,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
        title: Text(
          "Settings",
          style: TextStyle(
              color: Colors.black, fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Color.fromRGBO(13, 98, 124, 1),
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      "Vivek",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      CupertinoIcons.profile_circled,
                      color: Colors.white,
                      size: 30,
                    ),
                    // trailing: Icon(Icons.edit,color: Colors.white,),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 10.0,
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey.shade400,
                      ),
                      // ListTile(
                      //   leading: Icon(FontAwesomeIcons.language,color: Color.fromRGBO(13, 98, 124, 1),),
                      //   title: Text("Change Language",style: TextStyle(fontSize: 18.0)),
                      //   trailing: Icon(Icons.keyboard_arrow_right),
                      //   onTap: (){},
                      // )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.volume_up_outlined,
                        size: 30, color: Color.fromRGBO(13, 98, 124, 1)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Notification",
                      style: TextStyle(
                          color: Color.fromRGBO(13, 98, 124, 1),
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Divider(height: 20, thickness: 1),
                SizedBox(
                  height: 10,
                ),
                buildNotificationOption(
                    "Received notification", valNotify1, onChangeFunction1),
                buildNotificationOption(
                    "Received App Update ", valNotify2, onChangeFunction2),
                buildNotificationOption(
                    "Received newsletter", valNotify3, onChangeFunction3),
              ],
            ),
          ),
          Positioned(
            bottom: -20,
            left: -20,
            child: Container(
              width: 75,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromRGBO(13, 98, 124, 1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 00,
            left: 00,
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.powerOff,
                color: Colors.white,
              ),
              onPressed: () {
                //   Navigator.of(context)
                //     .push(
                //     MaterialPageRoute(builder: (context) => LoginPage()
                //     )
                // );
              },
            ),
          )
        ],
      ),
    );
  }

  Padding buildNotificationOption(
      String title, bool value, Function onChangedMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600]),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangedMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }
}
