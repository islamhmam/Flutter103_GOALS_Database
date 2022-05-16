import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goals/layouts/main_layout/components/goal_item.dart';
import 'package:goals/layouts/main_layout/cubit/main_cubit.dart';
import 'package:goals/layouts/main_layout/cubit/main_states.dart';

class MainLayout extends  StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..initSql()..getData(),
      child: BlocConsumer<MainCubit , MainStates>(
        listener: (context, state) {

        },
        builder: (context, state ){
          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'GOALS',
                  style: TextStyle(
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 37,
                  ),
                ),
              ),
              backgroundColor: Colors.blue[900],
            ),
            body: ListView.builder(
              itemCount: MainCubit.get(context).goalsList.length,
              itemBuilder:(context , index)=>goalItem(context,
                  MainCubit.get(context).goalsList[index]['id'],
                  MainCubit.get(context).goalsList[index]['name'],
              ),

            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: (){
                showDialog(context: context,
                    builder: (_)=>AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),

                      ),
                      content: Container(
                        height: 140,
                        child: Column(
                          children: [
                            Container(
                              color: Colors.blue[900],
                              height: 30,
                              child: const Center(
                                child: Text('Write your Goal:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            TextFormField(
                              controller: MainCubit.get(context).addTextController,
                              decoration:InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                label: Text('Write Here...'),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                contentPadding: EdgeInsets.all(5),
                              ) ,

                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all(Colors.red)
                                      ),
                                      onPressed: (){
                                        MainCubit.get(context)
                                            .insertData(
                                            MainCubit.get(context).addTextController
                                            .text.toString(),
                                        );
                                        MainCubit.get(context).addTextController
                                            .text='';
                                        MainCubit.get(context).getData();
                                        Navigator.pop(context);

                                      },
                                      child: Text('ADD')
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all(Colors.blue)
                                      ),
                                      onPressed: (){
                                        Navigator.pop(context);

                                      },
                                      child: Text('Cancel')
                                  ),
                                ),
                              ],
                            )

                          ],
                        ),
                      ),
                    )

                );

              },
              child: Icon(Icons.add,
                size: 33,
                color: Colors.white,
              ),
            ),
          );

        },

      ),

    );

  }
}
