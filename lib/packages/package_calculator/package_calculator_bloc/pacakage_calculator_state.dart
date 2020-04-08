part of 'pacakage_calculator_bloc.dart';

abstract class PacakageCalculatorState extends Equatable {
  const PacakageCalculatorState();
}

class Loading extends PacakageCalculatorState {
  @override
  List<Object> get props => null;
}

class ChangedPacakageCalculatorState extends PacakageCalculatorState {
  final PackageForm packageForm;
  ChangedPacakageCalculatorState({@required this.packageForm});

  @override
  List<Object> get props => [packageForm];
}
