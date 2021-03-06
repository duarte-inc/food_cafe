import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/controller/new_order_controller.dart';
import 'package:food_cafe/resource/colors.dart';
import 'package:food_cafe/resource/images.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:food_cafe/ui/widget/order_detail.dart';
import 'package:food_cafe/ui/widget/order_status.dart';
import 'package:get/get.dart';

class NewOrderPage extends StatelessWidget {
  final _infoKey = List<GlobalKey>();
  final _newOrderController = Get.put(NewOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: cardViewElevation,
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(backIcon, size: 18, color: appBarTitleColor)),
            title: Column(
                children: [Text(titleNewOrder, style: appBarTitleStyle)])),
        body: ListView.builder(
            itemCount: _newOrderController.rxNewOrderList.length,
            itemBuilder: (context, index) {
              _infoKey.add(GlobalKey(debugLabel: index.toString()));

              return Card(
                  elevation: cardViewElevation,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OrderDetail(
                                infoKey: _infoKey[index],
                                pending: _newOrderController.rxNewOrderList[index],
                                orderList: _newOrderController
                                    .rxNewOrderList[index].orderList,
                                otherChargeList: _newOrderController
                                    .rxNewOrderList[index].otherChargeList),
                            OrderStatus(
                                orderStatus: dispatchButton,
                                isRejectShow: false),
                          ])));
            }));
  }
}
