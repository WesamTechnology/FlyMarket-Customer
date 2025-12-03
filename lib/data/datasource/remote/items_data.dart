
import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class ItemsData {

  Crud crud;

  ItemsData(this.crud);

  getData(String id)async{

    var respons= await crud.postData(AppLink.items, {"id":id.toString()});
    return respons.fold((l)=> l, (r)=> r);


  }

}