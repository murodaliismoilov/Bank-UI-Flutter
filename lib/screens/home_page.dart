import 'package:bank_ui/classes/user_data.dart';
import 'package:bank_ui/colors.dart';
import 'package:bank_ui/screens/transaction_calculate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

UserData data1 = UserData(
    result: 0,
    cardBalanse: 13546,
    cardNumber: '**** **** **** 2046',
    image: 'images/4.jpg',
    name: 'Mario');

UserData data2 = UserData(
    result: 0,
    cardBalanse: 13546,
    cardNumber: '**** **** **** 1845',
    image: 'images/1.jpg',
    name: 'Anna');

UserData data3 = UserData(
    result: 0,
    cardBalanse: 13546,
    cardNumber: '**** **** **** 4567',
    image: 'images/2.jpg',
    name: 'Margret');

UserData data4 = UserData(
    result: 0,
    cardBalanse: 13546,
    cardNumber: '**** **** **** 4578',
    image: 'images/3.jpg',
    name: 'Lusi');

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.data});
  final List<UserData> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 20,
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Transform.rotate(
            angle: 0.8,
            child: IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(
                LineAwesomeIcons.bell,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0x1016010A),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FullCardUI(),
              const SizedBox(
                height: 35,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FullSendUi(),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                'Recent Transactions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(
                height: 25,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: data.isEmpty
                        ? const Text('')
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: RecentTransactions(
                              image: data[index].image!,
                              tranSactionTitle: data[index].name!,
                              transactionDate: DateFormat.yMMMMd()
                                  .format(data[index].transFeringDate),
                              transactionSum: '-\$${data[index].result}',
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentTransactions extends StatelessWidget {
  final String tranSactionTitle;
  final String transactionDate;
  final String image;
  final dynamic transactionSum;
  const RecentTransactions({
    super.key,
    required this.tranSactionTitle,
    required this.transactionDate,
    required this.image,
    required this.transactionSum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 400,
        minHeight: 85,
        maxWidth: double.infinity,
        maxHeight: double.infinity,
      ),
      decoration: BoxDecoration(
          color: cardAmazonColor, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tranSactionTitle,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    transactionDate,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: AutoSizeText(
                    '$transactionSum',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  const CardContainer(
      {super.key, required this.cardNumber, required this.balanse});
  final String cardNumber;
  final String balanse;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 250,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 22, left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Balanse',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SvgPicture.asset(
                  'images/mastercard-logo.svg',
                  width: 30,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: AutoSizeText(
                "\$$balanse",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                maxLines: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '**** **** **** $cardNumber',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}

class FullSendUi extends StatelessWidget {
  const FullSendUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PeopleContainer(
          title: 'Send',
          child: Icon(Icons.arrow_forward),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            Route route = MaterialPageRoute(
              builder: (context) => CalculateTransaction(data: data1),
            );
            Navigator.push(context, route);
          },
          child: PeopleContainer(
            title: data1.name!,
            child: Image(
              image: AssetImage(data1.image!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            Route route = MaterialPageRoute(
              builder: (context) => CalculateTransaction(data: data2),
            );
            Navigator.push(context, route);
          },
          child: PeopleContainer(
            title: data2.name!,
            child: Image(
              image: AssetImage(data2.image!),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            Route route = MaterialPageRoute(
              builder: (context) => CalculateTransaction(data: data3),
            );
            Navigator.push(context, route);
          },
          child: PeopleContainer(
            title: data3.name!,
            child: Image(
              image: AssetImage(data3.image!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            Route route = MaterialPageRoute(
              builder: (context) => CalculateTransaction(data: data4),
            );
            Navigator.push(context, route);
          },
          child: PeopleContainer(
            title: data4.name!,
            child: Image(
              image: AssetImage(data4.image!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            Route route = MaterialPageRoute(
              builder: (context) => CalculateTransaction(data: data1),
            );
            Navigator.push(context, route);
          },
          child: PeopleContainer(
            title: data1.name!,
            child: Image(
              image: AssetImage(
                data1.image!,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class PeopleContainer extends StatelessWidget {
  final Widget child;
  final String title;
  const PeopleContainer({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.white, spreadRadius: 2),
                  ],
                ),
                child: ClipOval(
                  child: SizedBox.fromSize(
                      size: const Size.fromRadius(100), child: child),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(title),
            ],
          ),
        ],
      ),
    );
  }
}

class FullCardUI extends StatelessWidget {
  const FullCardUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          CardContainer(cardNumber: '5634', balanse: '13,256'),
          SizedBox(
            width: 20,
          ),
          CardContainer(cardNumber: '4534', balanse: '1,256'),
          SizedBox(
            width: 20,
          ),
          CardContainer(cardNumber: '7784', balanse: '125,245,045')
        ],
      ),
    );
  }
}
