import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    userController.fetchUser();
    super.initState();
  }

  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get API'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<UserController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.user.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${controller.user[index].name}'),
                        subtitle: Text('${controller.user[index].email}'),

                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
