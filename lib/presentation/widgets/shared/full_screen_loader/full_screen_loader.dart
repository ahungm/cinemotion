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
          Text('Por favor espere', style: textStyles.bodySmall),
          const SizedBox(height: 30),
          const CircularProgressIndicator(strokeWidth: 4),
          const SizedBox(height: 30),
          StreamBuilder<String>(
            stream: _getLoadingMessages(),
            builder: (context, snapshot) => (!snapshot.hasData)
                ? Text('Cargando...', style: textStyles.bodySmall)
                : Text(snapshot.data!),
          ),
        ],
      ),
    );
  }

  Stream<String> _getLoadingMessages() {
    final List<String> messages = [
      'Cargando películas...',
      'Renderizando cartelera...',
      'Buscando su cine más cercano...',
      'Cocinando las palomitas...',
      'Lamentamos la demora, pero ya está listo !',
    ];

    return Stream.periodic(
      const Duration(milliseconds: 1250),
      (step) => messages[step],
    ).take(messages.length);
  }
}
