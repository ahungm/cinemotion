import 'package:cinemotion/infrastructure/datasources/local/drift_datasource.dart';
import 'package:cinemotion/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider(
  (ref) => LocalStorageRepositoryImpl(DriftDatasource()),
);
