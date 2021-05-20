class myData {
  String previous;
  String next;
  List<Results> results;

  myData({this.previous, this.next, this.results});

  myData.fromJson(Map<String, dynamic> json) {
    previous = json['previous'];
    next = json['next'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

}

class Results {
  String firstName;
  String lastName;
  String email;
  String phone;
  bool verified;

  Results.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    verified = json['verified'];
  }
}