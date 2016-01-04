import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
import 'package:rest_frame/rest_frame.dart';
import 'dart:convert';
import'dart:async';


Router router1 = new Router();
Router login = new Router();
var decoded;
Router myclass = new Router();
Router allclass = new Router();
List classList = new List();
List teacherList = new List();
List twoList = new List();


main() async{
  login.post(getLogin, "/login");
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8008);
  print("Serving at ${server.address}:${server.port}");
  listenForRequests(server);
}

String getStock() {
  return "[rest_test ：) get stock]";
}

Future<String> getLogin() async{//登录实现，连接数据库
  var tag = 'false';
  List b = JSON.decode(decoded);//对客户端传过来的信息解码
  var Username = b[0];
  var Password = b[1];
  var pool = new ConnectionPool(host: '52.193.39.90',port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340207', max: 5);
  var results = await pool.query('SELECT * FROM admin where name = "${Username}"and password ="${Password}" ');//查找匹配输入的用户信息
  await results.forEach((row) {
    print('${row.name},${row.password}');
    tag = 'true';
  });
  if (tag=='true') {
    print('oktologin');}
  else {print ('error');}
  return tag;
}




void handleRequest(HttpRequest request,Router routen) {
  routen.route(request);
}

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}

listenForRequests(HttpServer requests) async {
  await for (HttpRequest request in requests){
    var res= request.response;
    addCorsHeaders(request.response);
    print('accept');//测试是否接收到client端的request
    if (request.uri.path=="/login"){//登录功能的实现
      decoded = await request.transform(UTF8.decoder).join();//获取客户端传来的数据
      print(decoded);
      var tag=await getLogin();
      if ( tag=='true')
      { await request.response
        ..headers.contentType = new ContentType("application", "json", charset: "utf-8");
      await request.response.write(JSON.encode('1'));//告诉客户端信息匹配成功
      request
        ..response.close();
      }
      else
      {await request.response
        ..headers.contentType = new ContentType("application", "json", charset: "utf-8");
      request
        ..response.write('0')//告诉客户端信息是错误的
        ..response.close();
      }
    }//调用route为login的时候get的函数
    else if(request.uri.path=="/stock"){
      handleRequest(request,router1);}//调用route为stock的时候的函数
    else if(request.uri.path=="/myclass") {
      await getMyclass(request);
      await request.response
        ..headers.contentType = new ContentType("application", "json", charset: "utf-8");
      twoList = [classList,teacherList];
      print(twoList);
      res.write(twoList);
      res.close();
      classList = [];
      teacherList = [];
    }
    else if(request.uri.path=="/allclass") {
      await getAllclass(request);
      await request.response
        ..headers.contentType = new ContentType("application", "json", charset: "utf-8");
      twoList = [classList,teacherList];
      print(twoList);
      res.write(twoList);
      res.close();
      classList = [];
      teacherList = [];
    }
    else print("Can't find");}
}


