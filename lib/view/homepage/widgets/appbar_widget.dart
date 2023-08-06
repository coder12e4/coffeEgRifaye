import 'package:coffie_delivary/core/colors.dart';
import 'package:flutter/material.dart';

class AppbarWideget extends StatelessWidget {
  const AppbarWideget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.location_on, color: purple),
        Text("Porto Alegre, RS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )),
        SizedBox(
          width: 190,
        ),
        Icon(
          Icons.shopping_cart,
          color: yellowDark,
        )
      ],
    );
  }
}
