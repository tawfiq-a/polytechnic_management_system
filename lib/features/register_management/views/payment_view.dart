import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:poly_manage_systm/features/register_management/views/payment_content.dart';
import 'package:poly_manage_systm/features/register_management/views/show_payment_details.dart';

import '../controllers/register_controller.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AccountsController>();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF003D4D), Color(0xFF006884)],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () {
                showMakePaymentBottomSheet();
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_card, color: Colors.white, size: 30),
                  SizedBox(height: 10),
                  Text(
                    "Make New Payment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Payment History",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.paymentHistory.length,
              itemBuilder: (context, index) {
                var p = controller.paymentHistory[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text(
                      "Trx ID: ${p['id']}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("${p['date']} | ${p['amount']}"),
                    trailing: TextButton(
                      onPressed: () {
                        showPaymentDetailsBottomSheet();
                      },
                      child: const Text("View Details"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
