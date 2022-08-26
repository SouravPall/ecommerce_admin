const String productId = 'id';
const String productName = 'name';
const String productCategory = 'category';
const String productDescription = 'description';
const String productImageUrl = 'imageUrl';
const String productSalesPrice = 'salesPrice';
const String productFeatured = 'featured';
const String productAvailable = 'available';

class ProductModel{
  String? id, name, category, description, imageUrl;
  num salesPrice;
  bool featured, available;

  ProductModel(
      {this.id,
      this.name,
      this.category,
      this.description,
      this.imageUrl,
      required this.salesPrice,
      required this.featured,
      required this.available
      });

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      productId: id,
      productName: name,
      productCategory: category,
      productDescription: description,
      productImageUrl: imageUrl,
      productSalesPrice: salesPrice,
      productFeatured: featured,
      productAvailable: available,
    };
  }

  @override
  String toString() {
    return 'ProductModel{id: $id, name: $name, category: $category, description: $description, imageUrl: $imageUrl, salesPrice: $salesPrice, featured: $featured, available: $available}';
  }
}
