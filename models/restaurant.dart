import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_item.dart';

import 'Food.dart';

class Restaurant extends ChangeNotifier {
  // รายการอาหาร (เมนู)
  final List<Food> _menu = [
    // washingMachine
    Food(
      name: "WashingMachine",
      description: "washingMachineInthanin Dormitory",
      imagePath: "lib/images/1.png",
      price: 20,
      category:
          FoodCategory.washingMachine, // ต้องแน่ใจว่ามี FoodCategory.burgers
      availableAddons: [
        Addon(name: "QuickWash", price: 5),
        Addon(name: "IntensiveWash", price: 10),
        Addon(name: " EcoWash", price: 0),
        Addon(name: " HeavyDuty", price: 15),
        Addon(name: " Delicate", price: 10),
      ],
    ),
    //dryer
    Food(
      name: "Dryer",
      description: "DryerInthanin Dormitory",
      imagePath: "lib/images/2.png",
      price: 20,
      category: FoodCategory.dryer, // ต้องแน่ใจว่ามี FoodCategory.burgers
      availableAddons: [
        Addon(name: "Ventless Dryers", price: 5),
        Addon(name: "Vented Dryers", price: 5),
        Addon(name: " EEnergy-Efficient Dryers", price: 5),
        Addon(name: "Smart Dryers ", price: 20),
        Addon(name: "Commercial Dryers", price: 10),
      ],
    ),
    //contactServiceCenter
    Food(
      name: "ContactServiceCenter",
      description: "contactServiceCenterInthanin Dormitory",
      imagePath: "lib/images/3.png",
      price: 0,
      category: FoodCategory
          .contactServiceCenter, // ต้องแน่ใจว่ามี FoodCategory.burgers
      availableAddons: [
        Addon(name: "phonenumber", price: 666 - 666 - 666),
      ],
    ),
  ];

  /*
  
  G E T T E R S

  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  final List<CartItem> _cart = [];
  // Add to cart method
  void addToCart(Food food, List<Addon> selectedAddons) {
    // Check if the food item is already in the cart
    CartItem? existingItem = _cart.firstWhereOrNull((item) {
      // Check if the food is the same
      bool isSameFood = item.food == food;

      // Check if the selected add-ons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      // Return true if both food and add-ons match
      return isSameFood && isSameAddons;
    });

    if (existingItem != null) {
      // If the item already exists in the cart, increase the quantity
      existingItem.quantity++;
    } else {
      // Add new item to cart
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
          quantity: 1, // New item starts with a quantity of 1
        ),
      );
    }

    // Notify listeners that the cart has changed
    notifyListeners();
  }

  // Remove from cart method
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        // Reduce the quantity if more than 1
        _cart[cartIndex].quantity--;
      } else {
        // Remove the item if the quantity is 1
        _cart.removeAt(cartIndex);
      }

      // Notify listeners that the cart has changed
      notifyListeners();
    }
  }

  // Calculate total price of items in the cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      // Multiply item total by the quantity
      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // Get the total count of items in the cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // Clear the cart
  void clearCart() {
    _cart.clear();

    // Notify listeners that the cart has been cleared
    notifyListeners();
  }
}
