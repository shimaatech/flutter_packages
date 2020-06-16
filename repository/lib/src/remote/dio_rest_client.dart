import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'dio_rest_client.g.dart';

@RestApi(parser: Parser.DartJsonMapper)
abstract class _DioRestClient {
  factory _DioRestClient(Dio dio, {String baseUrl}) = __DioRestClient;

  @GET('/{id}')
  Future<Map<String, dynamic>> _get(@Path('id') int id);

  @DELETE('/{id}')
  Future<void> delete(@Path('id') int id);

  @POST('/')
  Future<void> _post(@Query('data') Map<String, dynamic> entity);

}

class DioRestClient<E> extends __DioRestClient {
  DioRestClient(Dio dio, String baseUrl) : super(dio, baseUrl: baseUrl);

  Future<E> get(int id) async {
    return JsonMapper.fromMap<E>(await _get(id));
  }

  Future<void> post(E entity) {
    return _post(JsonMapper.toMap(entity));
  }

}
