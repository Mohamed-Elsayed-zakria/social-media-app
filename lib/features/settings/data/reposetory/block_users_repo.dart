import '../models/block_users_model.dart';

abstract class BlockUserRepo {
  Future<List<BlockUserModel>> getAllBlockUsers();
}
