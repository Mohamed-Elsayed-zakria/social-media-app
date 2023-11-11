import 'delete_account_buttom_continue.dart';
import 'delete_account_take_password.dart';
import 'package:flutter/material.dart';
import 'delete_account_loading.dart';

class DeleteAccountScreenBody extends StatelessWidget {
  const DeleteAccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          DeleteAccountLoading(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DeleteAccountTakePassword(),
                DeleteAccountButtomContinue(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
