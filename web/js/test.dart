import 'dart:html';
import'dart:convert' ;
import 'package:cookie/cookie.dart'as cookie;

var username,password;
List list=[];

main() async{


  //list.add(username.text);
  // list.add(password.text);
  //querySelector('#register').onClick.listen(user_register);
  querySelector('#register').onClick.listen(user_register);



}

void user_register(Event e){
  cookie.set('login', 'false');
  username=document.getElementById('username').value;
  password=document.getElementById('password').value;
  list.add(username);
  list.add(password);
  //querySelector('#test').text=username.toString();
  var path = 'http://127.0.0.1:8080';
  var httprequest=new HttpRequest();
  httprequest
    ..open('POST',path)
    ..send(JSON.encode(list));
  //����֪�û�����������ȷ������£���username��password�浽cookie���У��ж��û����������Ƿ���ȷ�����صĴ��뻹û��д����Ӧ���Ǵӷ����������ͻ��˵��У�
  cookie.set('name', '${username}', expires: 7);
  cookie.set('password', '${password}', expires: 7);
  cookie.set('check', 'true', expires: 7);
  var name=cookie.get('name');
  querySelector('#test').text=name.toString();


  /** if( cookie.get('check_login')=='true'){
      var s="true";
      querySelector('#test').text=s.toString();
      }
      else{
      var s="false";
      querySelector('#test').text=s.toString();
      }*/

}