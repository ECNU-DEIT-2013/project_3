// Copyright (c) 2012, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';
ImageElement p1;
ImageElement p2 = querySelector('#getWords2');
ImageElement p3 = querySelector('#getWords3');
ImageElement p4 = querySelector('#getWords4');
ImageElement p5 = querySelector('#getWords5');
ImageElement p6 = querySelector('#getWords6');
ImageElement p7 = querySelector('#getWords7');
void main() {
  p1 = querySelector('#getWords1');
  p1.src="../img/portfolio/1.jpg";
  querySelector('#getWords2').onClick.listen(makeRequest1);
  querySelector('#getWords3').onClick.listen(makeRequest2);
  querySelector('#getWords4').onClick.listen(makeRequest3);
  querySelector('#getWords5').onClick.listen(makeRequest4);
  querySelector('#getWords6').onClick.listen(makeRequest5);
  querySelector('#getWords7').onClick.listen(makeRequest6);
}

void makeRequest1(Event e) {
  p1.src="../img/portfolio/1.jpg";
}
void makeRequest2(Event e) {
  p1.src="../img/portfolio/2.jpg";
}
void makeRequest3(Event e) {
  p1.src="../img/portfolio/3.jpg";
}
void makeRequest4(Event e) {
  p1.src="../img/portfolio/4.jpg";
}
void makeRequest5(Event e) {
  p1.src="../img/portfolio/5.jpg";
}
void makeRequest6(Event e) {
  p1.src="../img/portfolio/6.jpg";
}