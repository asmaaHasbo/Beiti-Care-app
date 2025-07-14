enum StatusCode {
  success(200),
  writeSuccess(201),
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  serverError(500),
  ;

  const StatusCode(this.code);

  final int code;
}
