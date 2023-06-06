import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({
    Key ? key
  }): super(key: key);

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State < OrderWidget > {
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  bool nilaiSwitch = true;
  bool nilaiSwitch2 = true;
  bool nilaiSwitch3 = true;
  String ? radioButtonValue;
  String ? dropDownValue;

  get radioButtonOptions => null;

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
  }

  String _jk = "";
  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF2F9DF5),
        elevation: 0,
        title: Text(
          "Paket Layanan",
          style: TextStyle(color: Colors.white),
          //fontWeight: FontWeight.bold, color: Color(0xFFF9683A),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SwitchListTile(
              title: Text('Air',
                style: TextStyle(
                  fontWeight: FontWeight.bold)),
              value: nilaiSwitch,
              activeTrackColor: Colors.blue[100],
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  nilaiSwitch = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Pompa Air',
                style: TextStyle(
                  fontWeight: FontWeight.bold)),
              value: nilaiSwitch2,
              activeTrackColor: Colors.blue[100],
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  nilaiSwitch2 = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Selang Air',
                style: TextStyle(
                  fontWeight: FontWeight.bold)),
              value: nilaiSwitch3,
              activeTrackColor: Colors.blue[100],
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  nilaiSwitch3 = value;
                });
              },
            ),
            new RadioListTile(
              value: "Cuci Kilat",
              title: new Text("Cuci Kilat",
                style: TextStyle(
                  fontWeight: FontWeight.bold)),
              groupValue: _jk,
              onChanged: (String ? value) {
                _pilihJk(value!);
              },
              activeColor: Colors.blue,
              subtitle: new Text("Cuci bersih tanpa ada polesan treatment tambahan"),
            ),
            new RadioListTile(
              value: "Deepclean",
              title: new Text("Deepclean",
                style: TextStyle(
                  fontWeight: FontWeight.bold)),
              groupValue: _jk,
              onChanged: (String ? value) {
                _pilihJk(value!);
              },
              activeColor: Colors.blue,
              subtitle: new Text("cuci bersih dan perawatan kebersihan mobil dengan treatment tambahan yang menjadikan mobil lebih bersih, berkilau, dan tahan lama"),
            ),
            SizedBox(height: 8),
            Container(
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFFFFFF),
              ),
              // Alamat Pemesanan
              child: TextFormField(
                style: TextStyle(color: Color(0xFF2F9DF5)),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2F9DF5))),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2F9DF5))),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                  hintText: "Alamat",
                  hintStyle: TextStyle(color: Color(0xFF2F9DF5)),
                  labelText: "Alamat",
                  labelStyle: TextStyle(color: Color(0xFF2F9DF5)),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFFFFFFF),
              ),
              // form alamat
              child: TextFormField(
                style: TextStyle(color: Color(0xFF2F9DF5)),
                maxLines: 2,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2F9DF5))),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2F9DF5))),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
                  hintText: "JL. Sekolahan No. 1",
                  hintStyle: TextStyle(color: Color(0xFF2F9DF5)),
                  labelText: "Detail Alamat",
                  labelStyle: TextStyle(color: Color(0xFF2F9DF5)),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Text(
                'Metode Pembayaran:',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton < String > (
                  value: dropDownValue,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.blue,
                    size: 24,
                  ),
                  onChanged: (String ? val) {
                    setState(() {
                      dropDownValue = val;
                    });
                  },
                  underline: Container(),
                  isExpanded: true,
                  hint: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Text(
                      'Pilih Metode Pembayaran',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  items: [
                    DropdownMenuItem < String > (
                      value: 'Transfer Bank',
                      child: Text('    Transfer Bank                                     3510457446',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue),
                      ),
                    ),
                    DropdownMenuItem < String > (
                      value: 'Dana',
                      child: Text('    Dana                                               081336262502',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue),
                      ),
                    ),
                    DropdownMenuItem < String > (
                      value: 'Shopee pay',
                      child: Text('    Shopee pay                               122081336262502',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 20),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pushNamed(context, 'pesanan'); // Add your code here to process the form submission
                },
                child: Text(
                  'Pesan Sekarang',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF2784F1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}