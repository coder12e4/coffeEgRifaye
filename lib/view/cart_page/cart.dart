import 'package:coffie_delivary/core/colors.dart';
import 'package:coffie_delivary/view/cart_page/animation_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Bottemwidget(),
        appBar: AppBar(
          title: Text('Carrinho'),
        ),
        body: Column(
          children: [
            CartProduct(),

            // ListView(
            //   children: [

            //     Container(
            //       height: 90,
            //       width: double.infinity,
            //       child: ListTile(
            //         leading: Image.asset('assets/images/Image (2).png'),
            //         title: Text('Irlandes'),
            //         subtitle: Column(
            //           children: [
            //             Text('227ml'),
            //             Row(
            //               children: [
            //                 Container(
            //                   child: Row(
            //                     children: [
            //                       Text('-'),
            //                       Text('1'),
            //                       Text('+'),
            //                     ],
            //                   ),
            //                 ),
            //                 Container(
            //                   child: Icon(Icons.delete),
            //                 )
            //               ],
            //             )
            //           ],
            //         ),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

class Bottemwidget extends StatelessWidget {
  const Bottemwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black54,
          blurRadius: 10.9,
          spreadRadius: 0.1,
        ),
      ], color: Colors.white),
      height: 150,
      // color: yellowDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('valor total'), Text('R\$ 9,90')],
            ),
          ),
          Container(
            height: 50,
            width: 330,
            color: yellow,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimationCart(),
                  ));
                },
                child: Text('CONFIRMAR PEDIDO',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CartProduct extends StatelessWidget {
  const CartProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 252, 251, 253),
        border: Border.all(color: const Color.fromARGB(31, 119, 118, 118)),
      ),
      child: ListTile(
        leading: Image.asset('assets/images/Image (2).png'),
        title: Text(
          'Irlandes',
          style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text('227ml'),
            ),
            Row(
              children: [
                Container(
                  width: 110.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove,
                            color: purple,
                          )),
                      Text(
                        '1',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: purple,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 239, 248),
                      boxShadow: [BoxShadow()]),
                  child: Icon(Icons.delete),
                )
              ],
            )
          ],
        ),
        trailing: Text(
          'Rs 9,80',
          style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
