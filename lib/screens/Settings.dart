import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipe_app_nsbm/screens/settings/edit_setting.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    super.key,
  });

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  //current user
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(40)),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
              ),
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Image.asset(
                'assets/images/p3.png',
                width: 60,
                        height: 100,
              ),
              const SizedBox(
                height: 5,
              ),
               Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            //current user email
                            currentUser.email!,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
              
              
              const SizedBox(
                height: 150,
              ),



              //profile
              GestureDetector(
                             onTap:() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditAccountSetting()));
                        },
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xfffff3d00),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  'Profile',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                     
                         Container(
                          width: MediaQuery.of(context).size.width /
                              3, 
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                      
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),



              // contact us
              GestureDetector(
                            onTap:() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditAccountSetting()));
                        }, 
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xfffff3d00),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  'Contact us',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                     
                         Container(
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                      
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),



              //info
              GestureDetector(
                onTap:() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditAccountSetting()));
                        }, 
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          decoration: const BoxDecoration(
                            color: Color(0xfffff3d00),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                child: const Icon(
                                  Icons.info,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  'Info',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                         Container(
                          width: MediaQuery.of(context).size.width /
                              3, 
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                      
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),



              //logout
              GestureDetector(
                onTap:() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditAccountSetting()));
                        }, 
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          decoration: const BoxDecoration(
                            color: Color(0xfffff3d00),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                child: const Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  'Log Out',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                         Container(
                          width: MediaQuery.of(context).size.width /
                              3, 
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        );
  }
}
