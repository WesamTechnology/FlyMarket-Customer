
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class CheckoutData {

  Crud crud;

  CheckoutData(this.crud);

  getData(Map data)async{

    var respons= await crud.postData(AppLink.checkOut, data);
    return respons.fold((l)=> l, (r)=> r);


  }

}