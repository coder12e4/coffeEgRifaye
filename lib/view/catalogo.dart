import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffie_delivary/controller/cataloge_controller.dart';
import 'package:coffie_delivary/core/colors.dart';
import 'package:coffie_delivary/service/allproducts.dart';
import 'package:coffie_delivary/view/fetchdata.dart';
import 'package:coffie_delivary/view/product_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';

class catalogePage extends StatefulWidget {
  catalogePage({required this.token, super.key});

  var token;

  @override
  State<catalogePage> createState() => _catalogePageState();
}

class _catalogePageState extends State<catalogePage> {
  ScrollController _scrollController = ScrollController();
  final List<String> category = ['TRADICIONAIS', 'DOCES', 'ESPECIAIS'];
  String selectedCategory = 'TRADICIONAIS';
  late String? email;
  @override
  void initState() {
    // TODO: implement initState
    Fetchdata().fetchdata();
    // Map<String, dynamic> jwtDecoderToken = JwtDecoder.decode(widget.token);
    email = widget.token['data']['email'];
    print(widget.token.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _catalogController = CatalogController();
    final respowidth = MediaQuery.of(context).size.width;
    final respohight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: basegray,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: purple),
                        Text("Porto Alegre, RS",
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: yellowDark,
                    )
                  ],
                ),
              ),
            )
          ],
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 400.h,
                  width: respowidth,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: Container(
                          width: respowidth,
                          height: 305.h,
                          color: basegray,
                          child: Stack(children: [
                            Positioned(
                                top: 100.h,
                                right: 40.w,
                                child: Image.asset('assets/images/seed.png')),
                            Positioned(
                                top: 0,
                                left: 15.w,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  child: Text(
                                      'Encontre o café perfeito para\nqualquer hora do dia',
                                      style: GoogleFonts.baloo2(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      )),
                                )),
                            Positioned(
                              top: 60.h,
                              left: 15.w,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Container(
                                  height: 40.h,
                                  width: 285.w,
                                  color: baseGray200,
                                  child: SizedBox(
                                    width: double
                                        .infinity, // Add a finite width to the TextFormField
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.search,
                                            color: Colors.white54,
                                          ),
                                          hintText: email,
                                          hintStyle: GoogleFonts.baloo2(
                                              color: Colors.white54),
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
                      Carousilwidget(respowidth: respowidth),
                    ],
                  ),
                ),
                Container(
                  // height: respohight,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 35.w,
                        ),
                        child: Text(
                          'Nossos cafes',
                          style:
                              GoogleFonts.baloo2(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
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
      left: 15.w,
      top: 130.h,
      child: Container(
        height: 300.h,
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
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => dataload(),
                    ));
                  },
                  child: Stack(
                    children: [
                      Positioned(
                        top: 28.h,
                        child: Container(
                            margin: const EdgeInsets.only(left: 25),
                            width: 180.w,
                            height: 202.h,
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
                          left: 65.w,
                          child: Image.asset('assets/images/Image (1).png')),
                      Positioned(
                        top: 85.h,
                        left: 90.w,
                        child: Container(
                          width: 50.w,
                          decoration: const BoxDecoration(
                              color: purpleWhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Center(
                            child: Text(
                              'DOCE',
                              style: GoogleFonts.baloo2(
                                  color: purpleDrk,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 110.h,
                          left: 67.w,
                          child: Text(
                            'Mocaccino',
                            style: GoogleFonts.baloo2(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          )),
                      Positioned(
                          top: 140.h,
                          left: 35.w,
                          child: Container(
                            width: 160.w,
                            child: Center(
                              child: Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(
                                  text:
                                      'Cafe expresso com o dobro de leite e espuma cremosa',
                                ),
                                style: GoogleFonts.baloo2(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                          )),
                      Positioned(
                          top: 180.h,
                          left: 70.h,
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
                  ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 35.w),
          child: Text(selectedCategory,
              style: GoogleFonts.baloo2(fontWeight: FontWeight.w500)),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount: 3,
          itemBuilder: (context, index) {
            if (selectedCategory == 'TRADICIONAIS') {
              return Column(
                children: [
                  coffiecard1(selectedCategory: selectedCategory),
                ],
              );
            } else if (selectedCategory == 'DOCES') {
              return coffiecard2(
                selectedCategory: selectedCategory,
              );
            } else if (selectedCategory == 'ESPECIAIS') {
              return coffiecard3(
                selectedCategory: selectedCategory,
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}

class coffiecard1 extends StatelessWidget {
  final String selectedCategory;
  const coffiecard1({
    super.key,
    required this.selectedCategory,
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
          padding: EdgeInsets.only(left: 35.w),
          child: Container(
            height: 120.h,
            child: Stack(
              children: [
                Positioned(
                  top: 10.h,
                  child: Container(
                    height: 100.h,
                    width: 300.w,
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
                  top: 20.h,
                  left: 120.w,
                  child: Container(
                    width: 180.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expresso Tradicional',
                          style: GoogleFonts.baloo2(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            'O tradicional café feito com água quente e grãos moídos',
                            style: GoogleFonts.baloo2(
                                fontSize: 13, color: Colors.black38)),
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
                    top: -4.h,
                    left: 10.w,
                    child: Image.asset('assets/images/Image (2).png')),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}

class coffiecard2 extends StatelessWidget {
  final String selectedCategory;
  const coffiecard2({
    super.key,
    required this.selectedCategory,
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
          padding: EdgeInsets.only(left: 35.w),
          child: Container(
            height: 120.h,
            child: Stack(
              children: [
                Positioned(
                  top: 10.h,
                  child: Container(
                    height: 100.h,
                    width: 300.w,
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
                  top: 20.h,
                  left: 120.w,
                  child: Container(
                    width: 180.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expresso Tradicional',
                          style: GoogleFonts.baloo2(
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
                    top: -4.h,
                    left: 10.w,
                    child: Image.asset('assets/images/Image (2).png')),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}

class coffiecard3 extends StatelessWidget {
  final String selectedCategory;
  const coffiecard3({
    super.key,
    required this.selectedCategory,
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
          padding: EdgeInsets.only(left: 35.w),
          child: Container(
            height: 120.h,
            child: Stack(
              children: [
                Positioned(
                  top: 10.h,
                  child: Container(
                    height: 100.h,
                    width: 300.w,
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
                  top: 20.h,
                  left: 120.w,
                  child: Container(
                    width: 180.w,
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
                    top: -4.h,
                    left: 10.w,
                    child: Image.asset('assets/images/Image (2).png')),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
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
