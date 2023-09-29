import 'package:flutter_cashflow/constant/route_constant.dart';
import 'package:flutter_cashflow/helper/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:flutter_cashflow/provider/user_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int totalIncome = 0;
  int totalExpense = 0;

  @override
  void initState() {
    super.initState();
    _fetchTotalIncomeAndExpense();
  }

  Future<void> _fetchTotalIncomeAndExpense() async {
    final dbHelper = DbHelper();

    final income = await dbHelper.getTotalIncome();
    final expense = await dbHelper.getTotalExpense();

    setState(() {
      totalIncome = income;
      totalExpense = expense;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchTotalIncomeAndExpense(); 
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 224, 179),
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
            child: Column(
          children: [
            Text("Total Pengeluaran: \Rp $totalExpense",
            style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    ),
                ),
            Text("Total Pemasukan: \Rp $totalIncome",
            style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    ),
                ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 20,
            ),

            Image.asset(
                  'assets/images/designer.png',
                  height: 200,
                  width: 200,
                ),

            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {
                          Navigator.pushNamed(context, addIncomeRoute);
                        },
                        child: Column(
                          children: [
                            Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  "assets/images/income.png",
                                ),
                              ),
                          ],
                        ),
                          ),
                        ),
                        Text(
                        "Tambah Pemasukan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {
                          Navigator.pushNamed(context, addExpenseRoute);
                        },
                        child: Column(
                          children: [
                            Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  "assets/images/pengeluaran.png",
                                ),
                              ),
                          ],
                        ),
                          ),
                        ),
                        Text(
                        "Tambah Pengeluaran",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {
                          Navigator.pushNamed(context, detailCashFlowRoute);
                        },
                        child: Column(
                          children: [
                            Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  "assets/images/cash-flow.png",
                                ),
                              ),
                          ],
                        ),
                          ),
                        ),
                        Text(
                        "Detail Cash Flow",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                        child: Column(
                          children: [
                            Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  "assets/images/settings.png",
                                ),
                              ),
                          ],
                        ),
                          ),
                        ),
                        Text(
                        "Pengaturan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                      ],
                    ),
                  ],
                ),
              ],
            )

          ],
        )),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const NavButton(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 50,
            color: const Color.fromARGB(255, 243, 177, 33),
          ),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}
