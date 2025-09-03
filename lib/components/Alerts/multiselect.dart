import 'package:flutter/material.dart';
import 'package:zero/utils/string.dart';

class MultiSelect extends StatefulWidget {
  final String title;
  final List<String> items;

  const MultiSelect({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String> _selectedItems = [];

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
