enum UserStatus {
  online('online'),
  offline('offline'),
  away('away'),
  doNotDisturb('do_not_disturb');

  final String value;

  const UserStatus(
    this.value,
  );
}
