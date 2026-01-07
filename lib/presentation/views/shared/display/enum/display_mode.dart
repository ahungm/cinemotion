enum DisplayMode {
  light(
    title: 'Modo Claro',
    description: 'Cambia el color de fondo de la pantalla a un tema claro',
  ),
  dark(
    title: 'Modo Oscuro',
    description: 'Cambia el color de fondo de la pantalla a un tema oscuro',
  );

  // Attributes
  final String title;
  final String description;

  // Constructor
  const DisplayMode({required this.title, required this.description});
}
