class GetFoodRequestsModel {
  GetFoodRequestsModel({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String errNum;
  late final String msg;
  late final List<Data> data;

  GetFoodRequestsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['errNum'] = errNum;
    _data['msg'] = msg;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.userId,
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
    required this.RequestStatusEn,
    required this.RequestStatusAr,
    required this.NeedyAddresses,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String userId;
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
  late final String RequestStatusEn;
  late final String RequestStatusAr;
  late final String NeedyAddresses;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
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
    RequestStatusEn = json['Request_Status_en'];
    RequestStatusAr = json['Request_Status_ar'];
    NeedyAddresses = json['Needy_Addresses'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
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
    _data['Request_Status_en'] = RequestStatusEn;
    _data['Request_Status_ar'] = RequestStatusAr;
    _data['Needy_Addresses'] = NeedyAddresses;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}