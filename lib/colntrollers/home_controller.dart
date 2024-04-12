import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footware_admin/models/product/product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImageCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = 'Category';
  String brand = 'Brand';
  bool offer = false;

  List<Product> products = [];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProducts();
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text,
        price: double.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImageCtrl.text,
        offer: offer,
      );
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar('Success', 'Product Added Successfully!',
          colorText: Colors.green);
      setValuesDefault();
      fetchProducts();
    } catch (e) {
      Get.snackbar('Error in adding products', e.toString(),
          colorText: Colors.red);
      print(e);
    }
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();

      final List<Product> retrivedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      products.clear();
      products.assignAll(retrivedProducts);

      Get.snackbar('Success', 'Product fetch successfully!',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error fetching products', e.toString(),
          colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      Get.snackbar('Success', 'Product deleted successful!',
          colorText: Colors.green);
      await fetchProducts();
    } catch (e) {
      Get.snackbar('Error Deleting Product', e.toString(),
          colorText: Colors.red);
      print(e);
    }
  }

  setValuesDefault() {
    productNameCtrl.clear();
    productDescriptionCtrl.clear();
    productImageCtrl.clear();
    productPriceCtrl.clear();
    category = 'Category';
    brand = 'Brand';
    offer = false;
    update();
  }
}
