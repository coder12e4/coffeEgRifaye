import 'package:coffie_delivary/service/allproducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dataload extends StatefulWidget {
  const dataload({super.key});

  @override
  State<dataload> createState() => _dataloadState();
}

class _dataloadState extends State<dataload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Fetchdata().fetchdata(),
          builder: (context, snapshot) => Text(snapshot.data!.data[0].name),
        ),
      ),
    );
  }
}
