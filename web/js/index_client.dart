
import 'dart:html';
import'dart:convert' ;
import 'package:cookie/cookie.dart'as cookie;
import 'package:dialog/dialog.dart';


var username;
var password;
List list=[];

void main() {
  querySelector('#register').onClick.listen(user_register);
  querySelector('#login').onClick.listen(user_login);
}

void user_register(Event e) {
  // document.getElementById('user_name').value="TESTVALUE";
  username = document.getElementById('user_name').value;//��ȡ�û���
  password = document.getElementById('user_password').value;//��ȡ����
  if(username.length==0) {
    alert('�û���Ϊ��');

  }
  else if(password.length==0){;
  alert('����Ϊ��');

  }
  else{
    window.location.href="stu.html";
    list.add(username);
    list.add(password);//��list�ϼ����û������������Ϣ
    var path ='http://127.0.0.1:8080/index';
    var httprequest = new HttpRequest();
    httprequest
      ..open('POST', path)
      ..send(JSON.encode(list));//��list�е�������json�ļ��ĸ�ʽ�����������
    alert('ע��ɹ���');
    cookie.set('name', '${username}', expires: 7);
    cookie.set('password', '${password}', expires: 7);
    cookie.set('check', 'true', expires: 7);
  }

}

void user_login(Event e) {
  // document.getElementById('user_name').value="TESTVALUE";
  username = document.getElementById('user_name').value;//��ȡ�û���
  password = document.getElementById('user_password').value;//��ȡ����
  if(username.length==0) {
    alert('�û���Ϊ��');
  }
  else if(password.length==0){
    alert('����Ϊ��');
  }
  else{

    list.add(username);
    list.add(password);//��list�ϼ����û������������Ϣ
    var path ='http://127.0.0.1:8080/check';
    var httprequest = new HttpRequest();
    httprequest
      ..open('POST', path)
      ..send(JSON.encode(list));//��list�е�������json�ļ��ĸ�ʽ�����������

  }

}