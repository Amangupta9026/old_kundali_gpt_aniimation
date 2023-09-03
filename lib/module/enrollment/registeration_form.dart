import 'package:flutter/material.dart';
import 'package:kundali_gpt/constants/constant.dart';
import 'package:kundali_gpt/module/enrollment/otp_verification_screen.dart';
import 'package:kundali_gpt/widgets/custom_button.dart';
import 'package:kundali_gpt/widgets/reusable_widgets.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _fNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 2, vertical: defaultPadding),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: defaultPadding * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor),
                      child: Center(
                          child: Text('1',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.white))),
                    ),
                    Expanded(
                      child: Divider(
                          thickness: 4, color: Theme.of(context).primaryColor),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      child: Center(
                          child: Text('2',
                              style: Theme.of(context).textTheme.titleMedium)),
                    ),
                    const Expanded(
                      child: Divider(thickness: 4),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      child: Center(
                          child: Text(
                        '3',
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding * 3),
                CustomTextFormField(
                  controller: _fNameController,
                  prefixIcon: const Icon(Icons.person),
                  labelText: 'First Name :',
                  hintText: 'Enter your first Name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                CustomTextFormField(
                  controller: _lNameController,
                  prefixIcon: const Icon(Icons.person),
                  labelText: 'Last Name :',
                  hintText: 'Enter your last Name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: defaultPadding),
                CustomTextFormField(
                  controller: _phoneController,
                  prefixIcon: const Icon(Icons.phone_android_rounded),
                  keyboardType: TextInputType.phone,
                  labelText: 'Phone no :',
                  hintText: 'Enter your phone no.',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone no.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: defaultPadding),
                CustomTextFormField(
                  controller: _emailController,
                  prefixIcon: const Icon(Icons.email_outlined),
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Email :',
                  hintText: 'Enter your email',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: defaultPadding * 3,
                ),
                CustomButton(
                  color: Theme.of(context).primaryColor,
                  text: 'Next',
                  onPressed: () {
                    // if (!_formKey.currentState!.validate()) {
                    // Submit form
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpVerificationScreen(),
                        ));
                    // }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
