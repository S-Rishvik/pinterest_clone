import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pinterest_clone/presentation/app/account/account_controller.dart';

class AccountPage extends GetView<AccountController>{
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Text('Account'),
      ),
    );
  }

}