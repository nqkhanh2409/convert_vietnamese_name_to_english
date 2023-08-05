// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

import 'items.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<DataItems> items;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  void handleDeleteItem(String id) {
    setState(() {
      widget.items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lịch sử dịch'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: widget.items.isEmpty
              ? const Center(
                  child: Text("Chưa có dữ liệu nào",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                )
              : ListView.builder(
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    return card_history(
                        item: widget.items[index],
                        handleDeleteItem: handleDeleteItem);
                  },
                ),
        ),
      ),
    );
  }
}

class card_history extends StatelessWidget {
  card_history({
    super.key,
    required this.item,
    required this.handleDeleteItem,
  });
  DataItems item;
  Function handleDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${item.ho} ${item.tenDem} ${item.ten}",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDeleteItem(item.id);
                }
                return;
              },
              child: const Icon(Icons.delete, color: Colors.red, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
