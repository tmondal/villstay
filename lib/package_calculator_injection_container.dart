import 'package:get_it/get_it.dart';
import 'package:villstay/packages/package_calculator/package_calculator_bloc/pacakage_calculator_bloc.dart';

final sl = GetIt.instance;

void packageCalculatorInit() {
  // Dependency flow from Bloc->Usecase->Repository->Datasources
  // Bloc
  sl.registerFactory(() => PacakageCalculatorBloc());
  // usecasses
  // repository
  // data sources
}
