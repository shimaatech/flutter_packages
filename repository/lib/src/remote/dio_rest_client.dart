import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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

  @protected
  @GET('/{id}')
  Future<MapWrapper> doGet(@Path('id') String id);

  @protected
  @GET('/byId')
  Future<List<MapWrapper>> doGetMultiple(@Query('ids') List<String> ids);

  @protected
  @GET('/')
  Future<List<MapWrapper>> doList(@Queries() Map<String, dynamic> queries);

  @DELETE('/{id}')
  Future<void> delete(@Path('id') String id);

  @protected
  @POST('/')
  Future<void> doPost(@Body() MapWrapper entity);

  @GET('/count')
  Future<int> count();
}

class DioRestClient<E> extends __DioRestClient {
  DioRestClient(this.serializer, Dio dio, String baseUrl)
      : super(dio, baseUrl: baseUrl);

  final Serializer<E> serializer;

  Future<E> get(String id) async {
    MapWrapper mapWrapper = await doGet(id);
    return serializer.deserialize(mapWrapper.toJson());
  }

  Future<List<E>> getMultiple(List<String> ids) async {
    if (ids == null || ids.isEmpty) {
      return const [];
    }
    return unwrapMultiple(await doGetMultiple(ids));
  }

  Future<List<E>> list(Map<String, dynamic> queries) async {
    if (queries == null) {
      queries = const {};
    }
    return unwrapMultiple(await doList(queries));
  }

  Future<void> post(E entity) {
    return doPost(MapWrapper(serializer.serialize(entity)));
  }

  @protected
  List<E> unwrapMultiple(List<MapWrapper> wrappers) {
    return wrappers.map((e) => serializer.deserialize(e.toJson())).toList();
  }
}
