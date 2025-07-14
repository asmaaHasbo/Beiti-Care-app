import 'package:beiti_care/feature/app/data/data_source/app_remote_data_source.dart';

import 'package:beiti_care/feature/app/domain/repo/app_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AppRepository)
class AppRepositoryImpl extends AppRepository {
  final AppRemoteDataSource datasource;
  AppRepositoryImpl(
    this.datasource,
  );

}
