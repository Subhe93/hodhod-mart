import 'package:hodhod_mart/repositories/collection_card_repository.dart';

class CollectionRepository {
  final String name;
  final List<CollectionCardRepository> collectionList;

  CollectionRepository({this.name, this.collectionList});
}