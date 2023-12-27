import 'package:flutter/material.dart';
import '../../utils/global.dart';
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Map m1 = {};

  @override
  Widget build(BuildContext context) {
    m1 = ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green.shade300,
              title: const Text("Product"),
              centerTitle: true,
            ),
            body:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 350,
                  width: 800,
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 5,spreadRadius: 2)
                      ]
                  ),
                  child: Image.asset("${m1['image']}",fit: BoxFit.fill),
                ),
                const SizedBox(
                    height:5
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left:10),
                      child: Text("${m1['name']}",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:const EdgeInsets.only(left:10),
                      child: Text("${m1['country']}",
                          style: const TextStyle(
                            fontSize: 18,
                          )
                      ),
                    ),
                    Container(
                      child: Text("\$${m1['price']}",
                          style: const TextStyle(
                            fontSize: 18,
                          )
                      ),
                    ),
                  ],
                ),

                const Spacer(),
                InkWell(
                  onTap: () {
                    cartList.add(m1);
                    Navigator.pop(context, "Hello");
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top:10),
                    margin: const EdgeInsets.only(left:10,right:10,bottom:10),
                    height: 50,
                    width: double.infinity,
                    decoration:BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ) ,
                    child: const Text("Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            )
        )
    );

  }
}
