import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/auth.dart';

const tealColor = Colors.teal;

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {

  //ref for the AuthService Class

  final AuthServices _auth = AuthServices();


  @override
  Widget build(BuildContext context) {
    
    
    return SafeArea(
      child: Scaffold(
      
        appBar: AppBar(
          title: Text("FireBase Login",
          style: GoogleFonts.roboto(color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold
          ),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 107, 96),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
          ],
        ),
      
        body: Container(

          decoration: const BoxDecoration(
            color: Colors.teal
          ),

          child: SingleChildScrollView(
            
            child: Column(
              
              children: [
                
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.teal
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ZERO",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 40,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
            
                        Text(
                            " Infinite",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                      ]
                    )
                    
                  ),
                ),
                
                SizedBox(
                  height: 200,
                  child: Image.asset("assets/images/hero_image.png"),
                  ),
            
                Container(       // 2nd Section ------------------------------------------------------>
                  
                  width: double.infinity,
                  
                  

                  child: Column(
                    children: [
            
                      const SizedBox(height: 10),     // Space between the two texts
            
                      Container(
                        
                        
                        width: double.infinity,
                        
            
                        child: Padding(
                          padding: EdgeInsets.all(35.0),
                          child: Column(
                            children: [
                              
                              SizedBox(
                                width: 400,
                                height: 45,
                          
                                child: TextField(
                                  
                                  decoration: InputDecoration(
                                    hintText: "E-mail Address",
                                    hintStyle: const TextStyle(fontSize: 15,fontStyle: FontStyle.italic,color: Colors.white54),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none
                                    ),
                                
                                    fillColor: Colors.grey,
                                    filled: true
                                  ),
                                ),
                              ),
                          
                              const SizedBox(height: 10),   //Space between password fields
                          
                              SizedBox(
                          
                                width: 400,
                                height: 45,
                          
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: const TextStyle(fontSize: 15,fontStyle: FontStyle.italic,color: Colors.white54),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none
            
                                    ),
            
                                    fillColor: Colors.grey,
                                    filled: true
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
            
            
                      ),
            
                      const SizedBox(height: 10),
            
                      Container(
                        width: double.infinity,
                        
                        height: MediaQuery.of(context).size.height * 0.35,
                        
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 100,
            
                                child: ElevatedButton(
                                  child: const Text("Guest"),
            
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
                            )
                          ],
                        ),
            
                      )
                    ],
                  ),
            
            
            
                ),
              ],
            ),
          ),
        ),

      
      ),
    );
  }
}