import 'package:flutter/material.dart';
import 'package:paymentintegeration/core/neywork/constant.dart';

class RefScreen extends StatelessWidget {
  const RefScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reference Code'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //paymentExitApp(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('You Should go to any market to pay',style: TextStyle(fontSize: 20.0,
              fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10.0,),
              Text('This is referance code',style: TextStyle(
                fontSize: 18.0
              ),),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.purple.shade300
                ),
                child: Center(
                  child: Text(
                    ApiConstant.refcode.isEmpty?"exit" : ApiConstant.refcode,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
