import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        actions: [
          IconButton(
            color: Colors.blue,
            icon: Icon(Icons.notifications_none_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Cashy',
                style: TextStyle(color: Colors.blue, fontSize: 20),
                children: <TextSpan>[
                  TextSpan(text: 'Bank', style: TextStyle(color: Colors.black)),
                ],
              ),
            ],
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: "1234567890",
              expiryDate: "04/24",
              cardHolderName: "Nolan Gouse",
              cvvCode: "cvvCode",
              showBackView: false,
              cardBgColor: Colors.blue,
            ),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _customContainer(),
                    SizedBox(height: 30),
                    _transactions(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}

Widget _customContainer() {
  return Column(
    children: [
      SizedBox(
        height: 130,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.grey[200],
            elevation: 0,
            child: _customListTile(
                text: "eae", icon: Icons.add, textButton: "Learn More")),
      ),
    ],
  );
}

Widget _transactions() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "Transactions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.black,
            child: Text(
              "View all",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ],
      ),
      _listTileTransactions(
        name: "Matheus Cavalcante",
        date: "14 August 2020",
        price: "145.00",
        image:
            "https://avatars0.githubusercontent.com/u/50497092?s=460&u=83ffaae386d1f2e5fce4054ca08dc3127590cccd&v=4",
      ),
      _listTileTransactions(
        name: "Obi Wan Kenobi",
        date: "14 October 2020",
        price: "200.00",
        image:
            "https://pyxis.nymag.com/v1/imgs/367/895/b06700f7cc976e0c87ee4489ff71ec41f9-21-obi-wan.rsquare.w1200.jpg",
      ),
    ],
  );
}

Widget _listTileTransactions(
    {String name, String date, String price, String image}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20, bottom: 20),
            height: 70,
            width: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(image),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                date,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          )
        ],
      ),
      Text(
        "\$$price",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget _customListTile({String text, String textButton, IconData icon}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        height: 70,
        width: 70,
        child: CircleAvatar(
          maxRadius: 30,
          backgroundColor: Colors.yellow,
          child: Icon(
            Icons.person_add_alt,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Refer a friend and get extra 10%\ncashback this month",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {},
            child: Text(
              "Learn More >",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      )
    ],
  );
}

Widget _bottomNavigationBar() {
  return Container(
    color: Colors.white,
    child: ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[200],
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_outlined), title: Text('')),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text('')),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
      ),
    ),
  );
}
