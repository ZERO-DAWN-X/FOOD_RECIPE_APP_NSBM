import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/services/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/images.dart';

class SignInPage extends StatefulWidget {
  //Function to toggle between SignIn and SignUp Page
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
        child: Column(
          children: [
            Container(
              height: 340,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(140)),
                image: DecorationImage(
                    image: AssetImage('assets/images/b5.png'),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(140)),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 20,
                    child: SizedBox(
                      width: 80,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () async {
                          dynamic result = await _auth.signInAnonymously();
                          if (result == null) {
                          } else {
                          }
                        },
                        child: const Center(
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                // ignore: use_full_hex_values_for_flutter_colors
                                color: Color(0xfffff3d00),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 130, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back",
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Sign in to continue",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            // ignore: use_full_hex_values_for_flutter_colors
                            color: Color(0xfffff3d00),
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            fontFamily: "poppins"),
                      ),
                      Text(
                        " Cooking",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            fontFamily: "poppins"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Form(
                    key: _formKey, // Validation

                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          error,
                          style: const TextStyle(
                              // ignore: use_full_hex_values_for_flutter_colors
                              color: Color(0xfffff3d00), fontSize: 12.0),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        SizedBox(
                          height: 45,
                          width: 340,
                          child: TextFormField(
                              validator: (value) =>
                                  value!.isEmpty == true ? "Enter Email" : null,
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
                          height: 45,
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
                          height: 15,
                        ),
                        Text(
                          "Forgot Password?",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            // ignore: use_full_hex_values_for_flutter_colors
                            color: const Color(0xfffff3d00),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
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
                                      // ignore: use_full_hex_values_for_flutter_colors
                                      color: Color(0xfffff3d00)),
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
                              width: 15,
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
                        const SizedBox(
                          height: 40,
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
                            height: 45,
                            width: 340,
                            decoration: LogBtn,
                            // border: Border.all(width: 2,color: Color(0xfff1976D2))

                            child: Center(
                              child: Text("SIGN IN", style: LogBtnStyle),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
