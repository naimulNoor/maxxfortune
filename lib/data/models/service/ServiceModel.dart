class ServiceModel {
  List<ServiceData> data = List<ServiceData>.empty(growable: true);

  ServiceModel({required this.data});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(new ServiceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceData {
  late int id;
  late String title;
  late String subTitle;
  late String image;
  late String serviceType;
  late int pricingOneId;
  late String pricingOneDistance;
  late int pricingTwoId;
  late String pricingTwoDistance;
  late int pricingThreeId;
  late String pricingThreeDistance;
  late String createdAt;
  late String updatedAt;
  late int isPromotion;
  late PricingOne pricingOne;
  late PricingOne pricingTwo;
  late PricingOne pricingThree;

  ServiceData(
      {required this.id,
        required this.title,
        required this.subTitle,
        required this.image,
        required this.serviceType,
        required this.pricingOneId,
        required this.pricingOneDistance,
        required this.pricingTwoId,
        required this.pricingTwoDistance,
        required this.pricingThreeId,
        required this.pricingThreeDistance,
        required this.createdAt,
        required this.updatedAt,
        required this.isPromotion,
        required this.pricingOne,
        required this.pricingTwo,
        required this.pricingThree});

  ServiceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['sub_title'];
    image = json['image'];
    serviceType = json['service_type'];
    pricingOneId = json['pricing_one_id'];
    pricingOneDistance = json['pricing_one_distance'];
    pricingTwoId = json['pricing_two_id'];
    pricingTwoDistance = json['pricing_two_distance'];
    pricingThreeId = json['pricing_three_id'];
    pricingThreeDistance = json['pricing_three_distance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isPromotion = json['is_promotion'];
    pricingOne = (json['pricing_one'] != null
        ? new PricingOne.fromJson(json['pricing_one'])
        : null)!;
    pricingTwo = (json['pricing_two'] != null
        ? new PricingOne.fromJson(json['pricing_two'])
        : null)!;
    pricingThree = (json['pricing_three'] != null
        ? new PricingOne.fromJson(json['pricing_three'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    data['image'] = this.image;
    data['service_type'] = this.serviceType;
    data['pricing_one_id'] = this.pricingOneId;
    data['pricing_one_distance'] = this.pricingOneDistance;
    data['pricing_two_id'] = this.pricingTwoId;
    data['pricing_two_distance'] = this.pricingTwoDistance;
    data['pricing_three_id'] = this.pricingThreeId;
    data['pricing_three_distance'] = this.pricingThreeDistance;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_promotion'] = this.isPromotion;
    if (this.pricingOne != null) {
      data['pricing_one'] = this.pricingOne.toJson();
    }
    if (this.pricingTwo != null) {
      data['pricing_two'] = this.pricingTwo.toJson();
    }
    if (this.pricingThree != null) {
      data['pricing_three'] = this.pricingThree.toJson();
    }
    return data;
  }
}

class PricingOne {
  late int id;
  late int value;

  PricingOne({required this.id, required this.value});

  PricingOne.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}
