import 'package:flutter/material.dart';

import 'food.dart';

const foodType = ['fastfood', 'normal'];

const prices = [
  'Less or equal than 100',
  'Less or equal than 500',
  'Less or equal than 1000'
];

class Filter {
  String name;
  bool Function(Food) filterFn;

  Filter({required this.name, required this.filterFn});
}

class CustomCheckboxTile extends StatelessWidget {
  final String label;
  final bool value;
  final void Function(bool)? onChange;

  const CustomCheckboxTile({
    Key? key,
    required this.label,
    required this.value,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          visualDensity: VisualDensity.compact,
          value: value,
          onChanged: (_) {
            if (onChange != null) {
              onChange!(!value);
            }
          },
        ),
        Text(label),
      ],
    );
  }
}

class FilterDialog extends StatefulWidget {
  final void Function(Map<String, List<String>?>) onApplyFilters;
  final Map<String, List<String>?> initialState;

  const FilterDialog({
    Key? key,
    required this.onApplyFilters,
    this.initialState = const {},
  }) : super(key: key);

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  Map<String, List<String>?> filters = {};

  @override
  void initState() {
    super.initState();
    filters = widget.initialState;
  }

  void _handleCheckFilter(bool checked, String key, String value) {
    final currentFilters = filters[key] ?? [];
    if (checked) {
      currentFilters.add(value);
    } else {
      currentFilters.remove(value);
    }
    setState(() {
      filters[key] = currentFilters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text(
        'Filter',
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.all(16),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: const Text(
              'Select a foodType',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            ...foodType
                .map(
                  (el) => CustomCheckboxTile(
                    value: filters['foodType']?.contains(el) ?? false,
                    label: el,
                    onChange: (check) =>
                        _handleCheckFilter(check, 'foodType', el),
                  ),
                )
                .toList(),
            Center(
                child: const Text(
              'Select a price',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            ...prices
                .map((el) => CustomCheckboxTile(
                      value: filters['price']?.contains(el) ?? false,
                      label: el,
                      onChange: (check) =>
                          _handleCheckFilter(check, 'price', el),
                    ))
                .toList(),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 78, 146, 241),
              ),
              onPressed: () {
                widget.onApplyFilters(filters);
                Navigator.of(context).pop();
              },
              child: const Text('APPLY'),
            ),
          ],
        ),
      ],
    );
  }
}
