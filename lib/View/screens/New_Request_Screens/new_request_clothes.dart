// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/Data/Cubit/getClothes_requests_cubit/getClothes_requests_cubit.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/new_component.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/new_request_cubit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Data/Cubit/getClothes_requests_cubit/getClothes_requests_state.dart';
import '../../../Style/Colors.dart';
import '../../../helpers/myApplication.dart';

class ClothesRequest extends StatefulWidget {
  const ClothesRequest({Key? key}) : super(key: key);

  @override
  State<ClothesRequest> createState() => _ClothesRequestState();
}

class _ClothesRequestState extends State<ClothesRequest> {
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
        BlocProvider.of<GetClothesRequestsCubit>(context).GetClothesRequests();
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
            'Clothes Request',
            style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
          ),
        ),
        body: RefreshIndicator(
          color: Constants.primaryAppColor,
          onRefresh: () async {
            BlocProvider.of<GetClothesRequestsCubit>(context)
                .GetClothesRequests();
          },
          child: BlocBuilder<GetClothesRequestsCubit, GetClothesRequestsState>(
              bloc: BlocProvider.of<GetClothesRequestsCubit>(context),
              builder: (context, state) {
                if (state is GetClothesRequestsLoading) {
                  return SpinKitThreeBounce(
                    color: Constants.primaryAppColor,
                    size: size.width * .08,
                  );
                } else if (state is GetClothesRequestsLoaded) {
                  if (state.response!.data.isEmpty) {
                    return Center(
                        child: Text(
                      "No Clothes Requests",
                      style: const TextStyle(color: Colors.black),
                    ));
                  } else {
                    return ConditionalBuilder(
                        condition: true,
                        builder: (context) => ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                buildRequestClothesItem(
                                  context,
                                  clothesType: state
                                      .response!.data[index].TypeEn
                                      .toString(),
                                  size: state.response!.data[index].SizeEn
                                      .toString(),
                                  gender: state.response!.data[index].GenderEn
                                      .toString(),
                                  quantityOfClothes: state
                                      .response!.data[index].Quantity
                                      .toString(),
                                ),
                            separatorBuilder: (context, index) => SizedBox(),
                            itemCount: state.response!.data.length));
                  }
                } else {
                  return Center(
                      child: Text(
                    "No Clothes Requests",
                    style: const TextStyle(color: Colors.black),
                  ));
                }
              }),
        ));
  }
}

/*

BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child:
          BlocConsumer<CounterCubit, CounterStates>(listener: (context, state) {
        if (state is CounterMinusState) print('Minus state ${state.counter}');
        if (state is CounterPlusState) print('Plus state ${state.counter}');
      }, builder: (context, state) {
        int counter = CounterCubit.get(context).counter;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              ' Clothes Request',
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
            ),
          ),
          body: ConditionalBuilder(
              condition: true,
              builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildRequestClothesItem(
                        context,
                        clothesType:
                            CounterCubit.get(context).clothesType[index],
                        size: CounterCubit.get(context).size[index],
                        gender: CounterCubit.get(context).gender[index],
                        quantityOfClothes:
                            CounterCubit.get(context).quantityOfClothes[index],
                      ),
                  separatorBuilder: (context, index) => SizedBox(),
                  itemCount: CounterCubit.get(context).itemClothesCount)),
        );
      }),
    )

 */
