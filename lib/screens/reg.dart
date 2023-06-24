import 'package:brain_school/components/custom_buttons.dart';
import 'package:brain_school/constants.dart';
import 'package:brain_school/models/registrationmodel.dart';
import 'package:brain_school/screens/home_screen/home_screen.dart';
import 'package:brain_school/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

late bool _passwordVisible;

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  // form Key

  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    print("1234567890");

    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    Registrationmodel registration = Registrationmodel();

    registeruser(firstname, lastname, email, password) async {
      var data = {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password
      };
      var response = await http.post(
          Uri.parse("http://192.168.246.130:5000/register_user"),
          body: jsonEncode(data));
      print(response.body);

      registration = Registrationmodel.fromJson(jsonDecode(response.body));
      if (registration.status == "User Created Successfully") {
        Fluttertoast.showToast(msg: 'Account Created Successfully');
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        firstNameController.clear();
        lastNameController.clear();
        emailController.clear();
        confirmpasswordController.clear();
      }
    }

    return (Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            color: kOtherColor,
            //reusable radius,
            borderRadius: kTopBorderRadius,
          ),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                sizedBox,
                buildfirstnamefield(),
                sizedBox,
                buildlastnamefield(),
                sizedBox,
                buildEmailField(),
                sizedBox,
                buildPasswordField(),
                sizedBox,
                buildConfirmPasswordField(),
                sizedBox,
                SizedBox(
                  height: 20,
                ),
                DefaultButton(
                  // onPress: () {
                  //   // if (_formKey.currentState!.validate()) {
                  //   // login(emailController.text,
                  //   //     passwordController.text);

                  //   // }
                  // },
                  onPress: () {
                    registeruser(
                        firstNameController.text,
                        lastNameController.text,
                        emailController.text,
                        confirmpasswordController.text);
                  },
                  title: 'Register',
                  iconData: Icons.arrow_forward_outlined,
                ),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      )),
    ));
  }

  TextFormField buildfirstnamefield() {
    return TextFormField(
      controller: firstNameController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: 'First Name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(Icons.account_circle),
      ),
      validator: (value) {
        //for validation
        RegExp regExp = new RegExp(r'^.{3,}$');
        if (value == null || value.isEmpty) {
          return 'First Name Cannot be Empty!';
          //if it does not matches the pattern, like
          //it not contains @
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid Name(MIN 3 Character)';
        }
      },
    );
  }

  TextFormField buildlastnamefield() {
    return TextFormField(
      controller: lastNameController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: 'Last Name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(Icons.account_circle),
      ),
      validator: (value) {
        //for validation
        RegExp regExp = new RegExp(r'^.{3,}$');
        if (value == null || value.isEmpty) {
          return 'Last Name Cannot be Empty!';
          //if it does not matches the pattern, like
          //it not contains @
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid Name(MIN 3 Character)';
        }
      },
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      controller: emailController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: 'Email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(Icons.mail),
      ),
      validator: (value) {
        //for validation
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
          //if it does not matches the pattern, like
          //it not contains @
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid email address';
        }
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: kInputTextStyle,
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(Icons.security),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_off_outlined,
          ),
          iconSize: kDefaultPadding,
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Must be more than 5 characters';
        }
      },
    );
  }

  TextFormField buildConfirmPasswordField() {
    return TextFormField(
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: kInputTextStyle,
      controller: confirmpasswordController,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(Icons.key),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_off_outlined,
          ),
          iconSize: kDefaultPadding,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter confirm Password';
        }
        if (confirmpasswordController.text.length == passwordController.text) {
          return 'Password Does not Match';
        }
        return null;
      },
    );
  }
}
