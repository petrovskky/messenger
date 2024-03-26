import 'package:messenger/data/data_sources/interfaces/i_remote_data_source.dart';

class RemoteDataSource implements IRemoteDataSource {
  @override
  Future<Map<String, dynamic>> delete(String url) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return {};
  }

  @override
  Future<Map<String, dynamic>> get(String url) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return {};
  }

  @override
  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> data) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return {};
  }

  @override
  Future<Map<String, dynamic>> put(String url, Map<String, dynamic> data) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return {};
  }
}