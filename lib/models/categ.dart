import 'dart:convert';

class Categ {
  Categ({required this.listado});

  List<Listado> listado;

  factory Categ.fromJson(String str) => Categ.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categ.fromMap(Map<String, dynamic> json) => Categ(
    listado: List<Listado>.from(
      json["Listado Categorias"].map((x) => Listado.fromMap(x)),
    ),
  );

  Map<String, dynamic> toMap() => {
    "Listado Categorias": List<dynamic>.from(listado.map((x) => x.toMap())),
  };
}

class Listado {
  Listado({
    required this.categorytId,
    required this.categorytName,
    required this.categoryState,
  });

  int categorytId;
  String categorytName;
  String categoryState;

  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
    categorytId: json["category_id"],
    categorytName: json["category_name"],
    categoryState: json["category_state"],
  );

  Map<String, dynamic> toMap() => {
    "category_id": categorytId,
    "category_name": categorytName,
    "category_state": categoryState,
  };

  Listado copy() => Listado(
    categorytId: categorytId,
    categorytName: categorytName,
    categoryState: categoryState,
  );
}
