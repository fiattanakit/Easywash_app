class Food {
  final String name;              // ชื่อของเครื่องซักผ้า เช่น "Washing Machine Inthanin Dormitory"
  final String description;       // คำอธิบายของเครื่องซักผ้า
  final String imagePath;         // ที่อยู่ของรูปภาพเครื่องซักผ้า
  final double price;             // ราคาของเครื่องซักผ้า
  final FoodCategory category;     // หมวดหมู่ของการซักผ้า
  List<Addon> availableAddons;     // รายการส่วนเพิ่มเติมที่มีให้

  Food({
    required this.name,            // กำหนดชื่อของเครื่องซักผ้า
    required this.description,     // กำหนดคำอธิบายของเครื่องซักผ้า
    required this.imagePath,       // กำหนดที่อยู่ของรูปภาพเครื่องซักผ้า
    required this.price,           // กำหนดราคาของเครื่องซักผ้า
    required this.category,        // กำหนดหมวดหมู่การซักผ้า
    required this.availableAddons, // กำหนดรายการส่วนเพิ่มเติมที่มีให้
  });
}

// หมวดหมู่อาหาร (หรือการซักผ้า)
enum FoodCategory {
  washingMachine,          // Washing machine (เครื่องซักผ้า)
  dryer,                   // Dryer (เครื่องอบผ้า)
  contactServiceCenter,    // Contact service center (ติดต่อศูนย์บริการ)
}
// ส่วนเพิ่มเติม (Add-ons)
class Addon {
  final String name;   // ชื่อของส่วนเพิ่มเติม
  final double price;  // ราคาของส่วนเพิ่มเติม

  Addon({
    required this.name,  // กำหนดชื่อของส่วนเพิ่มเติม
    required this.price, // กำหนดราคาของส่วนเพิ่มเติม
  });
}
