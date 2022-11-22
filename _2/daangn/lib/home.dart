import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String host = '127.0.0.1:3000';

  late List<String> addressList;
  late String selectAddress;
  List<dynamic> productList = List.empty(
    growable: true,
  );

  @override
  void initState() {
    addressList = ['북가좌동', '홍은동'];
    selectAddress = addressList.first;

    super.initState();

    Jiffy.locale('ko');
    getProductList();
  }

  //get DB list
  Future getProductList() async {
    try {
      var url = Uri.http(host, 'list');
      var response = await http.get(url);

      print('Response URL: ${url.toString()}');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      setState(() {
        productList = json.decode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: DropdownButton(
          value: selectAddress,
          dropdownColor: Colors.black,
          style: const TextStyle(
            backgroundColor: Colors.black,
            color: Colors.white,
            fontSize: 20.0,
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          underline: const SizedBox(
            height: 0,
          ),
          items: addressList.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) async {
            setState(() {
              selectAddress = value!;
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('search');
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print('menu');
            },
            icon: const Icon(Icons.menu),
          ),
          IconButton(
            onPressed: () {
              print('notifications');
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('floating action');
        },
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.all(10.0),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 홈
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              child: Column(
                children: const [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  Text(
                    '홈',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // 동네생활
            TextButton(
              onPressed: () {
                print('동네생활');
              },
              child: Column(
                children: const [
                  Icon(
                    Icons.library_books,
                    color: Colors.white,
                  ),
                  Text(
                    '동네생활',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // 내 위치
            TextButton(
              onPressed: () {
                print('내위치');
              },
              child: Column(
                children: const [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  Text(
                    '내위치',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // 채팅
            TextButton(
              onPressed: () {
                print('채팅');
              },
              child: Column(
                children: const [
                  Icon(
                    Icons.chat_bubble,
                    color: Colors.white,
                  ),
                  Text(
                    '채팅',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // 나의 장보
            TextButton(
              onPressed: () {
                print('나의 정보');
              },
              child: Column(
                children: const [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  Text(
                    '나의 정보',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.black,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: productList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => print(productList[index]),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          'http://${host}/${productList[index]['thumbnail']}',
                          width: 100,
                          height: 120,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productList[index]['title'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '${productList[index]['location']} - ${Jiffy(DateTime.tryParse(productList[index]['timestamp'])).fromNow()}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '${productList[index]['price']} 원',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
