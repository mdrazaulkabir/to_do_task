import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_task/app/routes/app_routes.dart';
import 'package:to_do_task/core/constant/app_colors.dart';
import 'package:to_do_task/core/constant/app_images.dart';
import 'package:to_do_task/core/constant/app_sizes.dart';
import '../core/widget/custom_date_picker.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  DateTime? selectTime;
  DateTime dateOfBirth = DateTime(2002 - 12 - 1);
  ValueNotifier<int> counter = ValueNotifier(0);
  ValueNotifier<File?> selectImage=ValueNotifier(null);
  ValueNotifier<File?> selectImage1=ValueNotifier(null);

  Future<void> imagePickCa()async{
    // final picked=ImagePicker();
    // final image=picked.pickImage(source: source)
    final image=await ImagePicker().pickImage(source: ImageSource.camera);
    if( image!= null ){
      selectImage.value=File(image.path);
     }
    }
  Future<void> imagePickGa()async{
    final pick=ImagePicker();
    final image=await pick.pickImage(source: ImageSource.gallery);
    if(image!=null){
      selectImage1.value=File(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final toolHeight = AppSizes.height(context, 200);
    final theme = Theme.of(context);
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
                    image: DecorationImage(
                      image: AssetImage(AppImages.map),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.white.withValues(alpha: .25),
                        BlendMode.modulate,
                      ),
                    ),
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
                              color: Colors.white,
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

            SizedBox(height: AppSizes.paddingBody),

            CustomDatePicker(
              label: "Departure Date",
              isTextField: true,
              firstDate: DateTime.now(), // past date allow না
            ),

            SizedBox(height: AppSizes.paddingBody),

            CustomDatePicker(
              label: "Date of Birth",
              isTextField: false,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              onDateSelected: (date) {
                selectTime = date;
              },
            ),

            SizedBox(height: AppSizes.paddingBody),

            CustomDatePicker(
              label: "date of Die",
              isTextField: false,
              firstDate: dateOfBirth,
              lastDate: DateTime.now(),
              onDateSelected: (date) {
                selectTime = date;
                print('this is selected time $selectTime');
              },
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.createNewTask);
              },
              child: Text('create new task'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.getProductUrl);
              },
              child: Text('Get all Product'),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: AppSizes.paddingBody,right: AppSizes.paddingBody),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.greenAccent.withValues(alpha: .62)
                ),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: counter,
                      builder: (_, value, __) {
                        return Text('Count=>  $value');
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            counter.value++;
                          },
                          child: Text('Increment!'),
                        ),
                        SizedBox(width: 10,),
                        ElevatedButton(onPressed: (){
                          counter.value--;
                        }, child: Text('Decrement'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.paddingBody,right: AppSizes.paddingBody),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                  color: Colors.greenAccent.withValues(alpha: .67)
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ValueListenableBuilder(
                            valueListenable: selectImage,
                            builder: (_, image, __) {


                              return image!=null?
                              CircleAvatar(
                                backgroundColor: Colors.lightGreenAccent,
                                radius: 12,
                                // backgroundImage: Image.file(image),
                                backgroundImage: FileImage(image),
                              ):Text('Image is not selected!');
                        }),
                        ValueListenableBuilder(
                            valueListenable: selectImage1,
                            builder: (_, image, __) {
                              return image!=null?
                              Container(
                                height: 100,width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(AppSizes.radius),
                                  image: DecorationImage(
                                      image: FileImage(image),
                                      fit: BoxFit.fill
                                  ),
                                ),
                                // child: Image.file(image),
                              ):Text('Image is not selected!');
                            }),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(onPressed: (){
                            imagePickCa();
                          }, child: Text('Image picked by camera!')),
                        ),
                        Expanded(
                          child: ElevatedButton(onPressed: (){
                            imagePickGa();
                          }, child: Text('Image picked by gallery!')),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
