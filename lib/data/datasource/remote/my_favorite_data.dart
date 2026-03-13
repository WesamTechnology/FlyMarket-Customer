
import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class MyFavoriteData {
  Crud crud;

  MyFavoriteData(this.crud);

  getData(String id) async {
    var respons = await crud.postData(AppLink.myFavorite, {
      "id": id.toString(),
    });
    return respons.fold((l) => l, (r) => r);
  }
  getItemsDetails(String usersId,String itemsId) async {
    var respons = await crud.postData(AppLink.itemsFavorite, {
      "usersid": usersId.toString(),
      "itemsid": itemsId.toString(),
    });
    return respons.fold((l) => l, (r) => r);
  }

  deleteFromFavorite(String id) async {
    var respons = await crud.postData(AppLink.deleteFromFavorite, {
      "id": id.toString(),
    });
    return respons.fold((l) => l, (r) => r);
  }
}
