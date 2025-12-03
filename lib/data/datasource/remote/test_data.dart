
import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class TestData {

 Crud crud;

 TestData(this.crud);

 getData()async{

   var respons= await crud.postData(AppLink.server, {});
   return respons.fold((l)=> l, (r)=> r);


 }

}