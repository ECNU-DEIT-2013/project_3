void main() {
  querySelector('#login').onClick.listen(user_login);
}
void user_login(Event e){
  username = document.getElementById('user_name').value;//��ȡ�û���
  password = document.getElementById('user_password').value;//��ȡ����
  if(username.length==0) {
    alert('�û���Ϊ��');

  }
  else if(password.length==0){;
  alert('����Ϊ��');

  }
  else{
    if (username=="admin")
      if(password=="admin")
        window.location.href="myemail.html";
      else
        alert("�������");
    else
      alert("�û�������");
  }

}