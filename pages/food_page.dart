import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/models/Food.dart';
import 'package:flutter_application_1/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food; // Variable to store food information
  final Map<Addon, bool> selectedAddons =
      {}; // Variable to store the selected add-ons' status

  FoodPage({super.key, required this.food}) {
    // Initialize selectedAddons with the available add-ons
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false; // Default to false for all add-ons
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);

    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scaffold provides the basic material design layout structure
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligns children to the left
              children: [
                // Display the food image
                Image.asset(widget.food.imagePath),

                Padding(
                  padding:
                      const EdgeInsets.all(25.0), // Padding around the content
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Aligns text to the left
                    children: [
                      // Food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      // Food price
                      Text(
                        '฿${widget.food.price}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .primary, // Primary color from theme
                        ),
                      ),

                      // Food description
                      Text(widget.food.description),

                      const SizedBox(height: 10), // Spacing between elements
                      Divider(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary), // Divider line

                      const SizedBox(height: 10), // Additional spacing

                      // Add-ons header
                      Text(
                        "Add-ons",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                          height: 10), // Spacing before the add-ons list

                      // Container for add-ons list
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary, // Border color
                          ),
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                        ),
                        child: ListView.builder(
                          shrinkWrap:
                              true, // Prevents ListView from expanding beyond necessary
                          physics:
                              const NeverScrollableScrollPhysics(), // Disables scrolling in ListView
                          itemCount: widget
                              .food.availableAddons.length, // Number of add-ons
                          itemBuilder: (context, index) {
                            Addon addon = widget
                                .food.availableAddons[index]; // Get each add-on

                            return CheckboxListTile(
                              title: Text(addon.name), // Add-on name
                              subtitle: Text(
                                '฿${addon.price}', // Add-on price
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary, // Primary color from theme
                                ),
                              ),
                              value: widget.selectedAddons[
                                  addon], // Current selection state
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] =
                                      value!; // Update selection state
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // "Add to cart" button
                MyButton(
                  text: "Add to cart",
                  onTap: () => addToCart(
                      widget.food,
                      widget
                          .selectedAddons), // Functionality when the button is pressed},
                ),

                const SizedBox(height: 25), // Bottom spacing
              ],
            ),
          ),
        ),

        // Back Button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .secondary, // Secondary color from theme
                shape: BoxShape.circle, // Circular shape
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded), // Back icon
                onPressed: () {
                  // Optional: Add any action you want before navigating back
                  // For example, you might want to show a confirmation dialog

                  // Navigate back to the previous screen
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
