import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffie_delivary/controller/cataloge_controller.dart';
import 'package:coffie_delivary/core/colors.dart';
import 'package:coffie_delivary/service/allproducts.dart';
import 'package:coffie_delivary/view/fetchdata.dart';
import 'package:coffie_delivary/view/homepage/widgets/carosil_widget.dart';
import 'package:coffie_delivary/view/homepage/widgets/coffie_card1.dart';
import 'package:coffie_delivary/view/homepage/widgets/coffie_card2.dart';
import 'package:coffie_delivary/view/homepage/widgets/coffie_card3.dart';
import 'package:coffie_delivary/view/product_page/product_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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
  late String? username;

  @override
  void initState() {
    // TODO: implement initState
    Fetchdata().fetchdata();
    // Map<String, dynamic> jwtDecoderToken = JwtDecoder.decode(widget.token);
    Map<String, dynamic> email = JwtDecoder.decode(widget.token);
    username = email['username'];
    print(email);
    print(username);
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
                                          hintText: username,
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







