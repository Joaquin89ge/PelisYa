import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final List<String> messages = [
      "Viajando a la velocidad de la luz para buscar tu próxima película favorita...",
      "Preparando unos mates...",
      "Afinando los violines para el drama...",
      "La fuerza está contigo... y también la mejor selección de películas",
      "Calentando el motor del DeLorean...",
      "Conectando con la fuerza...",
      "No se corta la luz, pero se nos corta el internet...",
      "En un universo paralelo, ya habrías encontrado la película perfecta",
      "Cargando más rápido que un micro en hora pico...",
      "Rose, quiero que me prometas algo... que nunca dejarás de buscar buenas películas",
    ];
    return Stream.periodic(const Duration(milliseconds: 1000), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("espere por favor"),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
              stream: getLoadingMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text("Cargando...");
                return Text(snapshot.data!);
              })
        ],
      ),
    );
  }
}
