class ListUsers{
  List<Data>? data;
  ListUsers({this.data});

    ListUsers.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Data {
  String? email;
  String? firstName;
  String? lastName;

  Data({this.email, this.firstName, this.lastName});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}