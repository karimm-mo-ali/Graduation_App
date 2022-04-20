class StepModel {
  final String image;
  final String text;

  StepModel({required this.image, required this.text});

  static List<StepModel> list = [
    StepModel(
      image: 'assets/onboard_1.jpg',
      text: "Browse the menu\nand order directly from\nthe application",
    ),
    StepModel(
      image: 'assets/onboarding2.jpg',
      text:
          "Your order will be\nimmediately collected and\nsent by our courier",
    ),
    StepModel(
      image: 'assets/onboarding3.jpg',
      text: "Pick update delivery\nat your door and enjoy\ngroceries",
    ),
  ];
}
