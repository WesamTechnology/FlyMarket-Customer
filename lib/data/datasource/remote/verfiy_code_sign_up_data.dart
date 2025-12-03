
import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class VerfiyCodeSignUpData {

  Crud crud;

  VerfiyCodeSignUpData(this.crud);

  postData(String email,String verfiyCode)async{

    var respons= await crud.postData(AppLink.verfiyCodeSignUp, {
      "email": email,
      "verfiycode": verfiyCode,
    });
    return respons.fold((l)=> l, (r)=> r);


  }

}