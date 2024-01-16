import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_todo_app/routing/go_router.dart';
import 'package:sample_todo_app/utils/practice_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameTextArea = TextEditingController();
  TextEditingController passwordTextArea = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  void updateUI(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        isLoading = false;
      });
      userNameTextArea.clear();
      passwordTextArea.clear();
      context.pushNamed(AppRoute.homeScreen.name);
    });
  }

  void submit(context) {
    final isValid = _formKey.currentState?.validate();
    if (isValid == null && (isValid != null && !isValid)) {
      return;
    }
    _formKey.currentState?.save();
    updateUI(context);
  }

  @override
  void dispose() {
    userNameTextArea.dispose();
    passwordTextArea.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 220, 30.0, 0),
              child: TextFormField(
                controller: userNameTextArea,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: PracticeUtils.usernameLabel,
                ),
                validator: (userNameValue) {
                  RegExp regex =
                      RegExp(PracticeUtils.userNamePattern.toString());
                  if (userNameValue == null || userNameValue.isEmpty) {
                    return PracticeUtils.inValidUsername;
                  } else if (!regex.hasMatch(userNameValue)) {
                    return PracticeUtils.inValidUsername;
                  } else {
                    return PracticeUtils.validUsername;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 15, 30.0, 0),
              child: TextFormField(
                controller: passwordTextArea,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: PracticeUtils.passwordLabel,
                ),
                validator: (value) {
                  print('password value $value');
                  if (value == null || value.isEmpty) {
                    return PracticeUtils.inValidPassword;
                  } else if (!RegExp(PracticeUtils.passwordPattern.toString())
                      .hasMatch(value)) {
                    return PracticeUtils.inValidPassword;
                  } else {
                    return PracticeUtils.validPassword;
                  }
                },
              ),
            ),
            SizedBox(
              height: 65,
              width: 355,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // background
                      foregroundColor: Colors.white, // foreground
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  onPressed: () => submit(context),
                  child: const Text(
                    'Log in ',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            Visibility(
                visible: isLoading,
                child: const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    )))
          ],
        ),
      ),
    );
  }
}

extension extString on String {
  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }
}
