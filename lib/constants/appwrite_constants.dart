class AppwriteConstants {
  static const String databaseId = "63d8e2da782d684812de";
  static const String projectId = "63d8d363c53de42913e6";
  static const String endPoint = 'http://192.168.56.1:80/v1';

  static const String usersCollection = '63da693bc978174efe7b';
  static const String postsCollection = '63db7c41cea7416c8bf6';
  static const String notificationsCollection = '63e16e7c79712eb7659d';

  static const String imagesBucket = '63db8aee78ad40bad1cd';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
