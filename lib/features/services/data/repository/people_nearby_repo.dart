import '../model/people_nearby_model.dart';

abstract class PeopleNearbyRepo {
  Future<List<PeopleNearbyModel>> getUserDataToPeopleNearby();
}
