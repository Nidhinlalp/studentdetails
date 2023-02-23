import 'package:flutter/material.dart';
import 'package:newpro/screen/widgets/student_new.dart';
import 'package:provider/provider.dart';

import '../../provider/state_managemant.dart';

class Search extends StatelessWidget {
  Search({super.key});

  final nameserarchcotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusNode srchFocus = FocusNode();
    srchFocus.requestFocus();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: nameserarchcotroller,
          onChanged: (value) {
            context.read<ProviderDemo>().studentSearchResult = serch(
                nameserarchcotroller.text,
                context.read<ProviderDemo>().studentListNotifier);
            context.read<ProviderDemo>().notifyListeners();

            // studentList.notifyListeners();

            //  print(":::::::Length:${studentList.value.length}::::");
          },
          focusNode: srchFocus,
          decoration: const InputDecoration(hintText: 'Search'),
        ),
      ),
      body: Consumer<ProviderDemo>(
        builder: (BuildContext context, value, Widget? child) =>
            ListView.builder(
          itemCount: value.studentSearchResult.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StudentDetieeils(
                      student: value.studentSearchResult[index],
                    ),
                  ),
                );
              },
              title: Text(value.studentSearchResult[index].name),
            );
          },
        ),
      ),
    );
  }
}
