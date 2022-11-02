import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_task/logic/blocs/shopping_cart_bloc/shopping_cart_bloc.dart';

import '../models/product_model.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.productList});
  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 0,
        bottom: 20,
      ),
      itemExtent: 150,
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              height: 120,
              width: 120,
              child: Image.network(
                productList[index].pImageUrl.toString(),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  productList[index].pName.toString(),
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(189, 0, 0, 0),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  productList[index].pDetails.toString(),
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '₹ ${productList[index].pCost.toString()}',
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          disabledForegroundColor: Colors.grey,
                          foregroundColor: Colors.green,
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: productList[index].pAvailability == 0
                            ? null
                            : () {
                                BlocProvider.of<ShoppingCartBloc>(context).add(
                                  AddToCart(
                                    product: productList[index],
                                  ),
                                );
                              },
                        child: Text(
                          'Add to cart',
                          style: GoogleFonts.lato(
                            // color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Text(
                        '${productList[index].pAvailability.toString()} left in stock',
                        style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
