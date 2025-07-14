class AsmaaApiEndpoints {
  static String baseUrl =
      "https://scopey.onrender.com/";
//https://scopey.onrender.com/api/auth/logout
  static String getProfileDataEndPoint(id) {
    return "api/client/getUser/$id";
  }

  static String updateProfileDataEndPoint(id) {
    return "api/client/update/$id";
  }

  static String logOutEndPoint = "api/auth/logout";



}


class ApiKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String userName = "userName";
  static String address = "address";

  static String email = 'email';
  static String password = 'password';
  static String phone = 'phone';
  static String image = 'image';


  static String success = 'success';
  static String message = 'message';


}
