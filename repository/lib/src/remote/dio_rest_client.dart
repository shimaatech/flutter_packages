import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:serializer/serializer.dart';

part 'dio_rest_client.g.dart';

class MapWrapper {
  final Map<String, dynamic> map;

  MapWrapper(this.map);

  static MapWrapper fromJson(Map<String, dynamic> map) => MapWrapper(map);

  Map<String, dynamic> toJson() => map;
}

@RestApi()
abstract class _DioRestClient {
  factory _DioRestClient(Dio dio, {String baseUrl}) = __DioRestClient;

  @GET('/{id}')
  Future<MapWrapper> _get(@Path('id') String id);

  @DELETE('/{id}')
  Future<void> delete(@Path('id') String id);

  @POST('/')
  Future<void> _post(@Query('data') MapWrapper entity);

  @GET('/count')
  Future<int> count();
}

class DioRestClient<E> extends __DioRestClient {
  DioRestClient(this.serializer, Dio dio, String baseUrl)
      : super(dio, baseUrl: baseUrl);

  final Serializer<E> serializer;

  Future<E> get(String id) async {
    MapWrapper mapWrapper = await _get(id);
    return serializer.deserialize(mapWrapper.toJson());
  }

  Future<void> post(E entity) {
    return _post(MapWrapper(serializer.serialize(entity)));
  }
}
