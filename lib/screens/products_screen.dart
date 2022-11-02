import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../logic/blocs/products_bloc/products_bloc.dart';
import '../widgets/product_list.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool categoryAll = true;

  bool categoryPremium = false;

  bool categoryTamilNadu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
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
                                          child: const Center(
                                            child: Text(
                                              '1',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
            ],
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
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    categoryAll = true;
                    categoryPremium = false;
                    categoryTamilNadu = false;
                  });
                },
                child: Category(
                  currentCategory: categoryAll,
                  imagePath: "assets/images/fruits.png",
                  categoryName: 'All',
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    categoryAll = false;
                    categoryPremium = true;
                    categoryTamilNadu = false;
                  });
                },
                child: Category(
                  currentCategory: categoryAll,
                  imagePath: "assets/images/fruits.png",
                  categoryName: 'Premium',
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    categoryAll = false;
                    categoryPremium = false;
                    categoryTamilNadu = true;
                  });
                },
                child: Category(
                  currentCategory: categoryAll,
                  imagePath: "assets/images/temple.png",
                  categoryName: 'Tamil Nadu',
                ),
              ),
            ],
          ),
          BlocBuilder<ProductsBloc, ProductsState>(
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
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<ProductsBloc>(context)
                  .add(LoadTamilNaduProducts());
            },
            child: const Text('Load Tamilnadu Products'),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<ProductsBloc>(context).add(LoadPremiumProducts());
            },
            child: const Text('Load Premium Products'),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<ProductsBloc>(context).add(ProductLoadEvent());
            },
            child: const Text('Load All Products'),
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  Category(
      {super.key,
      required this.currentCategory,
      required this.imagePath,
      required this.categoryName});
  bool currentCategory;
  final String imagePath;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Card(
            color: currentCategory
                ? const Color.fromARGB(255, 155, 223, 159)
                : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.asset(imagePath),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          categoryName,
          style: GoogleFonts.lato(
            fontSize: 13,
          ),
        )
      ],
    );
  }
}
