import 'package:flutter/material.dart';
import 'package:footware_admin/colntrollers/home_controller.dart';
import 'package:footware_admin/pages/add_product_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Footware Admin',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ctrl.products[index].name ?? ''),
                subtitle: Text((ctrl.products[index].price ?? 0).toString()),
                trailing: IconButton(
                  onPressed: () {
                    ctrl.deleteProduct(ctrl.products[index].id ?? '');
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddProductPage());
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
