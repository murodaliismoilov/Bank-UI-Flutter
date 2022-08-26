import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_ui/classes/user_data.dart';
import 'package:bank_ui/screens/home_page.dart';
import 'package:bank_ui/screens/send_money_button.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:intl/intl.dart';

List<UserData> userDatas = [];

class TransactionDetail extends StatelessWidget {
  TransactionDetail({
    super.key,
    required this.data,
  });
  final UserData data;

  final NumberFormat usCurrency = NumberFormat("#,##0", "en_US");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x1016010A),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              LineAwesomeIcons.telegram_plane,
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Stack(
              alignment: const Alignment(0.0, -1.25),
              children: [
                Container(
                  width: 320,
                  height: 400,
                  decoration: BoxDecoration(
                    color: const Color(0xff5F6460),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: Column(
                      children: [
                        AutoSizeText(
                          data.name!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.cardNumber!,
                          //style: const TextStyle(fontWeight: FontWeight.w300),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Transfering',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Success',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(data.cardNumber!),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$ ${usCurrency.format(data.cardBalanse)}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '\$ ${usCurrency.format(data.cardBalanse! - data.result)}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            dividerContainer(),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Expanded(
                          child: AutoSizeText(
                            '-\$${usCurrency.format(data.result)}',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xff5B645B),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(data.image!),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipOval(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff5F6460),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            LineAwesomeIcons.arrow_down,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipOval(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff5F6460),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            Icons.star_border,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SendMoneyButton(
              sendMoneyCalback: () async {
                userDatas.add(data);
                Route route = MaterialPageRoute(
                  builder: (context) => HomePage(data: userDatas),
                );
                await Navigator.push(context, route);
              },
              title: 'Done',
            ),
          ],
        ),
      ),
    );
  }
}

Widget dividerContainer() {
  return const Text(
    '-  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -',
    style: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
  );
}
