import 'package:dc_app/models/order.dart';
import 'package:dc_app/providers/order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DentistScreen extends StatefulWidget {
  const DentistScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DentistScreen> createState() => _DentistScreenState();
}

class _DentistScreenState extends State<DentistScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final orderMdl = Provider.of<OrderProvider>(context, listen: false);
    orderMdl.getOrdersData();
  }

  @override
  Widget build(BuildContext context) {
    final orderMdl = Provider.of<OrderProvider>(context);
    List _upComingOrders = orderMdl.allOrders;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: white),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 10.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(""),
                  ),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Уянга",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "99112233",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Эмч",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w100),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 80,
              // padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 20),
                  categoryItem("Хуваарь", () {}),
                  SizedBox(width: 10),
                  categoryItem("Үзүүлэлт", () {}),
                  SizedBox(width: 10),
                  categoryItem("Үзүүлэлт", () {}),
                  SizedBox(width: 10),
                  categoryItem("Үзүүлэлт", () {}),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              width: MediaQuery.of(context).size.width,
              height: 310,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: white),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(143, 148, 251, .2),
                      blurRadius: 10.0,
                      offset: Offset(10, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Өнөөдрийн үзлэгүүд",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: secondary),
                          ),
                          padding: EdgeInsets.zero,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              alignment: Alignment.centerLeft,
                            ),
                            child: Icon(
                              CupertinoIcons.star_fill,
                              color: secondary,
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _upComingOrders.length,
                        itemBuilder: (BuildContext ctx, int i) {
                          Order el = _upComingOrders[i];
                          return orderPreview(el);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: secondary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Container orderPreview(Order el) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: secondary),
        ),
      ),
      child: (ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.star, color: secondary),
          ],
        ),
        title: Text("${el.consumerName}"),
        subtitle: Text("${el.orderType.typeName}"),
        trailing: Text(
          DateFormat("Hm").format(el.startDate),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        horizontalTitleGap: 10,
        contentPadding: EdgeInsets.all(0),
        enabled: true,
        onTap: () {
          print("clicked");
        },
      )),
    );
  }

  ElevatedButton categoryItem(String title, onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: secondary),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.list_alt), Text(title)],
      ),
    );
  }
}
