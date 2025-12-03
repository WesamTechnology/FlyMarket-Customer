import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flymarket_customer/core/class/statuserequest.dart';
import 'package:http/http.dart' as http;

import '../functions/check_internet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        print("DATA SENT: $data");

        var respons = await http.post(
          Uri.parse(linkurl),
          body: data,
        );

        print("RESPONSE STATUS: ${respons.statusCode}");
        print("RESPONSE BODY: ${respons.body}");

        if (respons.statusCode == 200 || respons.statusCode == 201) {
          Map responseBody = jsonDecode(respons.body);
          return Right(responseBody);
        } else {
          return Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print("========= Error : $e");
      return Left(StatusRequest.serverfailure);
    }
  }

}
