class NewFoodRequestModel {
  NewFoodRequestModel({
    required this.UserId,
    required this.TypeEn,
    required this.TypeAr,
    required this.FoodSourceEn,
    required this.FoodSourceAr,
    required this.TypeOfFoodEn,
    required this.TypeOfFoodAr,
    required this.ExpirationDate,
    required this.TypeOfQuantityEn,
    required this.TypeOfQuantityAr,
    required this.Quantity,
    required this.DeliveryTypeEn,
    required this.DeliveryTypeAr,
    required this.Location,
  });
  late final String UserId;
  late final String TypeEn;
  late final String TypeAr;
  late final String FoodSourceEn;
  late final String FoodSourceAr;
  late final String TypeOfFoodEn;
  late final String TypeOfFoodAr;
  late final String ExpirationDate;
  late final String TypeOfQuantityEn;
  late final String TypeOfQuantityAr;
  late final String Quantity;
  late final String DeliveryTypeEn;
  late final String DeliveryTypeAr;
  late final String Location;

  NewFoodRequestModel.fromJson(Map<String, dynamic> json){
    UserId = json['User_id'];
    TypeEn = json['Type_en'];
    TypeAr = json['Type_ar'];
    FoodSourceEn = json['Food_Source_en'];
    FoodSourceAr = json['Food_Source_ar'];
    TypeOfFoodEn = json['Type_of_food_en'];
    TypeOfFoodAr = json['Type_of_food_ar'];
    ExpirationDate = json['Expiration_Date'];
    TypeOfQuantityEn = json['Type_of_Quantity_en'];
    TypeOfQuantityAr = json['Type_of_Quantity_ar'];
    Quantity = json['Quantity'];
    DeliveryTypeEn = json['Delivery_Type_en'];
    DeliveryTypeAr = json['Delivery_Type_ar'];
    Location = json['Location'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['User_id'] = UserId;
    _data['Type_en'] = TypeEn;
    _data['Type_ar'] = TypeAr;
    _data['Food_Source_en'] = FoodSourceEn;
    _data['Food_Source_ar'] = FoodSourceAr;
    _data['Type_of_food_en'] = TypeOfFoodEn;
    _data['Type_of_food_ar'] = TypeOfFoodAr;
    _data['Expiration_Date'] = ExpirationDate;
    _data['Type_of_Quantity_en'] = TypeOfQuantityEn;
    _data['Type_of_Quantity_ar'] = TypeOfQuantityAr;
    _data['Quantity'] = Quantity;
    _data['Delivery_Type_en'] = DeliveryTypeEn;
    _data['Delivery_Type_ar'] = DeliveryTypeAr;
    _data['Location'] = Location;
    return _data;
  }
}