///Статус пользователя
enum UserStatus {
  worker('Работник'),
  admin('Админ');

  const UserStatus(this.name);
  final String name;
}
