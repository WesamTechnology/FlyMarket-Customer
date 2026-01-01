
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String phone) async {
    var response = await crud.postData(AppLink.login, {
      "phone" : phone
    });
    return response.fold((l) => l, (r) => r);
  }

  getUser(String phone) async {
    var response = await crud.postData(AppLink.loginverfy, {
      "phone" : phone
    });
    return response.fold((l) => l, (r) => r);
  }


}
