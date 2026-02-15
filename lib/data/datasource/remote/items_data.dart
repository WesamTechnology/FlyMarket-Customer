import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getData(String category_id, String supermarket_id) async {
    var respons = await crud.postData(AppLink.items, {
      "category_id": category_id.toString(),
      "supermarket_id": supermarket_id.toString(),
    });
    return respons.fold((l) => l, (r) => r);
  }



  searchData(String search, String supermarket_id) async {
    var respons = await crud.postData(AppLink.search, {
      "search": search,
      "supermarket_id": supermarket_id.toString(),
    });
    return respons.fold((l) => l, (r) => r);
  }



}
