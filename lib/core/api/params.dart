 abstract class IMap {
  const IMap();

  Map<String, dynamic> toMap();
}

abstract class Params implements IMap {}

class NoParams extends Params {
  @override
  Map<String, dynamic> toMap() => {};
}


