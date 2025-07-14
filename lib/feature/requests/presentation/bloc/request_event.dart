part of 'request_bloc.dart';

@immutable
class RequestEvent {}


class AcceptSessionEvent extends RequestEvent{
  String id;
  VoidCallback onSuccess;

  AcceptSessionEvent({required this.id,required this.onSuccess});
}


class CancelSessionEvent extends RequestEvent{
String id;
VoidCallback onSuccess;
  CancelSessionEvent({required this.id,required this.onSuccess});
}

class RequestClientEvent extends RequestEvent{


  RequestClientEvent();
}


