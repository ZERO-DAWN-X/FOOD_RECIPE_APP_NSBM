import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/services/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/images.dart';

class SignInPage extends StatefulWidget {
  //Funtion
  final Function toggleView;
  //Constructor
  const SignInPage({required this.toggleView, super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true; // Initially hide password text

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage('assets/images/b5.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontFamily: "poppins"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey, // Validation

                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            error,
                            style: TextStyle(
                                color: Color(0xfffFF3D00), fontSize: 12.0),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          SizedBox(
                            height: 40,
                            width: 340,
                            child: TextFormField(
                                validator: (value) => value!.isEmpty == true
                                    ? "Enter Email"
                                    : null,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14),
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                decoration: textField_Decoration),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 40,
                            width: 340,
                            child: TextFormField(
                              validator: (value) => value!.isEmpty == true
                                  ? "Enter Password"
                                  : null,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                              obscureText:
                                  _obscureText, // Toggle password visibility
                              decoration: textField_Decoration.copyWith(
                                hintText: "Enter password",
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: IconButton(
                                    icon: Icon(
                                      size: 21,
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: const Color.fromARGB(
                                          255, 194, 194, 194),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText =
                                            !_obscureText; // Toggle password visibility
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Forgot Password?",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xfffFF3D00),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Login With Social Media Or  ",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(221, 31, 31, 31)),
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    widget.toggleView();
                                  },
                                  child: const Text(
                                    "REGISTER",
                                    style: TextStyle(
                                        fontFamily: "poppins",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xfffFF3D00)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/images/google.png",
                                    height: 33,
                                  )),
                              const SizedBox(
                                width: 13,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  "assets/images/fb.png",
                                  height: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);

                              if (result == null) {
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

                              child: Center(
                                  child: Text("SIGN IN", style: LogBtnStyle)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
