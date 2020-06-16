library serializer;

typedef Deserialize<T> = T Function(Map<String, dynamic> json);
typedef Serialize<T> = Map<String, dynamic> Function(T obj);

class Serializer<T> {

  final Serialize<T> serialize;
  final Deserialize<T> deserialize;

  Serializer(this.serialize, this.deserialize);

}

