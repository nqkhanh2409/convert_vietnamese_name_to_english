import 'package:flutter/material.dart';
import 'package:tiengviet/tiengviet.dart';

import 'items.dart';

class SecondPage extends StatelessWidget {
  final String ho;
  final String tenDem;
  final String ten;
  final List<DataItems> items;

  const SecondPage(
      {super.key,
      required this.ho,
      required this.tenDem,
      required this.ten,
      required this.items});

  @override
  Widget build(BuildContext context) {
    void handleAddItem(String ho, tenDem, ten) {
      final newItem = DataItems(
          id: DateTime.now().toString(), ho: ho, tenDem: tenDem, ten: ten);
      items.add(newItem);
    }

    final String firstName = TiengViet.parse(ten);
    final String middleName = TiengViet.parse(tenDem);
    final String lastName = TiengViet.parse(ho);
    handleAddItem(lastName, middleName, firstName);
    // print(items);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kết quả'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text("$ho $tenDem $ten",
                    style: const TextStyle(fontSize: 25, color: Colors.red)),
              ),
              Container(
                width: double.infinity,
                height: 70,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          spreadRadius: 0,
                          offset: Offset(0, 2))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("First name: ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      Text(firstName,
                          style:
                              const TextStyle(fontSize: 20, color: Colors.red)),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 70,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          spreadRadius: 0,
                          offset: Offset(0, 2))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Middle name: ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      Text(middleName,
                          style:
                              const TextStyle(fontSize: 20, color: Colors.red)),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 70,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          spreadRadius: 0,
                          offset: Offset(0, 2))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Last name: ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      Text(lastName,
                          style:
                              const TextStyle(fontSize: 20, color: Colors.red)),
                    ],
                  ),
                ),
              ),
              const Text("Tên tiếng Anh của bạn là: ",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              Text("$firstName $middleName $lastName",
                  style: const TextStyle(fontSize: 25, color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
