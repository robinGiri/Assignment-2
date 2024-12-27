import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CircleAreaState {}

class CircleAreaInitial extends CircleAreaState {}

class CircleAreaCalculating extends CircleAreaState {}

class CircleAreaCalculated extends CircleAreaState {
  final double area;

  CircleAreaCalculated(this.area);
}

class CircleAreaError extends CircleAreaState {
  final String errorMessage;

  CircleAreaError(this.errorMessage);
}

class AreaOfCirlceCubit extends Cubit<CircleAreaState> {
  AreaOfCirlceCubit() : super(CircleAreaInitial());

  void calculateCircleArea(double radius) {
    try {
      emit(CircleAreaCalculating());

      double area = 3.14159265359 * radius * radius;

      emit(CircleAreaCalculated(area));
    } catch (e) {
      emit(CircleAreaError("Error in calculating area"));
    }
  }
}
