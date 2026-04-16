class BrandModel {
  final String brandName;
  final String brandLogo;

  BrandModel({
    required this.brandName,
    required this.brandLogo,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    brandName: json["brandName"] ?? '',
    brandLogo: json["brandLogo"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "brandName": brandName,
    "brandLogo": brandLogo,
  };
}