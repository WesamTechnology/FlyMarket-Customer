
import 'package:get/get.dart';

validInput(String val,int min , int max , String type){
  if(type=="username"){
    if(!GetUtils.isUsername(val)){
      return "not valid user name";
    }

  }

  if(type=="email"){
    if(!GetUtils.isEmail(val)){
      return "not valid email";
    }
  }

  if(type=="phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "not valid phone";
    }
  }

  if(type=="password"){
    if(!GetUtils.isPassport(val)){
      return "not valid password";
    }
  }

  if(val.length <min){
    return "can\'t be later $min";
  }

  if(val.length >max){
    return "can\'t be large $max";
  }

  if(val.isEmpty){
    return "can\'t be empty";
  }


}