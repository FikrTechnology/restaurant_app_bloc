import 'package:equatable/equatable.dart';

class ApiResult<Meta, Data> extends Equatable{
  final Meta? meta;
  final Data? data;

  const ApiResult({
    this.meta,
    this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}