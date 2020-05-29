// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.7

import 'package:expect/expect.dart';

/*spec:nnbd-off.class: Class1a:explicit=[Class1a]*/
/*spec:nnbd-sdk.class: Class1a:explicit=[Class1a*]*/
class Class1a {
  Class1a();
}

/*class: Class1b:needsArgs*/
class Class1b<T> extends Class1a {
  Class1b();
}

/*class: Class1c:needsArgs*/
class Class1c<T> extends Class1a {
  Class1c();
}

/*spec:nnbd-off|prod:nnbd-off.class: Class2:*/
class Class2<T> {
  Class2();
}

/*spec:nnbd-off|prod:nnbd-off.member: test:*/
test(Class1a c, Type type) {
  return c.runtimeType == type;
}

/*spec:nnbd-off|prod:nnbd-off.member: main:*/
main() {
  Expect.isTrue(test(new Class1a(), Class1a));
  Expect.isFalse(test(new Class1b<int>(), Class1a));
  Expect.isFalse(test(new Class1c<int>(), Class1a));
  new Class2<int>();
}