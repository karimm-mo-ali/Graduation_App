class UpdatePassModel {
  UpdatePassModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final Data data;
  late final String message;

  UpdatePassModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.apiToken,
    required this.deviceToken,
    this.stripeId,
    this.cardBrand,
    this.cardLastFour,
    this.trialEndsAt,
    this.braintreeId,
    this.paypalEmail,
    required this.createdAt,
    required this.updatedAt,
    required this.parentId,
    required this.customFields,
    required this.hasMedia,
    required this.media,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String apiToken;
  late final String deviceToken;
  late final Null stripeId;
  late final Null cardBrand;
  late final Null cardLastFour;
  late final Null trialEndsAt;
  late final Null braintreeId;
  late final Null paypalEmail;
  late final String createdAt;
  late final String updatedAt;
  late final int parentId;
  late final List<dynamic> customFields;
  late final bool hasMedia;
  late final List<Media> media;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    apiToken = json['api_token'];
    deviceToken = json['device_token'];
    stripeId = json['stripe_id'];
    cardBrand = json['card_brand'];
    cardLastFour = json['card_last_four'];
    trialEndsAt = json['trial_ends_at'];
    braintreeId = json['braintree_id'];
    paypalEmail = json['paypal_email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parentId = json['parent_id'];
    customFields = List.castFrom<dynamic, dynamic>(json['custom_fields']);
    hasMedia = json['has_media'];
    media = List.from(json['media']).map((e)=>Media.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['api_token'] = apiToken;
    _data['device_token'] = deviceToken;
    _data['stripe_id'] = stripeId;
    _data['card_brand'] = cardBrand;
    _data['card_last_four'] = cardLastFour;
    _data['trial_ends_at'] = trialEndsAt;
    _data['braintree_id'] = braintreeId;
    _data['paypal_email'] = paypalEmail;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['parent_id'] = parentId;
    _data['custom_fields'] = customFields;
    _data['has_media'] = hasMedia;
    _data['media'] = media.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Media {
  Media({
    required this.id,
    required this.modelType,
    required this.modelId,
    required this.collectionName,
    required this.name,
    required this.fileName,
    required this.mimeType,
    required this.disk,
    required this.size,
    required this.manipulations,
    required this.customProperties,
    required this.responsiveImages,
    required this.orderColumn,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
    required this.thumb,
    required this.icon,
    required this.formatedSize,
  });
  late final int id;
  late final String modelType;
  late final int modelId;
  late final String collectionName;
  late final String name;
  late final String fileName;
  late final String mimeType;
  late final String disk;
  late final int size;
  late final List<dynamic> manipulations;
  late final CustomProperties customProperties;
  late final List<dynamic> responsiveImages;
  late final int orderColumn;
  late final String createdAt;
  late final String updatedAt;
  late final String url;
  late final String thumb;
  late final String icon;
  late final String formatedSize;

  Media.fromJson(Map<String, dynamic> json){
    id = json['id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    collectionName = json['collection_name'];
    name = json['name'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    disk = json['disk'];
    size = json['size'];
    manipulations = List.castFrom<dynamic, dynamic>(json['manipulations']);
    customProperties = CustomProperties.fromJson(json['custom_properties']);
    responsiveImages = List.castFrom<dynamic, dynamic>(json['responsive_images']);
    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    url = json['url'];
    thumb = json['thumb'];
    icon = json['icon'];
    formatedSize = json['formated_size'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['model_type'] = modelType;
    _data['model_id'] = modelId;
    _data['collection_name'] = collectionName;
    _data['name'] = name;
    _data['file_name'] = fileName;
    _data['mime_type'] = mimeType;
    _data['disk'] = disk;
    _data['size'] = size;
    _data['manipulations'] = manipulations;
    _data['custom_properties'] = customProperties.toJson();
    _data['responsive_images'] = responsiveImages;
    _data['order_column'] = orderColumn;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['url'] = url;
    _data['thumb'] = thumb;
    _data['icon'] = icon;
    _data['formated_size'] = formatedSize;
    return _data;
  }
}

class CustomProperties {
  CustomProperties({
    required this.uuid,
    required this.userId,
    required this.generatedConversions,
  });
  late final String uuid;
  late final int userId;
  late final GeneratedConversions generatedConversions;

  CustomProperties.fromJson(Map<String, dynamic> json){
    uuid = json['uuid'];
    userId = json['user_id'];
    generatedConversions = GeneratedConversions.fromJson(json['generated_conversions']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['user_id'] = userId;
    _data['generated_conversions'] = generatedConversions.toJson();
    return _data;
  }
}

class GeneratedConversions {
  GeneratedConversions({
    required this.thumb,
    required this.icon,
  });
  late final bool thumb;
  late final bool icon;

  GeneratedConversions.fromJson(Map<String, dynamic> json){
    thumb = json['thumb'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['thumb'] = thumb;
    _data['icon'] = icon;
    return _data;
  }
}