class ContactUsModel {
  late String name="";
  late String phone="";
  late String email="";

  ContactUsModel(this.name, this.phone, this.email, this.address,
      this.websiteUrl, this.description,);

  late String address="no address";
  late String websiteUrl="";
  late String description="";

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "address": address,
    "website_url": websiteUrl,
    "description": description,
  };
}