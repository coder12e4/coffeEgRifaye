import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffie_delivary/controller/cataloge_controller.dart';
import 'package:coffie_delivary/core/colors.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class catalogePage extends StatefulWidget {
  const catalogePage({super.key});

  @override
  State<catalogePage> createState() => _catalogePageState();
}

class _catalogePageState extends State<catalogePage> {
  ScrollController _scrollController = ScrollController();
  final List<String> category = ['TRADICIONAIS', 'DOCES', 'ESPECIAIS'];
  String selectedCategory = 'TRADICIONAIS';

  @override
  Widget build(BuildContext context) {
    final _catalogController = CatalogController();
    final respowidth = MediaQuery.of(context).size.width;
    final respohight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: basegray,
              title: Row(
                children: [
                  Icon(Icons.location_on, color: purple),
                  Text("Porto Alegre, RS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
              actions: [
                Icon(
                  Icons.shopping_cart,
                  color: yellowDark,
                )
              ],
            )
          ],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 350,
                  width: respowidth,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: Container(
                          width: respowidth,
                          height: 345,
                          color: basegray,
                          child: Stack(children: [
                            Positioned(
                                top: 130,
                                right: 40,
                                child: Image.asset('assets/images/seed.png')),
                            const Positioned(
                                top: 0,
                                left: 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  child: Text(
                                      'Encontre o café perfeito para\nqualquer hora do dia',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      )),
                                )),
                            Positioned(
                              top: 80,
                              left: 10,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Container(
                                  height: 50,
                                  width: 340,
                                  color: baseGray200,
                                  child: SizedBox(
                                    width: double
                                        .infinity, // Add a finite width to the TextFormField
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.search,
                                            color: Colors.white54,
                                          ),
                                          hintText: 'Pesquisar',
                                          hintStyle:
                                              TextStyle(color: Colors.white54),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3)))),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      // Carousilwidget(respowidth: respowidth),
                    ],
                  ),
                ),
                Container(
                  height: 900,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 35,
                        ),
                        child: Text(
                          'Nossos cafes',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ...Iterable<int>.generate(
                                  _catalogController.categories.length)
                              .map(
                            (int pageIndex) => Flexible(
                                child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: purple),
                                  // color: purple,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                              child: ElevatedButton(
                                  onPressed: () => _updateSelectedCategory(
                                      category[pageIndex]),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (states) {
                                        if (category[pageIndex] ==
                                            selectedCategory) {
                                          return purple; // Change button color for selected category
                                        } else {
                                          return Colors.white;
                                        }
                                      },
                                    ),
                                  ),
                                  child: Text(
                                    _catalogController.categories[pageIndex],
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: category[pageIndex] ==
                                              selectedCategory
                                          ? Colors.white
                                          : purple,
                                    ),
                                  )),
                            )
                                //  ElevatedButton(
                                //   onPressed: () =>
                                //       controller.animateToPage(pageIndex),
                                //   child: Text("$pageIndex"),
                                // ),
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Catogary1(
                          scrollController: _scrollController,
                          category: category,
                          selectedCategory: selectedCategory),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateSelectedCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }
}

class Carousilwidget extends StatelessWidget {
  const Carousilwidget({
    super.key,
    required this.respowidth,
  });

  final double respowidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 180,
      child: Container(
        height: 300,
        width: respowidth,
        child: CarouselSlider(
          options: CarouselOptions(
              initialPage: 0,
              disableCenter: false,
              scrollPhysics: const BouncingScrollPhysics(),
              padEnds: false,
              viewportFraction: 0.6,
              enableInfiniteScroll: false,
              autoPlay: false,
              enlargeCenterPage: true,
              enlargeFactor: 0.4,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Positioned(
                      top: 30,
                      child: Container(
                          margin: const EdgeInsets.only(left: 25),
                          width: 200,
                          height: 262,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 214, 212, 212),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(15)),
                          ),
                          child: const Column(
                            children: [],
                          )),
                    ),
                    Positioned(
                        top: 0,
                        left: 75,
                        child: Image.asset('assets/images/Image (1).png')),
                    Positioned(
                      top: 110,
                      left: 100,
                      child: Container(
                        width: 50,
                        decoration: const BoxDecoration(
                            color: purpleWhite,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: const Center(
                          child: Text(
                            'DOCE',
                            style: TextStyle(
                                color: purpleDrk, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                        top: 140,
                        left: 78,
                        child: Text(
                          'Mocaccino',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        )),
                    Positioned(
                        top: 180,
                        left: 45,
                        child: Container(
                          width: 160,
                          child: const Center(
                            child: Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                text:
                                    'Cafe expresso com o dobro de leite e espuma cremosa',
                              ),
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11),
                            ),
                          ),
                        )),
                    const Positioned(
                        top: 230,
                        left: 100,
                        child: Text.rich(
                          TextSpan(
                              style: TextStyle(
                                  color: yellow,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                              text: 'RS ',
                              children: [
                                TextSpan(
                                    text: '9,90',
                                    style: TextStyle(
                                        color: yellowDark,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ]),
                        ))
                  ],
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Catogary1 extends StatelessWidget {
  const Catogary1({
    super.key,
    required ScrollController scrollController,
    required this.category,
    required this.selectedCategory,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<String> category;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 700,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _scrollController,
            itemCount: 3,
            itemBuilder: (context, index) {
              if (selectedCategory == 'TRADICIONAIS') {
                return const coffiecard();
              }

              if (category[index] == selectedCategory) {
                return Container(
                  height: 60,
                  color: purple,
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}

class Catogary2 extends StatelessWidget {
  const Catogary2({
    super.key,
    required ScrollController scrollController,
    required this.category,
    required this.selectedCategory,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<String> category;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('TRADICIONAIS'),
        Container(
          height: 700,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _scrollController,
            itemCount: 3,
            itemBuilder: (context, index) {
              if (selectedCategory == 'TRADICIONAIS') {
                return const coffiecard();
              }

              if (category[index] == selectedCategory) {
                return Container(
                  height: 60,
                  color: purple,
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}

class Catogary3 extends StatelessWidget {
  const Catogary3({
    super.key,
    required ScrollController scrollController,
    required this.category,
    required this.selectedCategory,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<String> category;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('TRADICIONAIS'),
        Container(
          height: 700,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _scrollController,
            itemCount: 3,
            itemBuilder: (context, index) {
              if (selectedCategory == 'TRADICIONAIS') {
                return const coffiecard();
              }

              if (category[index] == selectedCategory) {
                return Container(
                  height: 60,
                  color: purple,
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}

class coffiecard extends StatelessWidget {
  const coffiecard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: Text(''),
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Container(
            height: 140,
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  child: Container(
                    height: 120,
                    width: 311,
                    decoration: const BoxDecoration(
                        color: baseGrat500,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(6),
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(36))),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 120,
                  child: Container(
                    width: 180,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expresso Tradicional',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            'O tradicional café feito com água quente e grãos moídos',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black38)),
                        Text.rich(
                          TextSpan(
                              style: TextStyle(
                                  color: yellow,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                              text: 'RS ',
                              children: [
                                TextSpan(
                                    text: '9,90',
                                    style: TextStyle(
                                        color: yellowDark,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: -4,
                    left: 10,
                    child: Image.asset('assets/images/Image (2).png')),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

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
