// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/Data/Cubit/getClothes_requests_cubit/getClothes_requests_cubit.dart';
import 'package:flutter_graduation/Data/Cubit/getFood_requests_cubit/getFood_requests_cubit.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/new_component.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/new_request_cubit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Data/Cubit/getClothes_requests_cubit/getClothes_requests_state.dart';
import '../../../Data/Cubit/getFood_requests_cubit/getFood_requests_state.dart';
import '../../../Style/Colors.dart';
import '../../../helpers/myApplication.dart';

class FoodRequest extends StatefulWidget {
  const FoodRequest({Key? key}) : super(key: key);

  @override
  State<FoodRequest> createState() => _FoodRequestState();
}

class _FoodRequestState extends State<FoodRequest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    MyApplication.checkConnection().then((value) {
      if (!value) {
        Fluttertoast.showToast(
            msg: 'noInternet',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        BlocProvider.of<GetFoodRequestsCubit>(context).GetFoodRequests();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Food Request',
            style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
          ),
        ),
        body: RefreshIndicator(
          color: Constants.primaryAppColor,
          onRefresh: () async {
            BlocProvider.of<GetFoodRequestsCubit>(context).GetFoodRequests();
          },
          child: BlocBuilder<GetFoodRequestsCubit, GetFoodRequestsState>(
              bloc: BlocProvider.of<GetFoodRequestsCubit>(context),
              builder: (context, state) {
                if (state is GetFoodRequestsLoading) {
                  return SpinKitThreeBounce(
                    color: Constants.primaryAppColor,
                    size: size.width * .08,
                  );
                } else if (state is GetFoodRequestsLoaded) {
                  if (state.response!.data.isEmpty) {
                    return Center(
                        child: Text(
                      "No Food Requests",
                      style: const TextStyle(color: Colors.black),
                    ));
                  } else {
                    return ConditionalBuilder(
                        condition: true,
                        builder: (context) => ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                buildRequestFoodItem(
                                  context,
                                  type: state.response!.data[index].TypeEn
                                      .toString(),
                                  foodType: state
                                      .response!.data[index].TypeOfFoodEn
                                      .toString(),
                                  date: state
                                      .response!.data[index].ExpirationDate
                                      .toString(),
                                  quantity: state.response!.data[index].Quantity
                                      .toString(),
                                  quantityType: state.response!.data[index].TypeOfQuantityEn
                                      .toString(),
                                ),
                            separatorBuilder: (context, index) => SizedBox(),
                            itemCount: state.response!.data.length));
                  }
                } else {
                  return Center(
                      child: Text(
                    "No Food Requests",
                    style: const TextStyle(color: Colors.black),
                  ));
                }
              }),
        ));
  }
}
