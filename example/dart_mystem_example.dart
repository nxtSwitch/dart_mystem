import 'package:dart_mystem/dart_mystem.dart';

void main() async
{
  final mystem = MyStem();
  final data = await mystem.analyze('В мурелки шлепают пельсиски.');

  print(data);
  mystem.close();
}
