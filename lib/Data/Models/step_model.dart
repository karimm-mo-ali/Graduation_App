class StepModel {
  final String image;
  final String text;

  StepModel({required this.image, required this.text});

  static List<StepModel> list = [
    StepModel(
      image: 'assets/onboard_1.jpg',
      text: "Uisng our \napp for helping \nneedy people",
    ),
    StepModel(
      image: 'assets/onboarding2.jpg',
      text: "Donate as fast as \nto save poorly people\nin everywhere",
    ),
    StepModel(
      image: 'assets/onboarding3.jpg',
      text: "Let's start \nwith FIAlKHAIR to help\n needy people",
    ),
  ];
}
