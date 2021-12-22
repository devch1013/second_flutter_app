import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function deleteTx;
  TransactionList(this._userTransactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _userTransactions.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return Column(
                  children: [
                    Text(
                      'No transactions added yet',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    // 사이간격
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ))
                  ],
                );
              })
            // listview.builder 화면에 보일때만 요소 만듬
            : ListView(
                children: _userTransactions
                    .map((tx) => TransactionItem(
                          key: ValueKey(tx.id),
                          transaction: tx,
                          deleteTx: deleteTx,
                        ))
                    .toList(),
              ));
  }
}
