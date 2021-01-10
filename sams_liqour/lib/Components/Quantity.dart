import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Quantity extends StatefulWidget {
  @override
  _QuantityState createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(2),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 28.0),
            child: Container(
              width: 150,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.blueGrey, width: 2),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      controller: _controller,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: false, signed: true),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  Container(
                    height: 38,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 0.5),
                            ),
                          ),
                          child: InkWell(
                            child: Icon(Icons.arrow_drop_up_rounded, size: 18),
                            onTap: () {
                              int currentValue = int.parse(_controller.text);
                              setState(() {
                                currentValue++;
                                _controller.text = (currentValue).toString();
                              });
                            },
                          ),
                        ),
                        Container(
                          child: InkWell(
                            child:
                                Icon(Icons.arrow_drop_down_rounded, size: 18),
                            onTap: () {
                              int currentValue = int.parse(_controller.text);
                              setState(() {
                                currentValue--;
                                _controller.text =
                                    (currentValue > 0 ? currentValue : 0)
                                        .toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
