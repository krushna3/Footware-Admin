import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:footware_admin/colntrollers/home_controller.dart';
import 'package:footware_admin/widgets/drop_down_btn.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add Product'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
              children: [
                Text(
                  'Add New Product',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('Product Name'),
                    hintText: 'Enter Your Product Name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ctrl.productDescriptionCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('Product Description'),
                    hintText: 'Enter Your Product Description',
                  ),
                  maxLines: 4,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ctrl.productImageCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('Image URl'),
                    hintText: 'Enter Your Product Image',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('Price'),
                    hintText: 'Enter Your Product Price',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                        child: DropDownBtn(
                      items: [
                        'Boot',
                        'Flip-flops',
                        'Sandals',
                        'Shoes',
                        'Clogs',
                        'Heel',
                        'Loafers'
                      ],
                      hintText: ctrl.category,
                      onSelected: (selectedValue) {
                        ctrl.category = selectedValue ?? 'general';
                        ctrl.update();
                      },
                    )),
                    Flexible(
                        child: DropDownBtn(
                      items: [
                        'Puma',
                        'Adidas',
                        'Bata',
                        'Nike',
                        'Skechers',
                        'Reebok',
                        'Fila'
                      ],
                      hintText: ctrl.brand,
                      onSelected: (selectedValue) {
                        ctrl.brand = selectedValue ?? 'unbranded';
                        ctrl.update();
                      },
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Offer Product?'),
                SizedBox(
                  height: 10,
                ),
                DropDownBtn(
                  items: ['true', 'false'],
                  hintText: ctrl.offer.toString(),
                  onSelected: (selectedValue) {
                    ctrl.offer =
                        bool.tryParse(selectedValue ?? 'false') ?? false;
                    ctrl.update();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    ctrl.addProduct();
                  },
                  child: Text('Add Product'),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
