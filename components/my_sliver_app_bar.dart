import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340, // ความสูงเมื่อขยาย
      collapsedHeight: 120, // ความสูงเมื่อยุบ
      floating: false, // ไม่แสดง AppBar เมื่อเลื่อน
      pinned: true, // AppBar ยังคงแสดงอยู่เมื่อลดความสูง
      actions: [
        // ปุ่มตะกร้า
        IconButton(
          onPressed: () {
            // ไปที่หน้าตะกร้า
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  CartPage(), //อาจต้องเเก้
              ),
            );
          },
          icon: const Icon(Icons.shopping_bag),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface, // ตั้งค่าสีพื้นหลังของ AppBar
      title: const Text("EasyWash"), // ชื่อของ AppBar
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0), // ระยะห่างด้านล่างของเนื้อหา
          child: child, // วิดเจ็ตที่แสดงเป็นพื้นหลัง
        ),
        title: title, // วิดเจ็ตที่จะแสดงเป็นชื่อ (ส่วนล่างของพื้นที่ที่ปรับขนาดได้)
        centerTitle: true, // ทำให้ชื่ออยู่ตรงกลาง
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0), // ระยะห่างของชื่อ
        expandedTitleScale: 1, // ขนาดของชื่อเมื่อขยาย
      ),
    );
  }
}