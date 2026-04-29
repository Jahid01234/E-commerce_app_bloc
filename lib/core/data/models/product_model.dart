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


final List<ProductModel> dummyProducts = [
  ProductModel(
    productId: "productId1",
    productName: "Winter T-shirt",
    productPrice: 200.0,
    imageGallery: [
      ImageGallery(
          title: "Image-1",
          url: "https://images.othoba.com/images/thumbs/0574991_winter-long-full-sleeves-t-shirt.jpeg",
      ),
      ImageGallery(
          title: "Image-2",
          url: "https://images.othoba.com/images/thumbs/0574988_winter-long-full-sleeves-t-shirt.jpeg",
      ),
    ],
    variant: [
      Variant(category: "Size", items: [
        VariantItem(title: "S"),
        VariantItem(title: "M"),
        VariantItem(title: "XL"),
      ])
    ],
    productDetails: "Stay warm, stylish, and comfortable throughout the colder days"
        " with this premium winter full sleeve t-shirt, designed for everyday wear and "
        "long-lasting comfort. Crafted from a high-quality, soft cotton blend fabric,"
        " this t-shirt offers a perfect balance between warmth and breathability. The "
        "inner brushed texture provides a cozy feel against the skin, making it ideal for"
        " winter mornings, chilly evenings, and layering under jackets or hoodies.",
    brand: "Easy",
  ),

  ProductModel(
    productId: "productId2",
    productName: "Casual Shirt",
    productPrice: 450.0,
    imageGallery: [
      ImageGallery(title: "Image-1", url: "https://via.placeholder.com/300"),
    ],
    variant: [
      Variant(category: "Size", items: [
        VariantItem(title: "M"),
        VariantItem(title: "L"),
      ])
    ],
    productDetails: "Stylish casual shirt",
    brand: "Yellow",
  ),

  ProductModel(
    productId: "productId3",
    productName: "Denim Jeans",
    productPrice: 1200.0,
    imageGallery: [
      ImageGallery(title: "Image-1", url: "https://via.placeholder.com/300"),
    ],
    variant: [
      Variant(category: "Size", items: [
        VariantItem(title: "30"),
        VariantItem(title: "32"),
        VariantItem(title: "34"),
      ])
    ],
    productDetails: "Premium denim jeans",
    brand: "Levis",
  ),

  ProductModel(
    productId: "productId4",
    productName: "Hoodie",
    productPrice: 800.0,
    imageGallery: [
      ImageGallery(title: "Image-1", url: "https://via.placeholder.com/300"),
    ],
    variant: [
      Variant(category: "Color", items: [
        VariantItem(title: "Black"),
        VariantItem(title: "Gray"),
      ])
    ],
    productDetails: "Warm winter hoodie",
    brand: "Nike",
  ),

  ProductModel(
    productId: "productId5",
    productName: "Polo Shirt",
    productPrice: 350.0,
    imageGallery: [
      ImageGallery(title: "Image-1", url: "https://via.placeholder.com/300"),
    ],
    variant: [
      Variant(category: "Size", items: [
        VariantItem(title: "M"),
        VariantItem(title: "L"),
      ])
    ],
    productDetails: "Classic polo shirt",
    brand: "Lacoste",
  ),

  ProductModel(
    productId: "productId6",
    productName: "Joggers",
    productPrice: 600.0,
    imageGallery: [
      ImageGallery(title: "Image-1", url: "https://via.placeholder.com/300"),
    ],
    variant: [
      Variant(category: "Size", items: [
        VariantItem(title: "S"),
        VariantItem(title: "M"),
        VariantItem(title: "L"),
      ])
    ],
    productDetails: "Comfortable jogger pants",
    brand: "Adidas",
  ),

  ProductModel(
    productId: "productId7",
    productName: "Sneakers",
    productPrice: 2500.0,
    imageGallery: [
      ImageGallery(title: "Image-1", url: "https://via.placeholder.com/300"),
    ],
    variant: [
      Variant(category: "Size", items: [
        VariantItem(title: "40"),
        VariantItem(title: "41"),
        VariantItem(title: "42"),
      ])
    ],
    productDetails: "Stylish sneakers",
    brand: "Puma",
  ),

  ProductModel(
    productId: "productId8",
    productName: "Formal Pant",
    productPrice: 900.0,
    imageGallery: [
      ImageGallery(title: "Image-1", url: "https://via.placeholder.com/300"),
    ],
    variant: [
      Variant(category: "Size", items: [
        VariantItem(title: "30"),
        VariantItem(title: "32"),
      ])
    ],
    productDetails: "Office formal pant",
    brand: "Zara",
  ),

  ProductModel(
    productId: "productId9",
    productName: "Jacket",
    productPrice: 1800.0,
    imageGallery: [
      ImageGallery(title: "Image-1", url: "https://via.placeholder.com/300"),
    ],
    variant: [
      Variant(category: "Color", items: [
        VariantItem(title: "Black"),
        VariantItem(title: "Brown"),
      ])
    ],
    productDetails: "Winter leather jacket",
    brand: "H&M",
  ),

  ProductModel(
    productId: "productId10",
    productName: "Trousers",
    productPrice: 700.0,
    imageGallery: [
      ImageGallery(title: "Image-1", url: "https://via.placeholder.com/300"),
    ],
    variant: [
      Variant(category: "Size", items: [
        VariantItem(title: "M"),
        VariantItem(title: "L"),
      ])
    ],
    productDetails: "Slim fit trousers",
    brand: "Uniqlo",
  ),
];