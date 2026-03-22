
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class OrderPendingData {

  Crud crud;

  OrderPendingData(this.crud);

  getData(String usersId)async{

    var respons= await crud.postData(AppLink.pending, {"id" : usersId});
    return respons.fold((l)=> l, (r)=> r);


  }

  deleteData(String orderId)async{

    var respons= await crud.postData(AppLink.ordersDelete, {"id" : orderId});
    return respons.fold((l)=> l, (r)=> r);


  }

  uploadPaymentImage(String orderId, File file) async {
    var uri = Uri.parse(AppLink.uploadPayment);

    var request = http.MultipartRequest("POST", uri);

    request.fields['orderid'] = orderId;

    request.files.add(
      await http.MultipartFile.fromPath("file", file.path),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      return responseBody;
    } else {
      return {"status": "fail"};
    }
  }

}