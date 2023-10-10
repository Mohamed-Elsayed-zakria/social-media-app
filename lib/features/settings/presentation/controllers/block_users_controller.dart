import '../../data/models/block_users_model.dart';
import '../../data/reposetory/api/block_users_api.dart';

Future<List<BlockUserModel>> getAllBlockUsers() async {
  return BlockUserApi().getAllBlockUsers();
}
