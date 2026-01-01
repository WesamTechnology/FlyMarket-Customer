
import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addFavorite( usersid,  itemsid) async {
    var respons = await crud.postData(AppLink.favoriteAdd, {
      "usersid": usersid.toString(),
      "itemsid": itemsid.toString(),
    });
    return respons.fold((l) => l, (r) => r);
  }

  removeFavorite( usersid,  itemsid) async {
    var respons = await crud.postData(AppLink.favoriteRemove, {
      "usersid": usersid.toString(),
      "itemsid": itemsid.toString(),
    });
    return respons.fold((l) => l, (r) => r);
  }
}
