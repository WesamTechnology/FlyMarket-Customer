
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class VerifyAndRegisterData {
  Crud crud;
  VerifyAndRegisterData(this.crud);
  postdata(String username ,String phone ) async {
    var response = await crud.postData(AppLink.verify_and_register, {
      "username" : username ,
      "phone" : phone  ,
    });
    return response.fold((l) => l, (r) => r);
  }
}
