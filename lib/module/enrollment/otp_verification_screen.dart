import 'package:flutter/material.dart';
import 'package:kundali_gpt/constants/constant.dart';
import 'package:kundali_gpt/module/enrollment/submit_personal_details_screen.dart';
import 'package:kundali_gpt/widgets/custom_button.dart';
import 'package:kundali_gpt/widgets/reusable_widgets.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController? mobileOtpController;
  TextEditingController? emailOtpController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mobileOtpController = TextEditingController();
    emailOtpController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mobileOtpController?.dispose();
    emailOtpController?.dispose();
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding * 2, vertical: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify OTP',
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
                      color: Theme.of(context).primaryColor),
                  child: Center(
                      child: Text('2',
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
                      child: Text(
                    '3',
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding * 3),
            CustomTextFormField(
              controller: mobileOtpController!,
              prefixIcon: const Icon(Icons.password_outlined),
              keyboardType: TextInputType.number,
              labelText: 'Verify your phone no :',
              hintText: 'Enter your otp',
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            CustomTextFormField(
              controller: emailOtpController!,
              prefixIcon: const Icon(Icons.password_outlined),
              keyboardType: TextInputType.number,
              labelText: 'Verify your email :',
              hintText: 'Enter your email otp',
            ),
            const SizedBox(
              height: defaultPadding * 3,
            ),
            CustomButton(
              text: 'Submit OTP',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SubmitPersonalDetailsScreen(),
                    ));
              },
            )
          ],
        ),
      ),
    ));
  }
}
