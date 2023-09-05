import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late int index;

  final List<String> titles = [
    'Discover Amazing Place',
    'Book a Local',
    'Share Your Adventures',
  ];

  final List<String> descriptions = [
    'Plan Your Trip, choose your destination. Pick the best local guide for your holiday',
    'You can book private city tours with locals on-the-go and experience a new place like never before',
    'Enjoy your holiday! don’t forget to take a photo and share to the world',
  ];

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    final onboardingPagesList = [
      PageModel(
        widget: Image.asset(
          'assets/onboarding_1.png',
          width: deviceWidth,
          fit: BoxFit.cover,
        ),
      ),
      PageModel(
        widget: Image.asset(
          'assets/onboarding_2.png',
          width: deviceWidth,
          fit: BoxFit.cover,
        ),
      ),
      PageModel(
        widget: Image.asset(
          'assets/onboarding_3.png',
          width: deviceWidth,
          fit: BoxFit.cover,
        ),
      ),
    ];

    return Scaffold(
      body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return Column(
              children: [
                Container(
                  height: deviceHeight * 0.35,
                  width: deviceWidth * 0.95,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF1F1F5),
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(deviceWidth * 0.05),
                    child: Column(
                      children: [
                        Text(
                          titles[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: deviceHeight * 0.02,),
                        Text(
                          descriptions[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: deviceHeight * 0.04),
                        DotsIndicator(
                          dotsCount: pagesLength,
                          position: index,
                          decorator: const DotsDecorator(
                            color: Color(0xFFe2e2ea),
                            activeColor: Color(0xFFfebd2f),
                          ),
                        ),
                        SizedBox(height: deviceHeight * 0.04,),
                        MaterialButton(
                          onPressed: () {},
                          color: Colors.black,
                          textColor: Colors.white,
                          minWidth: deviceWidth * 0.6,
                          height: deviceHeight * 0.06,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: deviceHeight * 0.02,),
                        const InkWell(
                          child: Text(
                            'Skip for now',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
                SizedBox(height: deviceHeight * 0.02,)
              ],
            );
          }),
    );
  }
}