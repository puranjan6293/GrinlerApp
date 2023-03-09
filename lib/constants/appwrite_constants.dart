class AppwriteConstants {
  static const String projectId = "6407971d782ff2c10989";
  // 6407971d782ff2c10989
  // local 63d8d363c53de42913e6
  static const String databaseId = "640920a08a28ad056628";
  // 640920a08a28ad056628
  // local 63d8e2da782d684812de
  static const String endPoint = 'http://20.219.191.225/v1';
  // http://20.219.191.225/v1
  // local http://192.168.56.1:80/v1

  static const String usersCollection = '6409792a4bad838665f0';
  // 6409792a4bad838665f0
  // local 63da693bc978174efe7b
  static const String postsCollection = '640976a09b8e01d94a6f';
  // 640976a09b8e01d94a6f
  //  local 63db7c41cea7416c8bf6
  static const String notificationsCollection = '64097552c116da7299fa';
  // 64097552c116da7299fa
  // local 63e16e7c79712eb7659d

  static const String imagesBucket = '64097a790fd97462010d';
  // 64097a790fd97462010d
  // local 63db8aee78ad40bad1cd

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
