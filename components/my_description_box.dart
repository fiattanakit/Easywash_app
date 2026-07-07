import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    // TextStyle for primary color
   var myPrimaryTextStyle = 
       TextStyle(color: Theme.of(context).colorScheme.inversePrimary,);

// TextStyle for secondary color
    var mySecondaryTextStyle = 
        TextStyle(color: Theme.of(context).colorScheme.primary,
);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8)
      ), // BoxDecoration
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // delivery fee
          Column(
            children: [
              Text('20-100 baht',style: myPrimaryTextStyle,),
              Text('Washing price',style:mySecondaryTextStyle,),
            ],
          ), // Column

          // delivery time
          Column(
            children: [
              Text('30 minutes - 1 hour.',style: myPrimaryTextStyle,),
              Text('Washing time',style:mySecondaryTextStyle,),
            ],
          ), // Column
        ], // Row children
      ), // Row
    ); // Container
  }
}
