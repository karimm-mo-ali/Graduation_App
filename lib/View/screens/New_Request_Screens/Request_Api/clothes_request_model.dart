class NewClothesRequestModel {
  NewClothesRequestModel({
    required this.UserId,
    required this.GenderEn,
    required this.GenderAr,
    required this.TypeEn,
    required this.TypeAr,
    required this.SizeEn,
    required this.SizeAr,
    required this.Quantity,
    required this.DeliveryTypeEn,
    required this.DeliveryTypeAr,
    required this.Location,
    required this.NeedyAddresses,
  });
  late final String UserId;
  late final String GenderEn;
  late final String GenderAr;
  late final String TypeEn;
  late final String TypeAr;
  late final String SizeEn;
  late final String SizeAr;
  late final String Quantity;
  late final String DeliveryTypeEn;
  late final String DeliveryTypeAr;
  late final String Location;
  late final String NeedyAddresses;

  NewClothesRequestModel.fromJson(Map<String, dynamic> json){
    UserId = json['User_id'];
    GenderEn = json['Gender_en'];
    GenderAr = json['Gender_ar'];
    TypeEn = json['Type_en'];
    TypeAr = json['Type_ar'];
    SizeEn = json['Size_en'];
    SizeAr = json['Size_ar'];
    Quantity = json['Quantity'];
    DeliveryTypeEn = json['Delivery_Type_en'];
    DeliveryTypeAr = json['Delivery_Type_ar'];
    Location = json['Location'];
    NeedyAddresses = json['Needy_Addresses'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['User_id'] = UserId;
    _data['Gender_en'] = GenderEn;
    _data['Gender_ar'] = GenderAr;
    _data['Type_en'] = TypeEn;
    _data['Type_ar'] = TypeAr;
    _data['Size_en'] = SizeEn;
    _data['Size_ar'] = SizeAr;
    _data['Quantity'] = Quantity;
    _data['Delivery_Type_en'] = DeliveryTypeEn;
    _data['Delivery_Type_ar'] = DeliveryTypeAr;
    _data['Location'] = Location;
    _data['Needy_Addresses'] = NeedyAddresses;
    return _data;
  }
}