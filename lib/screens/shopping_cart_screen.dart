import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../logic/blocs/shopping_cart_bloc/shopping_cart_bloc.dart';
import '../widgets/shopping_cart_list.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                builder: (context, state) {
                  if (state is ShoppingCartLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ShoppingCartLoaded) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shopping cart',
                            style: GoogleFonts.lato(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'A total of ${state.shoppingCartList.length} items',
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 109, 108, 108),
                            ),
                          ),
                          Expanded(
                            child: state.shoppingCartList.isEmpty
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/empty-cart.jpg",
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40.0),
                                        child: Text(
                                          'Looks like you haven\'t added anything to your cart yet!',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lato(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 185, 181, 81),
                                            elevation: 0),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: SizedBox(
                                          width: 100,
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.arrow_back,
                                                size: 22,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Go back',
                                                style: GoogleFonts.lato(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : ShoppingCartList(
                                    shoppingCartList: state.shoppingCartList,
                                  ),
                          )
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
