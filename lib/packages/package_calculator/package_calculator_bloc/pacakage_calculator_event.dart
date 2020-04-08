part of 'pacakage_calculator_bloc.dart';

abstract class PacakageCalculatorEvent extends Equatable {
  const PacakageCalculatorEvent();
}

class InitialPacakageCalculatorEvent extends PacakageCalculatorEvent {
  @override
  List<Object> get props => null;
}

class ChangePacakageCalculatorEvent extends PacakageCalculatorEvent {
  final PackageForm packageForm;
  ChangePacakageCalculatorEvent({@required this.packageForm});
  @override
  List<Object> get props => [packageForm];
}
