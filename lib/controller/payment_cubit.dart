import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:paymentintegeration/core/neywork/constant.dart';
import 'package:paymentintegeration/core/neywork/dio_helper.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  static PaymentCubit get(context) => BlocProvider.of(context);

  Future<void> getAuthToken() async {
    emit(PaymentLoading());
    DioHelper.postDataDio(
        url: ApiConstant.getAuthToken,
        data: {'api_key': ApiConstant.paymentApiKey}).then((value) {
      ApiConstant.usertoken = value.data['token'];
      print('sdsfgh ${ApiConstant.usertoken}');
      emit(PaymentScusses());
    }).catchError((onError) {
      emit(PaymentError());
    });
  }

  Future getorderid(
      {required String fristname,
      required String lastname,
      required String email,
      required String phone,
      required String price}) async {
    emit(PaymentLoadingregist());

    DioHelper.postDataDio(url: ApiConstant.getOrderId, data: {
      'auth_token': ApiConstant.usertoken,
      'delivery_needed': 'false',
      'amount_cents': price.toString(),
      'currency': "EGP",
      'items': []
    }).then((value) {
      ApiConstant.orderid = value.data['id'].toString();
      getpaymentRequest(fristname: fristname, lastname: lastname, email: email, phone: phone, price: price);
      print("sucess order id");
      emit(PaymentScussesregist());
    }).catchError((onError) {
      print("error1 : ${onError.toString()}");

      emit(PaymentErrorregist());
    });


  }
  Future<void> getpaymentRequest(
      {required String fristname,
        required String lastname,
        required String email,
        required String phone,
        required String price}) async {
    emit(PaymentLoadingRequest());
    DioHelper.postDataDio(url: ApiConstant.paymentrequest, data: {
      'auth_token': ApiConstant.usertoken,
      'amount_cents': price.toString(),
      'expiration': 3600,
      'order_id': ApiConstant.orderid,
      'billing_data': {
        'apartment': 'NA',
        'email': email,
        'floor': 'NA',
        'first_name': fristname,
        'street': 'NA',
        'building': 'NA',
        'phone_number': phone.toString(),
        'shipping_method': 'NA',
        'postal_code': 'NA',
        'city': 'NA',
        'country': 'NA',
        'last_name': lastname,
        'state': 'NA'
      },
      'currency': 'EGP',
      'integration_id': ApiConstant.integerateIdcard,
      'lock_order_when_paid': 'false'
    }).then((value) {
      ApiConstant.finaltoken=value.data['token'];
      print("final token : ${ApiConstant.finaltoken}");
      emit(PaymentScussesRequest());

    }).catchError((onError){
      print("error : ${onError.toString()}");
      emit(PaymentErrorRequest());

    });
  }

  Future<void> getRefCode()
  async{
     emit(PaymentLoadingRef());
      DioHelper.postDataDio(url: ApiConstant.getref,
      data:
     {
     "source": {
     "identifier": "AGGREGATOR",
     "subtype": "AGGREGATOR"
     },
     "payment_token": ApiConstant.finaltoken
     }

      ).then((value) {
        emit(PaymentScussesRef());
      }).catchError((onError){
        emit(PaymentErrorRef());
      });

  }
}
