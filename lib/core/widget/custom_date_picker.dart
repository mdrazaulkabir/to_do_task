import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_task/core/constant/app_sizes.dart';

class CustomDatePicker extends StatefulWidget {
  final String label;
  final bool isTextField; // true = TextFormField , false = Container UI
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(DateTime)? onDateSelected;

  const CustomDatePicker({
    super.key,
    required this.label,
    this.isTextField = true,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateSelected,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime selectedDate;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    selectedDate = widget.initialDate ?? DateTime.now();

    controller.text =
        DateFormat('EEE, MMM dd yyyy').format(selectedDate);
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(2035),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.red,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        controller.text =
            DateFormat('EEE, MMM dd yyyy').format(selectedDate);
      });

      widget.onDateSelected?.call(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    /// ===== TEXTFIELD VERSION =====
    if (widget.isTextField) {
      return Padding(
        padding: const EdgeInsets.only(left:AppSizes.paddingBody,right: AppSizes.paddingBody ),
        child: GestureDetector(
          onTap: _selectDate,
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: widget.label,
                prefixIcon: const Icon(Icons.calendar_month),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      );
    }

    /// ===== CONTAINER VERSION =====
    return Padding(
      padding: const EdgeInsets.only(left:AppSizes.paddingBody,right: AppSizes.paddingBody ),
      child: InkWell(
        onTap: _selectDate,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.label),
              Row(
                children: [
                  Text(
                    controller.text,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.calendar_month, size: 18),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
