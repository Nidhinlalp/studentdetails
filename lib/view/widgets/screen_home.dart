import 'package:flutter/material.dart';
import 'package:newpro/viewmodel/state_managemant.dart';
import 'package:newpro/view/widgets/add_student_widget.dart';
import 'package:newpro/view/widgets/list_student_widgwt.dart';
import 'package:newpro/view/widgets/search%20.dart';
import 'package:provider/provider.dart';
import '../../model/data_model.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<StudentModel> allstudent = [];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) =>
          Provider.of<ProviderDemo>(context, listen: false).getAllstudent(),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Search(),
                ),
              );
            }),
            icon: const Icon(Icons.search),
          )
        ],
        title: const Text('student'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                AddstudentWidget(),
                ListStudentWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
