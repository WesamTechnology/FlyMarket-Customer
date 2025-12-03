
import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class CategoriesData {

  Crud crud;

  CategoriesData(this.crud);

  getData(String id)async{

    var respons= await crud.postData(AppLink.categories, {"id":id.toString()});
    return respons.fold((l)=> l, (r)=> r);


  }

}