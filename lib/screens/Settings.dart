import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/models/edit_setting.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         const   Text(
              'Setting',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/p3.png',
                    width: 60,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                const  Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        'Venuja',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xfffff3d00),
                        borderRadius: BorderRadius.circular(16)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditAccountSetting(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit,
                        color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
          const  Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xfffff3d00),
                ),
                child: const Icon(Icons.notifications, color: Colors.white,),
              ),
              title: const Text('Notification'),

              trailing: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

             ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xfffff3d00),
                ),
                child: const Icon(Icons.help, color: Colors.white,),
              ),
              title: const Text('Help'),

              trailing: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
              const SizedBox(
              height: 20,
            ),

             ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xfffff3d00),
                ),
                child: const Icon(Icons.logout, color: Colors.white,),
              ),
              title: const Text('Logout'),

              trailing: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child:  IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditAccountSetting(),
                    ),
                    );
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
