import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RectangleAreaState {}

class RectangleAreaInitial extends RectangleAreaState {}

class RectangleAreaCalculating extends RectangleAreaState {}

class RectangleAreaCalculated extends RectangleAreaState {
  final double area;

  RectangleAreaCalculated(this.area);
}

class RectangleAreaError extends RectangleAreaState {
  final String errorMessage;

  RectangleAreaError(this.errorMessage);
}

class AreaOfRectangleCubit extends Cubit<RectangleAreaState> {
  AreaOfRectangleCubit() : super(RectangleAreaInitial());

  void calculateRectangleArea(double length, double width) {
    try {
      emit(RectangleAreaCalculating());

      double area = length * width;

      emit(RectangleAreaCalculated(area));
    } catch (e) {
      emit(RectangleAreaError("Error in calculating area"));
    }
  }
}
