import 'dart:convert';

class Supplier {
  Supplier({required this.listado});

  List<Listado> listado;

  factory Supplier.fromJson(String str) => Supplier.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Supplier.fromMap(Map<String, dynamic> json) => Supplier(
    listado: List<Listado>.from(
      json["Proveedores Listado"].map((x) => Listado.fromMap(x)),
    ),
  );

  Map<String, dynamic> toMap() => {
    "Proveedores Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
  };
}

class Listado {
  Listado({
    required this.providerId,
    required this.providerName,
    required this.providerLastName,
    required this.providerEmail,
    required this.providerState,
  });

  int providerId;
  String providerName;
  String providerLastName;
  String providerEmail;
  String providerState;

  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
    providerId: json["providerid"],
    providerName: json["provider_name"],
    providerLastName: json["provider_last_name"],
    providerEmail: json["providerEmail"],
    providerState: json["provider_state"],
  );

  Map<String, dynamic> toMap() => {
    "providerid": providerId,
    "provider_name": providerName,
    "provider_last_name": providerLastName,
    "providerEmail": providerEmail,
    "provider_state": providerState,
  };

  Listado copy() => Listado(
    providerId: providerId,
    providerName: providerName,
    providerLastName: providerLastName,
    providerEmail: providerEmail,
    providerState: providerState,
  );
}
