

import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class CategoresAllData {

  Crud crud;

  CategoresAllData(this.crud);

  getData()async{

    var respons= await crud.postData(AppLink.categoriesAll, {});
    return respons.fold((l)=> l, (r)=> r);


  }

}