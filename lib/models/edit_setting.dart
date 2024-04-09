import 'package:flutter/material.dart';

class EditAccountSetting extends StatefulWidget {
  const EditAccountSetting({super.key});

  @override
  State<EditAccountSetting> createState() => _EditAccountSettingState();
}

class _EditAccountSettingState extends State<EditAccountSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        
      ),
       body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         const   Text(
              'User Information',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xfffff3d00),
                ),
                child: const Icon(Icons.email, color: Colors.white,),
              ),
              title: const Text('Email'),

              trailing: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child:   IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAccountSetting(),
                  ),
                  );
                },
                icon: Icon(Icons.arrow_forward_ios),
                ),
                
              ),
            ),
            const SizedBox(height: 20,),
             ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xfffff3d00),
                ),
                child: const Icon(Icons.key_rounded, color: Colors.white,),
              ),
              title: const Text('Password'),

              trailing: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child:   IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAccountSetting(),
                  ),
                  );
                },
                icon: Icon(Icons.arrow_forward_ios),
                ),
                
              ),
            ),
          ]
        )
    ),
    
    );
  }
}