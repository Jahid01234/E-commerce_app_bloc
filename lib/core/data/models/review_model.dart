class ReviewModel {
  final String? userId;
  final String? userName;
  final String? userProfileImage;
  final String? productId;
  final String? reviewText;
  final double? rating;
  final DateTime? createdAt;

  ReviewModel({
    this.userId,
    this.userName,
    this.userProfileImage,
    this.productId,
    this.reviewText,
    this.rating,
    this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    userId: json["userId"],
    userName: json["userName"],
    userProfileImage: json["userProfileImage"],
    productId: json["productId"],
    reviewText: json["reviewText"],
    rating: json["rating"]?.toDouble(),
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "userName": userName,
    "userProfileImage": userProfileImage,
    "productId": productId,
    "reviewText": reviewText,
    "rating": rating,
    "createdAt": createdAt?.toIso8601String(), 
  };
}