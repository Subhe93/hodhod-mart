import 'package:hodhod_mart/repositories/sub_category_repository.dart';

class CategoryRepository {
  final String name;
  final String image;

  final int id;
  final List<SubCategoryRepository> subCategoriesList;

  CategoryRepository({this.id, this.name, this.image, this.subCategoriesList});
}
