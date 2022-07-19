class StepModel {
  final String image;
  final String text;

  StepModel({required this.image, required this.text});

  static List<StepModel> list = [
    StepModel(
      image: 'assets/onboard_1.jpg',
      text: "Uing our \napp for helping \nneedy people",
    ),
    StepModel(
      image: 'assets/onboarding2.jpg',
      text:
          "Donate as fast as \nto save poorly people\nin every where",
    ),
    StepModel(
      image: 'assets/onboarding3.jpg',
      text: "Lets start \nwith FiAlkhar to help\n needy people",
    ),
  ];
}
