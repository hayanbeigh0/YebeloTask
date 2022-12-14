import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_task/logic/blocs/shopping_cart_bloc/shopping_cart_bloc.dart';
import 'package:shopping_app_task/widgets/product_quantity.dart';

import '../models/product_model.dart';

class ShoppingCartList extends StatefulWidget {
  const ShoppingCartList({super.key, required this.shoppingCartList});
  final List<ProductModel> shoppingCartList;

  @override
  State<ShoppingCartList> createState() => _ShoppingCartListState();
}

class _ShoppingCartListState extends State<ShoppingCartList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemExtent: 150,
            shrinkWrap: true,
            itemCount: widget.shoppingCartList.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        height: 120,
                        width: 120,
                        child: Image.network(
                          widget.shoppingCartList[index].pImageUrl.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.shoppingCartList[index].pName.toString(),
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
                              widget.shoppingCartList[index].pDetails
                                  .toString(),
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
                              '₹ ${widget.shoppingCartList[index].pCost.toString()}',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            ProductQuantity(
                              product: widget.shoppingCartList[index],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: -15,
                    top: 0,
                    child: IconButton(
                      onPressed: () {
                        BlocProvider.of<ShoppingCartBloc>(context).add(
                          RemoveFromCart(
                              productId:
                                  widget.shoppingCartList[index].pId as int),
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 24,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 185, 181, 81),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Checkout',
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
