class ProductModel {
   String productId;
  final String? productName;
  final double? productPrice;
  final List<ImageGallery> imageGallery;
  final List<Variant> variant;
  final String? productDetails;
  final String? brand;
  final String? categoryId;
  final double? vatSd;

  ProductModel({
    required this.productId,
    this.productName,
    this.productPrice,
    this.imageGallery = const [],
    this.variant = const [],
    this.productDetails,
    this.brand,
    this.categoryId,
    this.vatSd,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json["product_id"]?.toString() ?? '',
      productName: json["product_name"],
      productPrice: (json["product_price"] as num?)?.toDouble(),
      imageGallery: (json["image_gallery"] as List?)
          ?.map((e) => ImageGallery.fromJson(e))
          .toList() ??
          [],
      variant: (json["variant"] as List?)
          ?.map((e) => Variant.fromJson(e))
          .toList() ??
          [],
      productDetails: json["product_details"],
      brand: json["brand"],
      categoryId: json["category_id"]?.toString(),
      vatSd: (json["vat_sd"] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      "product_name": productName,
      "product_price": productPrice,
      "image_gallery":
      imageGallery.map((e) => e.toJson()).toList(),
      "variant":
      variant.map((e) => e.toJson()).toList(),
      "product_details": productDetails,
      "brand": brand,
      "category_id": categoryId,
      "vat_sd": vatSd,
    };
  }
}

class ImageGallery {
  final String? title;
  final String? url;

  ImageGallery({
    this.title,
    this.url,
  });

  factory ImageGallery.fromJson(Map<String, dynamic> json) {
    return ImageGallery(
      title: json["title"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "url": url,
    };
  }
}

class Variant {
  final String? category;
  final List<VariantItem> items;

  Variant({
    this.category,
    this.items = const [],
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      category: json["category"],
      items: (json["items"] as List?)
          ?.map((e) => VariantItem.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "category": category,
      "items": items.map((e) => e.toJson()).toList(),
    };
  }
}

class VariantItem {
  final String? title;
  final String? description;

  VariantItem({
    this.title,
    this.description,
  });

  factory VariantItem.fromJson(Map<String, dynamic> json) {
    return VariantItem(
      title: json["title"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
    };
  }
}


