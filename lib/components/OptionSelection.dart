import 'package:flutter/material.dart';
import 'package:zero/components/Alerts/multiselect.dart';
import 'package:zero/components/Alerts/singleSelect.dart';

class Optionselection extends StatelessWidget {
  const Optionselection({
    super.key,
    required this.title,
    required this.hintText,
    required this.options,
    this.multiSelect = false,
  });

  final String hintText, title;
  final List<String> options;
  final bool multiSelect;

  void _openDialog(BuildContext context) async {
    final dialog = multiSelect
        ? MultiSelect(title: title, items: options)
        : const Singleselect();

    final result = await showDialog(
      context: context,
      builder: (context) => dialog,
    );

    if (result != null) {
      debugPrint("User selected: $result");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: Text(
            hintText,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => _openDialog(context),
          child: const Text("Select"),
        ),
      ],
    );
  }
}
