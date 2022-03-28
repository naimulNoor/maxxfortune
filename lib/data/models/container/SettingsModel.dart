class SettingsModel {
  List<Data> data = List<Data>.empty(growable: true);

  SettingsModel({required this.data});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {

      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
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

class Data {
  late int id;
  late String termsConditions;
  late String privacyConcerns;
  late String createdAt;
  late String updatedAt;

  Data(
      {required this.id,
        required this.termsConditions,
        required this.privacyConcerns,
        required this.createdAt,
        required this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    termsConditions = json['terms_conditions'];
    privacyConcerns = json['privacy_concerns'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['terms_conditions'] = this.termsConditions;
    data['privacy_concerns'] = this.privacyConcerns;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
