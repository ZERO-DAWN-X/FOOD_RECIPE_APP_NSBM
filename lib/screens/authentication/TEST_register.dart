import 'package:flutter/material.dart';
import '../../constants/images.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {
 //funtion
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage("assets/images/1 (27).jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.4),
                      BlendMode.darken
                      ),
                    ),
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 0,
          
          
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 50,),
                  
                      const Text("REGISTER", style: TextStyle(fontFamily: "poppins", fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),),
                            
                      const SizedBox(height: 250,),
                  
                      Form(
                        key: _formKey,
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
                  
                                  decoration: textField_Decoration,
                              ),
                            ),

                            const SizedBox(height: 10,),

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
                  
                            const SizedBox(height: 10,),

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
    
                              decoration: textField_Decoration.copyWith(hintText: "Re enter password")
                              
                            ),
                          ),

                          const SizedBox(height: 20,),

                          //error text
                          Text(error, style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                            ),
                          ),

                          const SizedBox(height: 10,),

                          Row(
          
                            mainAxisAlignment: MainAxisAlignment.center,
          
                            children: [
                              const Text("If You Have Account  ", style: TextStyle(
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
                              
                                child: const Text("LOGIN", style: TextStyle(
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

                          const SizedBox(height: 20,),

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

                        const SizedBox(height: 40,),

                          Container(
                            height: 40,
                            width: 330,
                            decoration: LogBtn.copyWith(
                              color: const Color.fromARGB(255, 219, 84, 21),
                            ),
                            child: TextButton(
                              onPressed: ()async{
                                dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                if (result == null) {
                                  setState(() {
                                    error = "Please enter valid email and password.";
                                  });
                                }
                              },
                              child: Text("CREATE ACCOUNT",
                              style: LogBtnStyle,)
                             ),
                          )
                          ],
                        ),
                      ),
                    
                    ],
                  ),
                ),
                
              ),
                
            ],
          ),
        ),
      ),
    );
  }
}