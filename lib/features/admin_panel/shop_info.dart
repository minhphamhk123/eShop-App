import 'dart:io';
import 'dart:typed_data';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';

class ShopInfoScreen extends StatefulWidget {
  const ShopInfoScreen({super.key});

  @override
  _ShopInfoScreenState createState() => _ShopInfoScreenState();
}

class _ShopInfoScreenState extends State<ShopInfoScreen> {
  int currentStep = 0;
  final _shopNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();

  // Delivery settings switches
  bool _isFast = false;
  bool _isEconomical = false;
  bool _isExpress = false;
  bool _isCashOnDelivery = false;

  // Business type radio buttons
  String _businessType = 'Personal';
  final _registeredAddressController = TextEditingController();
  final _invoiceEmailController = TextEditingController();
  final _taxCodeController = TextEditingController();

  // Identification form
  String _identificationForm = 'Citizen ID';
  final _idNumberController = TextEditingController();
  final _nameController = TextEditingController();

  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop Information',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: TColors.white),
        ),
        backgroundColor: TColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: TColors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: TColors.primary,
          ),
        ),
        child: Stepper(
          // type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              print('Complete');
              // Handle form submission and send data to server
            } else {
              setState(() => currentStep += 1);
            }
          },
          onStepTapped: (step) {
            setState(() => currentStep = step);
          },
          onStepCancel: currentStep == 0
              ? null
              : () {
                  setState(() => currentStep -= 1);
                },
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            final isLastStep = currentStep == getSteps().length - 1;
            return Container(
              margin: const EdgeInsets.only(top: TSizes.spaceBtwInputFields),
              child: Row(
                children: [
                  if (currentStep != 0)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepCancel,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.grey,
                          side: const BorderSide(color: TColors.grey),
                        ),
                        child: Text(
                          'Back',
                          style:
                              TextStyle(color: TColors.black.withOpacity(0.7)),
                        ),
                      ),
                    ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.primary,
                      ),
                      child: Text(isLastStep ? 'Finish' : 'Next'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text(
            'Shop Info',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          content: Column(
            children: <Widget>[
              const SizedBox(height: TSizes.spaceBtwInputFields),
              buildTextField(
                controller: _shopNameController,
                label: 'Shop name',
                icon: Icons.store,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              buildTextField(
                controller: _phoneNumberController,
                label: 'Phone Number',
                icon: Icons.phone,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              buildTextField(
                controller: _emailController,
                label: 'E-Mail',
                icon: Icons.email,
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text(
            'Delivery Settings',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          content: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: TColors.darkerGrey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    buildSwitchListTile(
                      title: 'Fast',
                      value: _isFast,
                      onChanged: (value) {
                        setState(() {
                          _isFast = value;
                        });
                      },
                    ),
                    buildSwitchListTile(
                      title: 'Economical',
                      value: _isEconomical,
                      onChanged: (value) {
                        setState(() {
                          _isEconomical = value;
                        });
                      },
                    ),
                    buildSwitchListTile(
                      title: 'Express',
                      value: _isExpress,
                      onChanged: (value) {
                        setState(() {
                          _isExpress = value;
                        });
                      },
                    ),
                    buildSwitchListTile(
                      title: 'Allow Cash on Delivery',
                      value: _isCashOnDelivery,
                      onChanged: (value) {
                        setState(() {
                          _isCashOnDelivery = value;
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text(
            'Tax Info',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          content: Column(
            children: <Widget>[
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Container(
                decoration: BoxDecoration(
                  color: TColors.grey,
                  border: Border.all(
                    color: TColors.darkerGrey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      'Business type',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    RadioListTile<String>(
                      title: const Text('Personal'),
                      value: 'Personal',
                      groupValue: _businessType,
                      onChanged: (value) {
                        setState(() {
                          _businessType = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Household'),
                      value: 'Household',
                      groupValue: _businessType,
                      onChanged: (value) {
                        setState(() {
                          _businessType = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Company'),
                      value: 'Company',
                      groupValue: _businessType,
                      onChanged: (value) {
                        setState(() {
                          _businessType = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              buildTextField(
                controller: _registeredAddressController,
                label: 'Registered business address',
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              buildTextField(
                controller: _invoiceEmailController,
                label: 'Email for invoices',
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              buildTextField(
                controller: _taxCodeController,
                label: 'Tax code',
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 3,
          title: Text(
            'Identification Info',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          content: Column(
            children: <Widget>[
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Container(
                decoration: BoxDecoration(
                  color: TColors.grey,
                  border: Border.all(
                    color: TColors.darkerGrey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      'Identification form',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    RadioListTile<String>(
                      title: const Text('Citizen ID'),
                      value: 'Citizen ID',
                      groupValue: _identificationForm,
                      onChanged: (value) {
                        setState(() {
                          _identificationForm = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Passport'),
                      value: 'Passport',
                      groupValue: _identificationForm,
                      onChanged: (value) {
                        setState(() {
                          _identificationForm = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              buildTextField(
                controller: _idNumberController,
                label: 'ID Number',
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              buildTextField(
                controller: _nameController,
                label: 'Name',
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Container(
                /// Upload Image
                decoration: BoxDecoration(
                  color: TColors.black,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: _image != null
                      ? Container(
                          height: 180,
                          width: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(_image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          height: 180,
                          width: 300,
                          color: TColors.grey,
                          child: IconButton(
                            onPressed: () {
                              showImagePickerOption(context);
                            },
                            color: TColors.darkerGrey,
                            icon: const Icon(
                              Icons.upload_file_rounded,
                              size: 100,
                            ),
                          ),
                        ),
                ),
              ),
              IconButton(onPressed: (){showImagePickerOption(context);}, icon: const Icon(Icons.change_circle, size: 42,)),
            ],
          ),
        ),
      ];

  Widget buildTextField(
      {required TextEditingController controller,
      required String label,
      IconData? icon}) {
    final dark = THelperFunctions.isDarkMode(context);
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: TSizes.fontSizeSm,
          color: Colors.grey.withOpacity(0.8),
        ),
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: dark ? Colors.grey[800] : Colors.grey,
                size: TSizes.iconMd,
              )
            : null,
      ),
    );
  }

  Widget buildSwitchListTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Row(
        children: [
          Text(title),
          const SizedBox(width: 2),
          Icon(Icons.info_outline,
              color: Colors.black.withOpacity(0.5), size: 18),
        ],
      ),
      value: value,
      onChanged: onChanged,
      activeColor: TColors.primary,
      inactiveThumbColor: TColors.darkerGrey.withOpacity(0.5),
      inactiveTrackColor: TColors.grey,
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickerImageFormGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text('Gallery'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickerImageFormCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text('Camera'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
/// Image Picker for Gallery
  Future _pickerImageFormGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); // Close the modal sheet
  }
  /// Image Picker for Camera
  Future _pickerImageFormCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}