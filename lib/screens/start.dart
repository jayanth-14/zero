import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:zero/screens/LanguageSelection.dart';
import 'package:zero/utils/logoByTheme.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logoUrl = getLogoByTheme(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logoUrl),
              const SizedBox(height: 50),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: "Enter your Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.surface,
                                title: Row(
                                  children: [
                                    Icon(
                                      Icons.warning_amber_rounded,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                      size: 28,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Missing Name",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                                content: const Text(
                                  "Please enter your name before continuing.",
                                  style: TextStyle(fontSize: 16),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );

                            return;
                          }
                          Hive.box('settings').put('user', controller.text);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const Languageselection(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2,
                          ),
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text("Continue"),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Disclaimer: We respect your privacy more than anything else. "
                        "All of your data is stored locally on your device only",
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
