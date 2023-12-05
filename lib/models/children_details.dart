class ChildDetails {
  String name;
  String homeCountry;
  bool isNaughty;

  ChildDetails({
    required this.name,
    required this.homeCountry,
    required this.isNaughty,
  });

  factory ChildDetails.fromJson(Map<String, dynamic> json) {
    return ChildDetails(
      name: json['name'] as String? ?? '',
      homeCountry: json['homeCountry'] as String? ?? '',
      isNaughty: json['isNaughty'] as bool? ?? false,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'homeCountry': homeCountry,
      'isNaughty': isNaughty,
    };
  }
}
