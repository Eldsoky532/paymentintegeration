class ApiConstant {
  //https://accept.paymob.com/api/auth/tokens

  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String getAuthToken = '/auth/tokens';

  static const String paymentApiKey =
      'ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2libUZ0WlNJNkltbHVhWFJwWVd3aUxDSndjbTltYVd4bFgzQnJJam8yT0RVM016bDkuVmluM0hydC1GcXVFc3h3Q3ZMWnpmMncxVF9wUXJySEYyV2IyanRKZ0t3QXdDQ2VBbEdvcjZZTTBWUEpuVU1MUThlOTNlc3dSZUpKSGRlS0h5dFhxVnc=';

  static const String getOrderId = '/ecommerce/orders';
  static const String paymentrequest = '/acceptance/payment_keys';
  static const String getref = '/acceptance/payments/pay';

  static String usertoken = '';

  static String orderid = '';

  static String integerateIdcard='3347295';

  static String integerateIdkiosk='3347707';

  static String finaltoken='';
  static String refcode='';

  static  String visaurl='https://accept.paymob.com/api/acceptance/iframes/726681?payment_token=$finaltoken';

}
class AppImage
{
  static const String refImage=
      'https://cdn-icons-png.flaticon.com/128/4090/4090458.png';

  static const String visaImage=
      'https://cdn-icons-png.flaticon.com/128/349/349221.png';
}
