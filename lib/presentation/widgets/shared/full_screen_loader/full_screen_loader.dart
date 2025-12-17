import 'dart:math';

import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Por favor, espere un momento', style: textStyles.bodyMedium),
          const SizedBox(height: 40),
          const CircularProgressIndicator(strokeWidth: 4),
          const SizedBox(height: 40),
          StreamBuilder<String>(
            stream: _getLoadingMessages(),
            builder: (context, snapshot) => (!snapshot.hasData)
                ? Text('', style: textStyles.bodyMedium)
                : Text(snapshot.data!, style: textStyles.bodyMedium),
          ),
        ],
      ),
    );
  }

  Stream<String> _getLoadingMessages() {
    final messages = [
      'Cargando películas...',
      'Renderizando cartelera...',
      'Buscando su cine más cercano...',
      'Cocinando las palomitas...',
      'Conectando a la base de datos...',
      'Copiando a Tomatazos...',
      'Disfrutando del séptimo arte...',
      'Iniciando sesión...',
      'Comprando caramelos...',
      'Lamentamos la demora, pero ya casi está listo...',
    ];

    final random = Random();
    int lastIndex = -1;

    return Stream.periodic(const Duration(milliseconds: 1250), (_) {
      int newIndex;

      // Ensure we don't show the same message twice in a row
      do {
        newIndex = random.nextInt(messages.length);
      } while (newIndex == lastIndex && messages.length > 1);

      lastIndex = newIndex;
      return messages[newIndex];
    });
  }
}
