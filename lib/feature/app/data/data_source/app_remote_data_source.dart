
import 'package:injectable/injectable.dart';

import '../../../../core/api/client.dart';


@injectable
class AppRemoteDataSource {
  final ClientApi clientApi;
  AppRemoteDataSource(this.clientApi);



}
