import 'package:flutter/material.dart';
import 'package:goals/layouts/main_layout/cubit/main_cubit.dart';

Widget goalItem(context ,id,goalName,) =>InkWell(
  onTap: (){
    showDialog(context: context,
        builder: (_)=>AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),

      ),
      content: Container(
        height: 100,
        child: Column(
          children: [
            Container(
              color: Colors.blue[900],
              height: 30,
              child: const Center(
                child: Text('Editting',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty
                              .all(Colors.red)
                      ),
                      onPressed: (){
                        MainCubit.get(context).removeData(id);
                        MainCubit.get(context).getData();
                        Navigator.pop(context);

                      },
                      child: Text('Remove')
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
    ));

  },
  child:   Container(

    height: 80,

    margin: const EdgeInsets.all(8),

    decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(20),

        boxShadow: const [

          BoxShadow(

              color: Colors.black,

              blurRadius: 5,

              offset: Offset(

                  2,2

              )

          )

        ],

        gradient: LinearGradient(

            begin: Alignment.bottomRight,

            colors: [

              Colors.blue,

              Colors.blue[900]!,



            ]

        )

    ),

    child:  Center(

      child: Text(

        '$id : $goalName',

        style: TextStyle(

            fontSize: 17,

            color: Colors.white,

            fontWeight: FontWeight.w600



        ),

      ),

    ),

  ),
);