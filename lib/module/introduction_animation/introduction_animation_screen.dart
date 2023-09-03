
import 'package:flutter/material.dart';
import 'package:kundali_gpt/module/enrollment/registeration_form.dart';

import '../../widgets/calendar_popup_view.dart';
import 'components/care_view.dart';
import 'components/center_next_button.dart';
import 'components/mood_diary_vew.dart';
import 'components/relax_view.dart';
import 'components/splash_view.dart';
import 'components/top_back_skip_view.dart';
import 'components/welcome_view.dart';

class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({Key? key}) : super(key: key);

  @override
  _IntroductionAnimationScreenState createState() =>
      _IntroductionAnimationScreenState();
}

class _IntroductionAnimationScreenState
    extends State<IntroductionAnimationScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ClipRect(
        child: Stack(
          children: [
            SplashView(
              animationController: _animationController!,
            ),
            RelaxView(
              animationController: _animationController!,
            ),
            CareView(
              animationController: _animationController!,
            ),
            MoodDiaryVew(
              animationController: _animationController!,
            ),
            WelcomeView(
              animationController: _animationController!,
            ),
            TopBackSkipView(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _animationController!,
            ),
            CenterNextButton(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.8,
        duration: const Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    // Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForm(),));
    // showDemoDialog(context: context);
  }

  // void showDemoDialog({BuildContext? context}) {
  //   showDialog<dynamic>(
  //     context: context!,
  //     builder: (BuildContext context) => CalendarPopupView(
  //       barrierDismissible: true,
  //       minimumDate: DateTime.now(),
  //       //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
  //       initialEndDate: endDate,
  //       initialStartDate: startDate,
  //       onApplyClick: (DateTime startData, DateTime endData) {
  //         setState(() {
  //           startDate = startData;
  //           endDate = endData;
  //         });
  //       },
  //       onCancelClick: () {},
  //     ),
  //   );
  // }
}
