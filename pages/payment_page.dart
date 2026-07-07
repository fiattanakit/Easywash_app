import 'package:flutter/material.dart';
 // สำหรับจัดรูปแบบเงิน

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  double balance = 100.0; // สมมุติว่ามีเงินในบัญชี 1000 บาท
  double amountToPay = 0.0; // จำนวนเงินที่ต้องการจ่าย

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // แสดงยอดเงินคงเหลือ
            Text(
              "Available Balance: ฿${balance.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 24, // ขนาดตัวอักษรที่คุณต้องการ
                fontWeight: FontWeight.bold, // ความหนาของตัวอักษร
                color: Colors.black, // สีของตัวอักษร
              ),
            ),
            const SizedBox(height: 20),

            // ช่องกรอกจำนวนเงินที่ต้องการจ่าย
            TextField(
              decoration: const InputDecoration(
                labelText: "Amount to Pay",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  amountToPay = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            const SizedBox(height: 20),

            // ปุ่มตรวจสอบการชำระเงิน
            ElevatedButton(
              onPressed: () {
                _processPayment();
              },
              child: const Text("Pay Now"),
            ),
          ],
        ),
      ),
    );
  }

  void _processPayment() {
    // ตรวจสอบว่ามียอดเงินเพียงพอสำหรับการชำระเงิน
    if (amountToPay <= 0) {
      _showDialog("Invalid Amount", "Please enter a valid amount to pay.");
    } else if (amountToPay > balance) {
      _showDialog("Insufficient Balance", "You do not have enough balance.");
    } else {
      // ตัดเงินจากยอดเงิน
      setState(() {
        balance -= amountToPay;
      });
      _showDialog("Payment Successful", "You have successfully paid ฿${amountToPay.toStringAsFixed(2)}");
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}