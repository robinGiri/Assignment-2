import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SimpleInterestState {}

class SimpleInterestInitial extends SimpleInterestState {}

class SimpleInterestCalculating extends SimpleInterestState {}

class SimpleInterestCalculated extends SimpleInterestState {
  final double simpleInterest;

  SimpleInterestCalculated(this.simpleInterest);
}

class SimpleInterestError extends SimpleInterestState {
  final String errorMessage;

  SimpleInterestError(this.errorMessage);
}

class SimpleInterestCubit extends Cubit<SimpleInterestState> {
  SimpleInterestCubit() : super(SimpleInterestInitial());

  void calculateSimpleInterest(double principal, double rate, double time) {
    try {
      emit(SimpleInterestCalculating());

      double simpleInterest = (principal * rate * time) / 100;

      emit(SimpleInterestCalculated(simpleInterest));
    } catch (e) {
      emit(SimpleInterestError("Error in calculating interest"));
    }
  }
}
