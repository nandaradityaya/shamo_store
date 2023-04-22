import 'package:shamo_store/models/category_model.dart';
import 'package:shamo_store/models/gallery_model.dart';

class ProductModel {
  late int id;
  late String name;
  late double
      price; // karena di API price itu blm tau int atau double, jadi kita ubah ke double aja
  late String description;
  late dynamic tags;
  late CategoryModel category;
  late DateTime createdAt;
  late DateTime updatedAt;
  late List<GalleryModel>
      galleries; // karena galleries itu array, jadi kita buat List

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.tags,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.galleries,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price']
        .toString()); // ubah ke double karena utk jaga2 klo di API ternyata pricenya typenya string
    description = json['description'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json[
        'category']); // karena category itu object, jadi kita buat objectnya dulu baru diisi datanya dari json yang dikirim dari API (relasi antara product dan category)
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList(); // map galeri dari json ke GalleryModel. tolList() artinya kita akan mengubahnya menjadi List
    createdAt = DateTime.parse(
        json['created_at']); // ubah ke DateTime karena di API itu string
    updatedAt = DateTime.parse(
        json['updated_at']); // ubah ke DateTime karena di API itu string
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category':
          category.toJson(), // category itu object, jadi kita ubah ke json dulu
      'galleries': galleries
          .map((gallery) => gallery.toJson())
          .toList(), // map galeri dari GalleryModel ke json. tolList() artinya kita akan mengubahnya menjadi List
      'created_at':
          createdAt.toString(), // ubah ke string lagi karena di API itu string
      'updated_at':
          updatedAt.toString(), // ubah ke string lagi karena di API itu string
    }; // semua typenya samain lagi dengan yg ada di postman
  }
}
