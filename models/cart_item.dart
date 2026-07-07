import 'package:flutter_application_1/models/Food.dart';

class CartItem {
  Food food;  // ออบเจ็กต์อาหาร
  List<Addon> selectedAddons;  // ลิสต์ของส่วนเสริมอาหาร
  int quantity;  // จำนวนสินค้า

  // Constructor ของ CartItem
  CartItem({
    required this.food,  // ระบุอาหารที่เลือก
    required this.selectedAddons,  // ระบุส่วนเสริมที่เลือก
    this.quantity = 1,  // จำนวนเริ่มต้นคือ 1
  });

  // ฟังก์ชันสำหรับคำนวณราคาทั้งหมด
  double get totalPrice {
    // คำนวณราคารวมของส่วนเสริม
    double addonsPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    
    // คืนค่าราคารวม (ราคาของอาหาร + ราคารวมของส่วนเสริม) คูณด้วยจำนวนสินค้า
    return (food.price + addonsPrice) * quantity;
  }
}
