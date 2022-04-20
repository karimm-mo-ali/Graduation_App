class UserModel {
  UserModel({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String errNum;
  late final String msg;
  late final Data data;

  UserModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['errNum'] = errNum;
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.user,
    required this.token,
  });
  late final User user;
  late final String token;

  Data.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['token'] = token;
    return _data;
  }
}

class User {
  User({
    required this.FirstName,
    required this.LastName,
    required this.Email,
    required this.Phone,
    required this.Address,
    required this.photo,
  });
  late final String FirstName;
  late final String LastName;
  late final String Email;
  late final String Phone;
  late final String Address;
  late final String photo;

  User.fromJson(Map<String, dynamic> json){
    FirstName = json['First_Name'];
    LastName = json['Last_Name'];
    Email = json['Email'];
    Phone = json['Phone'];
    Address = json['Address'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['First_Name'] = FirstName;
    _data['Last_Name'] = LastName;
    _data['Email'] = Email;
    _data['Phone'] = Phone;
    _data['Address'] = Address;
    _data['photo'] = photo;
    return _data;
  }
}