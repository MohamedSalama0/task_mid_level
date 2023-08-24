import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:task_mid_level/task1/helper/snackbar_helper.dart';
import 'package:task_mid_level/task1/view/screens/home/home_scree.dart';
import 'package:task_mid_level/task1/view/screens/login/provider.dart';
import 'package:task_mid_level/task1/widgets/common_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.04),
              child: Column(
                children: [
                  defaultFormField(
                    controller: provider.eamil,
                    type: TextInputType.name,
                    hintText: 'Enter E-mail',
                    validate: (v) {
                      /// Validation
                    },
                    label: 'email',
                    prefix: Icons.person,
                  ),
                  SizedBox(
                    height: width * 0.04,
                  ),
                  defaultFormField(
                    controller: Provider.of<LoginProvider>(context).password,
                    type: TextInputType.number,
                    hintText: 'Enter Password',
                    validate: (v) {
                      /// Validation
                    },
                    label: 'email',
                    prefix: Icons.person,
                  ),
                  SizedBox(
                    height: width * 0.04,
                  ),
                  Container(
                    width: width / 2,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.indigo,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if (provider.eamil.text.isEmpty ||
                            provider.password.text.isEmpty) {
                          SnackBarHelper.showMySnakebar(
                              context, 'Please Enter correct Information');
                        } else {
                          SnackBarHelper.showMySnakebar(
                            context,
                            'Login successfuly , welcome',
                          );

                          navigateAndFinish(context, const HomeScreen());
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
