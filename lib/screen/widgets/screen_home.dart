import 'package:flutter/material.dart';
import 'package:newpro/provider/state_managemant.dart';
import 'package:newpro/screen/widgets/add_student_widget.dart';
import 'package:newpro/screen/widgets/list_student_widgwt.dart';
import 'package:newpro/screen/widgets/search%20.dart';
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              AddstudentWidget(),
              ListStudentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
