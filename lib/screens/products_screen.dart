import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_task/screens/shopping_cart_screen.dart';

import '../logic/blocs/products_bloc/products_bloc.dart';
import '../logic/blocs/shopping_cart_bloc/shopping_cart_bloc.dart';
import '../widgets/category_item.dart';
import '../widgets/product_list.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool isFabVisible = true;
  bool categoryAll = true;

  bool categoryPremium = false;

  bool categoryTamilNadu = false;
  String currentCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            setState(() {
              isFabVisible = true;
            });
          }
          if (notification.direction == ScrollDirection.reverse) {
            setState(() {
              isFabVisible = false;
            });
          }
          return true;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 210,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 185, 181, 81),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.menu,
                            size: 28,
                            color: Colors.white,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                height: 35,
                                width: 65,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.grey,
                                      size: 22,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color.fromARGB(
                                              255, 185, 181, 81),
                                        ),
                                        child: Center(
                                          child: BlocConsumer<ShoppingCartBloc,
                                              ShoppingCartState>(
                                            listener: (context, state) {
                                              if (state
                                                  is AddToCartErrorState) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(state.error),
                                                  ),
                                                );
                                              }
                                            },
                                            builder: (context, state) {
                                              if (state
                                                  is ShoppingCartLoading) {
                                                return const Text('0');
                                              }

                                              if (state is ShoppingCartLoaded) {
                                                return Text(
                                                  state.shoppingCartList.length
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                );
                                              }
                                              return const Text('0');
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                height: 35,
                                width: 35,
                                child: Image.asset(
                                  "assets/images/shopping_avatar.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search foodstuffs',
                            hintStyle: const TextStyle(),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(71, 185, 181, 81),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  // color: Color.fromARGB(98, 185, 181, 81),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Categories',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentCategory = 'All';
                      categoryAll = true;
                      categoryPremium = false;
                      categoryTamilNadu = false;
                    });
                    BlocProvider.of<ProductsBloc>(context)
                        .add(ProductLoadEvent());
                  },
                  child: Category(
                    currentCategory: categoryAll,
                    imagePath: "assets/images/allfruits.png",
                    categoryName: 'All',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentCategory = 'Premium';
                      categoryAll = false;
                      categoryPremium = true;
                      categoryTamilNadu = false;
                    });
                    BlocProvider.of<ProductsBloc>(context)
                        .add(LoadPremiumProducts());
                  },
                  child: Category(
                    currentCategory: categoryPremium,
                    imagePath: "assets/images/fruits.png",
                    categoryName: 'Premium',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentCategory = 'Tamil Nadu';
                      categoryAll = false;
                      categoryPremium = false;
                      categoryTamilNadu = true;
                    });
                    BlocProvider.of<ProductsBloc>(context)
                        .add(LoadTamilNaduProducts());
                  },
                  child: Category(
                    currentCategory: categoryTamilNadu,
                    imagePath: "assets/images/temple.png",
                    categoryName: 'Tamil Nadu',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                currentCategory,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ProductsLoaded) {
                    return ProductList(productList: state.productList);
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: isFabVisible
          ? Container(
              margin: const EdgeInsets.all(10),
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 185, 181, 81),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ShoppingCartScreen(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.shopping_cart,
                ),
              ),
            )
          : null,
    );
  }
}
