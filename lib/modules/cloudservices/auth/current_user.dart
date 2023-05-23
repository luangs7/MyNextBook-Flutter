class CurrentUser {
  final String uuid;
  final String name;
  final String email;
  final String? avatar;

  CurrentUser(
      {required this.uuid,
      required this.name,
      required this.email,
      required this.avatar});
}
