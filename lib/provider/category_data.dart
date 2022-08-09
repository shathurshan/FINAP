import '../models/catergory.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> myCategories = <CategoryModel>[];

  //1
  CategoryModel categorieModel0 = CategoryModel(
    categoryName: "Business",
    imageUrl:
        "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80",
  );
  myCategories.add(categorieModel0);

  //2
  CategoryModel categorieModel1 = CategoryModel(
    categoryName: "Entertainment",
    imageUrl:
        "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
  );
  myCategories.add(categorieModel1);

  //3
  CategoryModel categorieModel2 = CategoryModel(
    categoryName: "General",
    imageUrl:
        "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  );
  myCategories.add(categorieModel2);

  //4
  CategoryModel categorieModel3 = CategoryModel(
    categoryName: "Health",
    imageUrl:
        "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80",
  );
  myCategories.add(categorieModel3);

  //5
  CategoryModel categorieModel5 = CategoryModel(
    categoryName: "Sports",
    imageUrl:
        "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
  );
  myCategories.add(categorieModel5);

  //6
  CategoryModel categorieModel7 = CategoryModel(
    categoryName: "Technology",
    imageUrl:
        "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
  );
  myCategories.add(categorieModel7);

  return myCategories;
}
