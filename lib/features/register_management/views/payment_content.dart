import 'package:flutter/material.dart';
import 'package:poly_manage_systm/features/register_management/views/show_payment_details.dart';

import '../../../core/constants/colors.dart';

class PaymentContent extends StatelessWidget {
  const PaymentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Payment",
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 25),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Payment Info",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003D4D),
                    ),
                  ),
                ),

                Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: _buildPaymentTable(),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View All >",
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentTable() {
    final List<Map<String, String>> paymentData = List.generate(
      7,
      (index) => {
        "pId": "651310",
        "uId": "651310",
        "amount": "2500TK",
        "method": "Rocket",
        "txnId": "5685592",
        "time": index < 4 ? "10:00 am" : "02:00 pm",
      },
    );

    return DataTable(
      headingRowColor: MaterialStateProperty.all(const Color(0xFFF1F4F6)),
      headingTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333),
        fontSize: 13,
      ),
      dataTextStyle: const TextStyle(fontSize: 12, color: Colors.black54),
      columnSpacing: 40,
      horizontalMargin: 20,
      columns: const [
        DataColumn(label: Text('Payment ID')),
        DataColumn(label: Text('User ID')),
        DataColumn(label: Text('Amount')),
        DataColumn(label: Text('Payment Method')),
        DataColumn(label: Text('TxnID')),
        DataColumn(label: Text('Time')),
        DataColumn(label: Text('Action')),
      ],
      rows: paymentData
          .map(
            (p) => DataRow(
              cells: [
                DataCell(Text(p['pId']!)),
                DataCell(Text(p['uId']!)),
                DataCell(Text(p['amount']!)),
                DataCell(Text(p['method']!)),
                DataCell(Text(p['txnId']!)),
                DataCell(Text(p['time']!)),
                DataCell(_viewDetailsButton()),
              ],
            ),
          )
          .toList(),
    );
  }

  Widget _viewDetailsButton() {
    return SizedBox(
      height: 28,
      child: ElevatedButton(
        onPressed: () => showPaymentDetailsBottomSheet(),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: const Text("View Details", style: TextStyle(fontSize: 10)),
      ),
    );
  }
}
