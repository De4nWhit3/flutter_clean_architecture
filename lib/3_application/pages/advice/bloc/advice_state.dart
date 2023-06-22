part of 'advice_bloc.dart';

@immutable
abstract class AdviceState {}

class AdviceInitial extends AdviceState {}

class AdviserStateLoading extends AdviceState {}

class AdviserStateLoaded extends AdviceState {
  final String advice;

  AdviserStateLoaded({required this.advice});
}

class AdviserStateError extends AdviceState {
  final String errorMessage;

  AdviserStateError({required this.errorMessage});
}
