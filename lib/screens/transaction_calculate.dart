import 'package:bank_ui/classes/user_data.dart';
import 'package:bank_ui/screens/send_money_button.dart';
import 'package:bank_ui/screens/transaction_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalculateTransaction extends StatefulWidget {
  CalculateTransaction({Key? key, required this.data});
  late UserData data;
  @override
  State<CalculateTransaction> createState() => _CalculateTransactionState();
}

class _CalculateTransactionState extends State<CalculateTransaction> {
  final NumberFormat usCurrency = NumberFormat("#,##0", "en_US");
  List<int> moneySum = [0];
  late String x;
  Widget transactionButton(dynamic buttonName) {
    return TextButton(
      onPressed: () => callback(buttonName),
      child: Text(
        buttonName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  callback(String btnName) {
    if (btnName == 'X') {
      if (moneySum.last == 0 && moneySum.length <= 1) {
        return;
      } else {
        moneySum.removeLast();
      }
    } else {
      if (widget.data.result < 4294967296) {
        moneySum.add(int.parse(btnName));
      }
    }

    setState(() {
      x = moneySum.join('');
      widget.data.result = int.parse(x);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x1016010A),
      appBar: AppBar(
        title: const Text(
          'Transfering',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xff5B645B),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(widget.data.image!),
                  ),
                ),
              ),
            ),
            Text(
              widget.data.name!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.data.cardNumber!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            '\$ ${usCurrency.format(widget.data.result)}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Comission is not charged',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 0.8,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                transactionButton('1'),
                transactionButton('2'),
                transactionButton('3'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                transactionButton('4'),
                transactionButton('5'),
                transactionButton('6'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                transactionButton('7'),
                transactionButton('8'),
                transactionButton('9'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 65,
                ),
                transactionButton('0'),
                transactionButton('X'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SendMoneyButton(
                title: 'Send Money',
                sendMoneyCalback: () async {
                  Route route = MaterialPageRoute(
                    builder: (context) => TransactionDetail(data: widget.data),
                  );
                  await Navigator.push(context, route);
                }),
          ],
        ),
      ),
    );
  }
}
