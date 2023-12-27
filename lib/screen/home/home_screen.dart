import 'package:ecommerce_app1/utils/global.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectCategory = "all";
  bool isFruits = true,isVegetables = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              actions:  [
                InkWell(
                    onTap:() {
                      Navigator.pushNamed(context,"cart");
                    },
                    child: const Icon(Icons.shopping_cart, color: Colors.black)
                ),
              ],
            ),
          body:Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left:20,top:15),
                margin: const EdgeInsets.all(10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    Text("\t\tSearch FoodStuffs",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    )

                  ],
                ),
                alignment:Alignment.topLeft,
              ),
              const SizedBox(
                height:20
              ),
              Container(
                margin: const EdgeInsets.only(left:20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DropdownButton(
                      value: selectCategory,
                      items: const [
                        DropdownMenuItem(child: Text("All"), value: "all"),
                        DropdownMenuItem(child: Text("Fruits"), value: "fruits"),
                        DropdownMenuItem(child: Text("Vegetables"), value: "vegetables"),
                      ],
                      onChanged: (String ? value )
                      {
                        setState(()
                        {
                          selectCategory = value;
                          if(value=="fruits")
                          {
                            isFruits=true;
                            isVegetables=false;
                          }
                          else if(value=="vegetables")
                          {
                            isFruits=false;
                            isVegetables=true;
                          }
                          else
                          {
                            isFruits=true;
                            isVegetables=true;
                          }

                        }
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left:10),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text(
                        "Popular FoodStuffs",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red
                        ),
                      ),
                    Text(
                      "View all  >",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.green,
                      ),
                    )
                ]
                    ),
              ),
            const SizedBox(height: 10),
            Container(
                margin: const EdgeInsets.only(left:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: isFruits,
                      child:  const Text(
                        "Fruits",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible:isFruits,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      fruitsList.length,
                          (index) => InkWell(
                        onTap: () {
                          Map m1 = fruitsList[index];
                          Navigator.pushNamed(context, 'product',
                              arguments: m1).then((value)=>print("$value"));
                        },
                        child: Container(
                          height: 180,
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration:  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 2,
                                    blurRadius: 5
                                )
                              ]),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                  visible: isFruits,
                                  child: Image.asset(
                                      "${fruitsList[index]['image']}",
                                      height: 80,
                                      width: 150
                                  )
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Visibility(
                                visible: isFruits,
                                child: Text(
                                  "${fruitsList[index]['name']}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Visibility(
                                visible: isFruits,
                                child: Text(
                                  "${fruitsList[index]['country']}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Visibility(
                                    visible: isFruits,
                                    child: Text(
                                      "\$${fruitsList[index]['price']}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Visibility(
                                    visible: isFruits,
                                    child: const Icon(
                                        Icons.add_box,size: 20,color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: isVegetables,
                      child:  const Text(
                        "Vegetables",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible:isVegetables,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      fruitsList.length,
                          (index) => InkWell(
                        onTap: () {
                          Map m1 = vegetablesList[index];
                          Navigator.pushNamed(context, 'product',
                              arguments: m1).then((value)=>print("$value"));
                        },
                        child: Container(
                          height: 180,
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration:  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 2,
                                    blurRadius: 5
                                )
                              ]),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Visibility(
                                  visible: isVegetables,
                                  child: Image.asset(
                                      "${vegetablesList[index]['image']}",
                                      height: 80,
                                      width: 150
                                  )
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Visibility(
                                visible: isVegetables,
                                child: Text(
                                  "${vegetablesList[index]['name']}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Visibility(
                                visible: isVegetables,
                                child: Text(
                                  "${vegetablesList[index]['country']}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Visibility(
                                    visible: isVegetables,
                                    child: Text(
                                      "\$${vegetablesList[index]['price']}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Visibility(
                                    visible: isVegetables,
                                    child: const Icon(
                                        Icons.add_box,size: 20,color: Colors.green),
                                  ),

                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ]
    ),
    ),
    );






  }
}
