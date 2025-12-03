

import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class SignUpData {

  Crud crud;

  SignUpData(this.crud);

   postData(String username,String email,String password,String phone)async{

    var respons= await crud.postData(AppLink.signUp, {
      "username":username ,
      "email": email,
      "password": password,
      "phone": phone,
    });
    return respons.fold((l)=> l, (r)=> r);


  }

}