import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_task/core/constant/app_colors.dart';
import 'package:to_do_task/core/constant/app_images.dart';
import 'package:to_do_task/core/constant/app_sizes.dart';
class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  DateTime selectedDate = DateTime.now();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = DateFormat('EEE, MMM dd yyyy').format(selectedDate);
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate, // current date selected থাকবে
      firstDate: DateTime.now(), // আজকের আগের date select করা যাবে না
      lastDate: DateTime(2035),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.red,       // header + selected date circle
              onPrimary: Colors.white,   // header text
              onSurface: Colors.black,   // body text
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final toolHeight=AppSizes.height(context, 300);
    final theme=Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Container(
                  height: toolHeight,
                  width: double.infinity,
                  color: AppColors.seed,
                ),
                Container(
                  height: toolHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image:AssetImage(AppImages.map),fit:BoxFit.cover,colorFilter: ColorFilter.mode(Colors.white.withValues(alpha: .25), BlendMode.modulate))
                  ),
                ),
                // SafeArea(
                //   child: Container(
                //     child: Text('hello you name is :'),
                //   ),
                // )
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.width(context, 20),
                      vertical: AppSizes.height(context, 18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: const Text(
                            "Let's start your todo work!!",
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text('hello'),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: _selectDate,
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: "Departure Date",
                        prefixIcon: const Icon(Icons.calendar_month),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
