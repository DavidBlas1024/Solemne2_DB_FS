import 'package:flutter/material.dart';
import 'package:solemne_2_dw/widgets/widgets.dart';

class CategExpandibleWidget extends StatefulWidget {
  final String nameSuppliers;
  final String rutSuppliers;
  final String phoneSuppliers;
  final String emailSuppliers;
  final String addressSuppliers;

  const CategExpandibleWidget({
    super.key,
    required this.nameSuppliers,
    required this.rutSuppliers,
    required this.phoneSuppliers,
    required this.emailSuppliers,
    required this.addressSuppliers,
  });

  @override
  State<CategExpandibleWidget> createState() => _CategExpandibleWidgetState();
}

class _CategExpandibleWidgetState extends State<CategExpandibleWidget> {
  bool _expandidoCuadro = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
      child: Column(
        children: [
          Container(
            //Crea el cuadro y da el borde colorido
            padding: const EdgeInsets.only(top: 5, left: 12),
            width: double.infinity,
            height: 55,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 37, 12, 136),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25)),
            ),

            child: GestureDetector(
              onTap: () => setState(() => _expandidoCuadro = !_expandidoCuadro),

              child: Row(
                children: [
                  //texto
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        widget.nameSuppliers,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Contenido desplegable
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: _expandidoCuadro
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0,
                        ),
                        child: InfoSuppliersWidget(
                          rutSuppliers: widget.rutSuppliers,
                          phoneSuppliers: widget.phoneSuppliers,
                          emailSuppliers: widget.emailSuppliers,
                          addressSuppliers: widget.addressSuppliers,
                        ),
                      ),

                      //BOTON EDITAR
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13.0),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              37,
                              12,
                              136,
                            ),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: const Icon(Icons.edit),
                          label: const Text(
                            'EDITAR',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'edit_suppliers');
                          },
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
