
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class OrderPendingData {

  Crud crud;

  OrderPendingData(this.crud);

  getData(String usersId)async{

    var respons= await crud.postData(AppLink.pending, {"id" : usersId});
    return respons.fold((l)=> l, (r)=> r);


  }

  deleteData(String orderId)async{

    var respons= await crud.postData(AppLink.ordersDelete, {"id" : orderId});
    return respons.fold((l)=> l, (r)=> r);


  }

}