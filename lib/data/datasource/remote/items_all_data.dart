import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class ItemsAllData {
  Crud crud;

  ItemsAllData(this.crud);

  getData(String id, String usersid) async {
    var respons = await crud.postData(AppLink.itemsAll, {
      "id": id.toString(),
      "usersid": usersid,

    });
    return respons.fold((l) => l, (r) => r);
  }


  searchData(String search) async {
    var respons = await crud.postData(AppLink.searchAll, {
      "search": search,
    });
    return respons.fold((l) => l, (r) => r);
  }


}
