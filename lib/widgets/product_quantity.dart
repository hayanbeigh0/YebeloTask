import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product_model.dart';

class ProductQuantity extends StatefulWidget {
  const ProductQuantity({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductQuantity> createState() => _ProductQuantityState();
}

class _ProductQuantityState extends State<ProductQuantity> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 30,
                  child: GestureDetector(
                    onTap: quantity == 1
                        ? null
                        : () {
                            setState(() {
                              quantity--;
                            });
                          },
                    child: Icon(
                      Icons.remove,
                      size: 18,
                      color: quantity == 1 ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(quantity.toString()),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 30,
                  child: GestureDetector(
                    onTap: quantity == widget.product.pAvailability
                        ? null
                        : () {
                            setState(() {
                              quantity++;
                            });
                          },
                    child: Icon(
                      Icons.add,
                      size: 18,
                      color: quantity == widget.product.pAvailability
                          ? Colors.grey
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              '${widget.product.pAvailability.toString()} left in stock',
              style: GoogleFonts.lato(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
