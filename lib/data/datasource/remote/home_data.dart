

import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class HomeData {

  Crud crud;

  HomeData(this.crud);

  getData()async{

    var respons= await crud.postData(AppLink.home, {});
    return respons.fold((l)=> l, (r)=> r);


  }

}