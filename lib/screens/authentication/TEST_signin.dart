import 'package:flutter/material.dart';
import '../../constants/images.dart';
import '../../services/auth.dart';

class SignIn extends StatefulWidget {
  //funtion
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  //ref for the AuthService Class
  final AuthServices _auth = AuthServices();

  //Form Key

  final _formKey = GlobalKey<FormState>();

  //Email Password States
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    
      // appBar: AppBar(
    
      //   actions:[
          
      //     Expanded(
      //       child: Stack(
      //         children: [
      //         Positioned(
      //           left: 10,
      //           child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_rounded , color: Colors.white,)
      //           )
      //         ),
      //         ]
      //       ),
      //     )
      //   ],
    
      //   elevation: 0,
      //   backgroundColor: Colors.teal,
      // ),
    
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: bgImage,
          ),
          
          height: MediaQuery.of(context).size.height - 0,
    
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                const SizedBox(height: 50,),
    
                const Text("SIGN  IN", style: TextStyle(fontFamily: "poppins", fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),),
          
                const SizedBox(height: 150,),
            
                // Center(
                //   child: Container (
                //     decoration: BoxDecoration(
                //       // borderRadius: BorderRadius.circular(100),
                //       // image: DecorationImage(image: AssetImage("assets/images/3.jpg"), fit: BoxFit.cover),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.grey.withOpacity(0.5),
                //           spreadRadius: 5,
                //           blurRadius: 100,
                //           offset: const Offset(0, 3), // changes position of shadow
                //         )
                //       ]
                //     ),
                    
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(100),
                //       child: Image.asset("assets/images/3.jpg",height: 200,width: 200,fit: BoxFit.cover,)
                //       )
                //     )
                //   ),
          
                  const SizedBox(height: 30,),
            
                  Form(
                    key: _formKey, // Validation
            
                      child: Column(
                        children: [
          
                          SizedBox(
                            height: 45,
                            width: 340,
                            child: TextFormField(
                              validator: (value) => value!.isEmpty == true ? "Enter Email" : null,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14
                              ),
                                        
                              onChanged: (value){
                                setState(() {
                                  email = value;
                                });
                              },
                                        
                              decoration: textField_Decoration
                            ),
                          ),
          
                          const SizedBox(height: 20,),
            
                          SizedBox(
                            height: 45,
                            width: 340,
                            child: TextFormField(
                                        
                              validator: (value) => value!.length < 6 ? "Enter Password 6 charactors long" : null,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14
                              ),                                        
                              onChanged: (value){
                                setState(() {
                                  password = value;
                                });
                              },
                              obscureText: true,
    
                              decoration: textField_Decoration.copyWith(hintText: "Password")
                              
                            ),
                          ),
            
                         const SizedBox(height: 30,),

                          Text(error, style: const TextStyle(color: Colors.red, fontSize: 14),),

                          const SizedBox(height: 10,),
            
                          Row(
          
                            mainAxisAlignment: MainAxisAlignment.center,
          
                            children: [
                              const Text("Login With Social Media Or ", style: TextStyle(
                              fontFamily: "poppins",
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 182, 182, 182)
                              ),
                            ),
          
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: (){
                                  widget.toggleView();
                                },
                              
                                child: const Text("REGISTER", style: TextStyle(
                                  fontFamily: "poppins",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xfff1877F2)
                                  ),
                                ),
                              ),
                            ),
          
                            ]
                          ),
            
                        const SizedBox(height: 30,),
            
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset("assets/images/google.png",height: 43,)
                              ),
                              
                              const SizedBox(width: 15,),
                            
                              GestureDetector(
                              onTap: () {},
                              child: Image.asset("assets/images/fb.png",height: 40,)
                              ),
                          ],
                        ),
            
                        const SizedBox(height: 60,),
            
                          // Button
          
                          GestureDetector(
                            onTap: () async{
                              dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                              if(result == null){
                                setState(() {
                                  error = "Invalid Email or Password";
                                });
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 320,
                              decoration: LogBtn,
                                // border: Border.all(width: 2,color: Color(0xfff1976D2))
                              
                              child: Center(child: Text("SIGN IN", style: LogBtnStyle
                              )
                              ),
                            ),
                          ),
          
                          const SizedBox(height: 15,),

                          Container(
                            height: 40,
                            width: 320,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xfffEC1B13),
                              ),
                            
                              child: Center(child: Text("GUEST", style: LogBtnStyle),),
                            
                              onPressed: () async {
                                dynamic result = await _auth.signInAnonymously();
                                if(result == null){
                                    print("Error Signing In");
                                    }else{
                                    print("Signed In");
                                    print(result.uid);
                                  }
                                },
                              ),
                          ),
          
                          // GestureDetector(
                          //   onTapDown: (TapDownDetails details) async {
                          //     dynamic result = await _auth.signInAnonymously();
                          //       if(result == null){
                          //           print("Error Signing In");
                          //           }else{
                          //           print("Signed In");
                          //           print(result.uid);
                          //         }
                          //   },
                            
                          //   child: Container(
                          //     height: 40,
                          //     width: 150,
                          //     decoration: LogBtn.copyWith(color: Color(0xfffEC1B13)),
                          //       // border: Border.all(width: 2,color: Colors.teal)
                              
                          //     child: Center(child: Text("GUEST", style: LogBtnStyle
                          //     ),
                          //   ),
                          // ),
    
                          // ),
          
                        ],
                      ),
                    )
                ],
            ),
          ),
        ),
      ),
    );
  }
}

// ElevatedButton(
//         child: const Text("GUEST LOGIN"),
//         onPressed: () async {
//           dynamic result = await _auth.signInAnonymously();
//           if(result == null){
//               print("Error Signing In");
//               }else{
//               print("Signed In");
//               print(result.uid);
//             }
//           },
//       ),

