import 'package:expense/models/transaction.dart';
import 'package:expense/widgets/transaction_list.dart';
import 'package:expense/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Tracker',
      home:  MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyHomePage extends StatefulWidget {
   MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransaction = [
      // Transaction(id: 'ti', title: 'New Shoes', amount: 12.90, date: DateTime.now()), 
      // Transaction(id: 't2', title: 'New Book', amount: 15.7, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle , double txAmount){
    final newTx= Transaction(id:DateTime.now().toString() , title: txTitle, amount: txAmount, date: DateTime.now());
     setState(() {
       _userTransaction.add(newTx);
     });
  }
   void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder:(_){
      return  
      GestureDetector(
        onTap: (){},
        child: NewTransaction(_addNewTransaction), 
        behavior: HitTestBehavior.opaque,);
        
    });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses' , style: TextStyle(color: Colors.white),),
        actions: [IconButton(onPressed:() => _startAddNewTransaction(context), icon:Icon(Icons.add , color: Colors.white,))],
        backgroundColor: Colors.purple,
      ),
      
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: const  Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ) , 
             TransactionList(_userTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _startAddNewTransaction(context), child: const Icon(Icons.add , color: Colors.white,) ,backgroundColor: Colors.purple,),
    );
  }
}