enum AppearanceMode {
  light(
    title: 'Modo Claro',
    description: 'Cambiar el fondo de pantalla a un tema claro',
  ),
  dark(
    title: 'Modo Oscuro',
    description: 'Cambiar el fondo de pantalla a un tema oscuro',
  );

  // Attributes
  final String title;
  final String description;

  // Constructor
  const AppearanceMode({required this.title, required this.description});
}
