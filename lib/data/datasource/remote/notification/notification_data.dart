

import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class NotificationData {

  Crud crud;

  NotificationData(this.crud);

  getData(String uesrId)async{

    var respons= await crud.postData(AppLink.notification, {"id" : uesrId});
    return respons.fold((l)=> l, (r)=> r);


  }

}