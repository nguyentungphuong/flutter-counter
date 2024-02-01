import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: MyCustomWidget(),
      ),
    );
  }
}

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  MyObject myObject = MyObject(0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Giá trị hiện tại: ${myObject.value}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  myObject.decrease();
                  setState(() {});
                },
                icon: const Icon(Icons.remove),
                label: const Text('Giảm'),
              ),
              const SizedBox(width: 5),
              OutlinedButton.icon(
                onPressed: () {
                  myObject.increase();
                  setState(() {});
                },
                icon: const Icon(Icons.add),
                label: const Text('Tăng'),
              ),
              const SizedBox(width: 5),
              OutlinedButton.icon(
                onPressed: () {
                  myObject.square();
                  setState(() {});
                },
                icon: const Icon(Icons.square_foot),
                label: const Text('Bình phương'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyObject {
  int _value;

  MyObject(this._value);

  int get value => _value;

  set value(int newValue) {
    _value = newValue;
  }

  void increase() {
    _value++;
  }

  void decrease() {
    _value--;
  }

  void square() {
    _value = _value * _value;
  }

  int power(int exponent) {
    if (exponent == 0) {
      return 1;
    } else if (exponent % 2 == 0) {
      int halfPower = power(exponent ~/ 2);
      return halfPower * halfPower;
    } else {
      int halfPower = power((exponent - 1) ~/ 2);
      return _value * halfPower * halfPower;
    }
  }
}
