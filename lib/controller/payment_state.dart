part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}


class PaymentLoading extends PaymentState {}


class PaymentScusses extends PaymentState {}


class PaymentError extends PaymentState {}



class PaymentLoadingregist extends PaymentState {}


class PaymentScussesregist extends PaymentState {}


class PaymentErrorregist extends PaymentState {}



class PaymentLoadingRequest extends PaymentState {}


class PaymentScussesRequest extends PaymentState {}


class PaymentErrorRequest extends PaymentState {}


class PaymentLoadingRef extends PaymentState {}


class PaymentScussesRef extends PaymentState {}


class PaymentErrorRef extends PaymentState {}