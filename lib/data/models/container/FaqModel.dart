class FaqModel {
  //late List<Data> data;
  List<FaqData> data = List<FaqData>.empty(growable: true);
  late Links links;
  late Meta meta;

  FaqModel({required this.data, required this.links, required this.meta});

  FaqModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(new FaqData.fromJson(v));
      });
    }
    links = (json['links'] != null ? new Links.fromJson(json['links']) : null)!;
    meta = (json['meta'] != null ? new Meta.fromJson(json['meta']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class FaqData {
  late int id;
  late String question;
  late String answer;
  late int categoryId;
  late Category category;

  FaqData({required this.id, required this.question, required this.answer, required this.categoryId, required this.category});

  FaqData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    categoryId = json['category_id'];
    category = (json['category'] != null
        ? new Category.fromJson(json['category'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['category_id'] = this.categoryId;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}

class Category {
  late int id;
  late String name;
  late String createdAt;
  late String updatedAt;
  late dynamic deletedAt;

  Category(
      {required this.id, required this.name, required this.createdAt, required this.updatedAt, required this.deletedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Links {
  late String first;
  late String last;
  late dynamic prev;
  late dynamic next;

  Links({required this.first, required this.last, required this.prev, required this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  late int currentPage;
  late int from;
  late int lastPage;
  late String path;
  late int perPage;
  late int to;
  late int total;

  Meta(
      {required this.currentPage,
        required this.from,
        required this.lastPage,
        required this.path,
        required this.perPage,
        required this.to,
        required this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
