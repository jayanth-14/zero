import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:zero/utils/string.dart';

class MultiSelect extends StatefulWidget {
  final String title, id;
  final List<String> items;

  const MultiSelect({
    super.key,
    required this.title,
    required this.items,
    required this.id,
  });

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String> _selectedItems = [];
  var box = Hive.box("settings");

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.of(context).pop();
  }

  void _submit() {
    box.put("languages", _selectedItems.toString());
    Navigator.of(context).pop(_selectedItems);
  }
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map(
                (item) => CheckboxListTile(
                  title: Text(Captilize(item)),
                  value: _selectedItems.contains(item),
                  onChanged: (isChanged) =>
                      _itemChange(item, isChanged ?? false),
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        TextButton(onPressed: _cancel, child: const Text("Cancel")),
        ElevatedButton(onPressed: _submit, child: const Text("OK")),
      ],
    );
  }
}
