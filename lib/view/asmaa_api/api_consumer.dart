abstract class ApiConsumer {
  get(String path, {Map<String, dynamic> data, Map<String, dynamic> queryParameters});
  delete(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    bool isFormData = false,
  });
  patch(
    String path, {
   Map<String, dynamic> ? data,
    Map<String, dynamic> queryParameters,
    bool isFormData = false,
    
  });
  post(
    String path, {
   Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    bool isFormData = false,
  });
}
