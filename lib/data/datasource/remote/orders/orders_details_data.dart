
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class OrdersDetailsData {

  Crud crud;

  OrdersDetailsData(this.crud);

  getData(String usersId)async{

    var respons= await crud.postData(AppLink.ordersDetails, {"id" : usersId});
    return respons.fold((l)=> l, (r)=> r);


  }

}