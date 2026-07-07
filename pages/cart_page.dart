import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_cart_tile.dart';
import 'package:flutter_application_1/models/restaurant.dart';
import 'package:flutter_application_1/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // ดึงข้อมูลรถเข็นจาก Restaurant
        final userCart = restaurant.cart;

        // สร้าง UI Scaffold
        return Scaffold(
          appBar: AppBar(
            title: const Text("Bag"), // กำหนดชื่อหน้าจอเป็น "Cart"
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // ถังขยะ
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Are you sure you want to clear the cart?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            restaurant.clearCart(); // ลบข้อมูลในรถเข็น
                            Navigator.pop(context);
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              // แสดงข้อความเมื่อรถเข็นว่าง
              userCart.isEmpty
                  ? const Expanded(
                      child: Center(child: Text("Bag is empty..")),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length, // จำนวนรายการในรถเข็น
                        itemBuilder: (context, index) {
                          // ดึงแต่ละรายการในรถเข็น
                          final cartItem = userCart[index];

                          // แสดงข้อมูลแต่ละรายการในรูปแบบ MyCartTile
                          return MyCartTile(cartItem: cartItem);
                        },
                      ),
                    ),

              // ช่องว่างก่อนปุ่ม "Go to checkout"
              const SizedBox(height: 25),

              // ปุ่ม "Go to checkout"
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  PaymentPage(),
                      ),
                    );
                  },
                  text: "Go to checkout",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}