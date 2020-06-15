import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'dio_rest_client.g.dart';

@RestApi()
abstract class _DioRestClient<E> {
  factory _DioRestClient(Dio dio, {String baseUrl}) =
  __DioRestClient;

  @GET('/{id}')
  Future<E> get(@Path('id') int id);

  @DELETE('/{id}')
  Future<void> delete(@Path('id') int id);

  @POST('/')
  Future<void> post(@Query('data') E entity);

}

class DioRestClient extends __DioRestClient {
  DioRestClient(Dio dio, String baseUrl) : super(dio, baseUrl: baseUrl);
}
