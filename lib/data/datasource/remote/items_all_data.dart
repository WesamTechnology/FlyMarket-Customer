
import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class ItemsAllData {

  Crud crud;

  ItemsAllData(this.crud);

  getData(String id)async{

    var respons= await crud.postData(AppLink.itemsAll, {"id":id.toString()});
    return respons.fold((l)=> l, (r)=> r);


  }

}