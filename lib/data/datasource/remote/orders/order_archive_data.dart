
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class OrderArchiveData {

  Crud crud;

  OrderArchiveData(this.crud);

  getData(String usersId)async{

    var respons= await crud.postData(AppLink.ordersArchive, {"id" : usersId});
    return respons.fold((l)=> l, (r)=> r);


  }


  ratingData(String ordersId , String rating , String noteRating)async{

    var respons= await crud.postData(AppLink.rating, {"id" : ordersId,"rating":rating,"comment":noteRating});
    return respons.fold((l)=> l, (r)=> r);


  }



}