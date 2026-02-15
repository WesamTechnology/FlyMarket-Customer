
import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCart( usersid,  itemsid) async {
    var respons = await crud.postData(AppLink.cartAdd, {
      "usersid": usersid.toString(),
      "itemsid": itemsid.toString(),
    });
    return respons.fold((l) => l, (r) => r);
  }

  deleteCart( usersid,  itemsid) async {
    var respons = await crud.postData(AppLink.cartDelete, {
      "usersid": usersid.toString(),
      "itemsid": itemsid.toString(),
    });
    return respons.fold((l) => l, (r) => r);
  }


  getCountItems( usersid,  itemsid) async {
    var respons = await crud.postData(AppLink.getCountItems, {
      "usersid": usersid.toString(),
      "itemsid": itemsid.toString(),
    });
    return respons.fold((l) => l, (r) => r);
  }

  viewCart( usersid) async {
    var respons = await crud.postData(AppLink.cartView, {
      "usersid": usersid.toString(),
    });
    return respons.fold((l) => l, (r) => r);
  }


}
