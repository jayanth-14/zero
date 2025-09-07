import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:zero/screens/LanguageSelection.dart';
import 'package:zero/utils/logoByTheme.dart';

class Start extends StatelessWidget {
  Start({super.key});
  @override
  Widget build(BuildContext context) {
    final logoUrl = getLogoByTheme(context);
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(40, 40, 40, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logoUrl),
              SizedBox(height: 50),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.person),
                          hintText: "Enter your Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Hive.box('settings').put('user', controller.text);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Languageselection()));
                        },
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                          ),
                          textStyle: WidgetStateProperty.all<TextStyle>(
                            TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2,
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Theme.of(context).colorScheme.primary,
                          ),
                          foregroundColor: WidgetStateProperty.all<Color>(
                            Theme.of(context).colorScheme.secondary,
                          ),
                          // padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsetsGeometry.fromLTRB(40, 10, 40, 10))
                          minimumSize: WidgetStateProperty.all<Size>(
                            Size(double.infinity, 50),
                          ),
                        ),
                        child: Text("Continue"),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Disclaimer: We respect your privacy more than anything else. All of your data is stored locally on your device only",
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
