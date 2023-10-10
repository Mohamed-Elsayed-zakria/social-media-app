import 'package:flutter/material.dart';
import 'account_confirmation.dart';
import 'create_account_date.dart';
import 'last_signed_in.dart';

class AccountInformationScreenBody extends StatelessWidget {
  const AccountInformationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AccountConfirmation(),
          CreateAccountDate(),
          LastSignedIn(),
        ],
      ),
    );
  }
}
