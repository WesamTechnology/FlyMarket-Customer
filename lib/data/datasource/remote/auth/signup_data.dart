
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username ,String phone ) async {
    var response = await crud.postData(AppLink.signUp, {
      "username" : username ,
      "phone" : phone  , 
    });
    return response.fold((l) => l, (r) => r);
  }
}
