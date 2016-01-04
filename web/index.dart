import 'dart:html';
import 'dart:convert';
import "dart:async";
import 'dart:math' show Random;

List classList = new List();
List teacherList = new List();
List twoList = new List();
SelectElement classesselector = new SelectElement();
SelectElement teacherselector = new SelectElement();

void main() {
  document.getElementById("home2").style.visibility="hidden";
  querySelector('#login')              ///Commit为确认登录按钮
    ..onClick.listen(LogIn);            ///logIn()为按下确认键登录进入主页面的子函数
  querySelector('#register')               ///Clear()为清空按钮
    ..onClick.listen(ClearLog);         ///ClearLog()为清空登录页面的函数
  InputElement user = querySelector('#user_name');                ///User为用户名输入框
  user
    ..placeholder='Please enter your username'
    ..classes.add('user_name');
  InputElement password = querySelector('#user_password');       ///Password为密码输入框
  password.placeholder='Please enter your password';
}

void ClearLog(MouseEvent event){      ///清空按钮功能
  InputElement user = querySelector('#user_name');
  user.value='';
  InputElement password = querySelector('#user_password');
  password.value='';
}

Future LogIn(MouseEvent event) async {
  ///登录按钮功能
  var Username = document.getElementById('user_name').value;
  var Password = document.getElementById('user_password').value;
  List a2 = ['', ''];
  a2[0] = Username;
  a2[1] = Password;
  if (Username == '') {
    window.alert('Name is NULL!');
  }
  else if (Password == '') {
    window.alert('Password is NULL!');
  }
  else {
    var url = 'http://127.0.0.1:8008/login';
    var request = new HttpRequest();
    request
      ..open('POST', url)
      ..send(JSON.encode(a2))//对输入的信息进行编码
      ..onLoadEnd.listen((event) => requestComplete(request));}//获取相应以及后续的操作
}

void requestComplete(request){           ///登录判断
  var check =JSON.decode(request.responseText);//获取相应的内容
  if (check=='1' ) {
    window.alert('Login success!');
    document.getElementById('home1').style.visibility="hidden";
    document.getElementById("home2").style.visibility="visible";
    querySelector('#home3').onClick.listen(makeRequest1);
  }
  else window.alert('Wrong name or password!');
}

void makeRequest1(Event e) {
  document.getElementById('home1').style.visibility="visible";
  document.getElementById("home2").style.visibility="hidden";
}

requestComplete2 (HttpRequest request) {
  if (request.status == 200) {
    List<String> classList = JSON.decode(request.responseText);
    for(int i=0;i<classList[0].length;i++){
      OptionElement option = new OptionElement();
      option.text = classList[0][i];
      print(classList[0][i]);
      classesselector.children.add(option);
      print(classList[0][i]+"done");
    }
    for(int j=0;j<classList[1].length;j++){
      OptionElement option1 = new OptionElement();
      option1.text = classList[1][j];
      print(classList[1][j]);
      teacherselector.children.add(option1);
      print(classList[1][j]+"done");
    }
  } else {
    querySelector('#Myclassbt').text='nanguo';
  }
}

void LoadCommentsTag(int j) {
  DivElement commentcon = new DivElement();
  commentcon.classes;
}
