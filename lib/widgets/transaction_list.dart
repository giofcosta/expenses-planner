import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function onDelete;

  TransactionList(this.transactions, this.onDelete);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.contain,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount}',
                          ),
                        ),
                        padding: EdgeInsets.all(6),
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => onDelete(transactions[index].id),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                  // child: Row(
                  //   children: <Widget>[
                  //     Container(
                  //       margin: EdgeInsets.symmetric(
                  //         vertical: 10,
                  //         horizontal: 15,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           color: Theme.of(context).primaryColor,
                  //           width: 2,
                  //         ),
                  //       ),
                  //       padding: EdgeInsets.all(10),
                  //       child: Text(
                  //         '\$${transactions[index].amount.toStringAsFixed(2)}',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 20,
                  //           color: Theme.of(context).primaryColor,
                  //         ),
                  //       ),
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: <Widget>[
                  //         Text(transactions[index].title,
                  //             style: Theme.of(context).textTheme.title),
                  //         Text(
                  //           DateFormat.yMMMd().format(transactions[index].date),
                  //           style: TextStyle(
                  //             color: Colors.grey,
                  //           ),
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
