import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pinterest_clone/presentation/app/updates/updates_controller.dart';

class UpdatesPage extends GetView<UpdatesController>{
  const UpdatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Text('Updates'),
      ),
    );
  }

}