import 'package:assignment_two/cubit/area_of_cirlce_cubit.dart';
import 'package:assignment_two/cubit/area_of_rectangle_cubit.dart';
import 'package:assignment_two/cubit/simple_interest_cubit.dart';
import 'package:assignment_two/view/area_of_circle_cubit_view.dart';
import 'package:assignment_two/view/area_of_rectangle_cubit_view.dart';
import 'package:assignment_two/view/simple_interest_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(
    this._simpleInterest,
    this._areaOfCircle,
    this._areaOfRectangle,
  ) : super(null);

  final SimpleInterestCubit _simpleInterest;
  final AreaOfCirlceCubit _areaOfCircle;
  final AreaOfRectangleCubit _areaOfRectangle;

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _simpleInterest,
            child: SimpleInterestCubitView(),
          ),
        ));
  }

  void openAreaOfCircleView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _areaOfCircle,
            child: AreaOfCircleCubitView(),
          ),
        ));
  }

  void openAreaOfRectangleView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _areaOfRectangle,
            child: AreaOfRectangleCubitView(),
          ),
        ));
  }
}
