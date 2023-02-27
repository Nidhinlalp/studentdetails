import 'package:flutter/material.dart';
import 'package:newpro/model/data_model.dart';
import 'package:newpro/viewmodel/state_managemant.dart';
import 'package:provider/provider.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) =>
          Provider.of<ProviderDemo>(context, listen: false).getAllstudent(),
    );

    return Consumer<ProviderDemo>(
      builder: (context, value, child) => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          final data = value.studentListNotifier[index];
          return GestureDetector(
            onTap: () {
              context
                  .read<ProviderDemo>()
                  .openStudentDetials(context, student: data);
            },
            child: Card(
              color: Colors.grey.shade50.withOpacity(0.5),
              child: ListTile(
                title: Text(data.name),
                subtitle: Text(data.age),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //delete icon button
                    IconButton(
                      iconSize: 24,
                      onPressed: () {
                        //alertboox

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Delete student?'),
                            content:
                                const Text('Do you want to delete the file?'),
                            actions: [
                              ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text('No'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Provider.of<ProviderDemo>(context,
                                          listen: false)
                                      .deleteStudent(data.id.toString());
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Row(
                                        children: const [
                                          Icon(Icons.check_circle_outline,
                                              color: Colors.red),
                                          SizedBox(width: 10),
                                          Text(
                                            'Successfuly deleted !',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      backgroundColor: Colors.white,
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                          color: Colors.green,
                                        ),
                                      ),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),

                    // edite button
                    IconButton(
                      iconSize: 24,
                      onPressed: () {
                        Provider.of<ProviderDemo>(context, listen: false)
                            .editedfunction(
                          ctx,
                          StudentModel(
                            name: data.name,
                            age: data.age,
                            clas: data.clas,
                            address: data.address,
                            id: data.id,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.edit_note_rounded,
                        color: Color.fromARGB(255, 80, 19, 172),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return const Divider();
        },
        itemCount: value.studentListNotifier.length,
      ),
    );
  }
}
