import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Cubit/app_cubit/app_cubit.dart';
import '../../Data/Cubit/app_cubit/app_state.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var descriptionTextController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    //name
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        hintText: 'Ahmed',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: 'Your Name',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value?.isEmpty ?? true
                          ? 'You should Enter Name'
                          : null,
                      controller: nameController,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //phone
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Your Phone Number',
                          labelStyle: TextStyle(color: Colors.grey),
                          hintText: '01',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Colors.grey,
                          )),
                      keyboardType: TextInputType.phone,
                      validator: (value) => value?.isEmpty ?? true
                          ? 'Should enter your phone'
                          : null,
                      controller: phoneController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //email
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Your Email',
                        labelStyle: TextStyle(color: Colors.grey),
                        hintText: 'ab***@gm.com',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                      ),
                      validator: (value) => value?.isEmpty ?? true
                          ? 'Should Enter Your Email'
                          : null,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    //message description
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Message',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: 'Message',
                        labelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.message,
                          color: Colors.grey,
                        ),
                      ),
                      maxLines: 4,
                      validator: (value) => value?.isEmpty ?? true
                          ? 'Should Enter Message'
                          : null,
                      controller: descriptionTextController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    //Button
                    Container(
                      width: double.infinity,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadiusDirectional.circular(10.0),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: const Text(
                          'SEND',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    //our emails and phone
                    Container(
                      width: double.infinity,
                      height: 2.0,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const AutoSizeText(
                      'You Can also Contact with us Using',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                Column(
                                  children: const [
                                    CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.call_rounded,
                                        size: 25.0,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const AutoSizeText(
                                  'WhatsApp',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                  maxLines: 1,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                Column(
                                  children: const [
                                    CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.email_rounded,
                                        size: 25.0,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const AutoSizeText(
                                  'Gmail',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                  maxLines: 1,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                Column(
                                  children: const [
                                    CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.facebook_rounded,
                                        size: 25.0,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const AutoSizeText(
                                  'FaceBook',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                  maxLines: 1,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
