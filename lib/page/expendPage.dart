import 'package:flutter_cashflow/helper/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpenditurePage extends StatefulWidget {
  AddExpenditurePage({Key? key}) : super(key: key);

  @override
  State<AddExpenditurePage> createState() => _AddExpenditurePageState();
}

class _AddExpenditurePageState extends State<AddExpenditurePage> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final DbHelper dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  void resetForm() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    amountController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 224, 179),
        appBar: AppBar(title: const Text("Tambah Pengeluaran")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: dateController,
                readOnly: true,
                onTap: () {},
                decoration: InputDecoration(labelText: "Tanggal : "),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Nominal : "),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "Keterangan"),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(const Color.fromARGB(255, 177, 172, 157)),
                      ),
                      onPressed: () {
                        resetForm();
                      },
                      child: const Text("Reset"),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 65, 238, 71)),
                      ),
                      onPressed: () async {
                        String date = dateController.text;
                        String amount = amountController.text;
                        String description = descriptionController.text;

                        if (date.isNotEmpty && amount.isNotEmpty) {
                          int rowCount = await dbHelper.insertExpense(
                              date, amount, description);
                          if (rowCount > 0) {
                            resetForm(); 
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Pengeluaran berhasil disimpan."),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Gagal menyimpan pemasukan."),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Tanggal dan Jumlah harus diisi."),
                            ),
                          );
                        }
                      },
                      child: const Text("Save"),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("<< Back"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
