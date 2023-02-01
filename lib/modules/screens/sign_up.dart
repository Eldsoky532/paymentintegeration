import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentintegeration/controller/payment_cubit.dart';
import 'package:paymentintegeration/modules/screens/toggle_screen.dart';
import 'package:paymentintegeration/modules/widget/default_button.dart';
import 'package:paymentintegeration/modules/widget/default_text_filed.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController fristname = TextEditingController();

  TextEditingController secondname = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController priceController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit()..getAuthToken(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Payment Integration'),
          ),
          body: BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if(state is PaymentScussesRequest)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>ToggleScreen()));
                }
            },
            builder: (context, state) {
              var cubit=PaymentCubit.get(context);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: Icon(
                          Icons.devices_outlined,
                          color: Colors.purple,
                          size: 150,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                          key: formkey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: DefaultTextFormFiled(
                                      controller: fristname,
                                      type: TextInputType.text,
                                      prefix: Icons.person,
                                      hintText: 'Frist Name',
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please Enter Name';
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: DefaultTextFormFiled(
                                      controller: secondname,
                                      type: TextInputType.text,
                                      prefix: Icons.person,
                                      hintText: 'Second Name',
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please Enter Second';
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              DefaultTextFormFiled(
                                controller: emailcontroller,
                                type: TextInputType.text,
                                prefix: Icons.email,
                                hintText: 'Email Address',
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Email';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              DefaultTextFormFiled(
                                controller: passwordcontroller,
                                type: TextInputType.text,
                                prefix: Icons.password,
                                isPassword: false,
                                hintText: 'Password',
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Password';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              DefaultTextFormFiled(
                                controller: priceController,
                                prefix: Icons.price_change,
                                type: TextInputType.text,
                                hintText: 'Price',
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Price';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DefaultButton(
                                  background: Colors.purple.shade300,
                                  radius: 10,
                                  buttonWidget: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        letterSpacing: 1.7),
                                  ),
                                  function: () {
                                    if (formkey.currentState!.validate()) {

                                      cubit.getorderid(
                                          fristname: fristname.text,
                                          lastname: secondname.text,
                                          email: emailcontroller.text,
                                          phone: passwordcontroller.text,
                                          price: priceController.text
                                      );


                                    }
                                  })
                            ],
                          )),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
