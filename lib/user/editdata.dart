import 'package:flutter/material.dart';

class EditdataWidget extends StatefulWidget {
  const EditdataWidget({super.key});

  @override
  State<EditdataWidget> createState() => _EditdataState();
}

class _EditdataState extends State<EditdataWidget> {
  TextEditingController datetimeinput = TextEditingController();
  @override
  void initState() {
    datetimeinput.text = "";
    super.initState();
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
          "Edit Data",
          style: TextStyle(color: Colors.white),
              //fontWeight: FontWeight.bold, color: Color(0xFFF9683A),
        ),
        //leading: Container(),
      ),
      // Body
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFFFFFF),
                ),
                // Nama Pesanan
                child: TextFormField(
                  style: TextStyle(color: Color(0xFF2F9DF5)),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2F9DF5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2F9DF5))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Nama Lengkap",
                      hintStyle: TextStyle(color: Color(0xFF2F9DF5)),
                      labelText: "Nama Lengkap",
                      labelStyle: TextStyle(color: Color(0xFF2F9DF5)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
                ),
              ),
              // Alamat
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFFFFFFF),
                ),
                // form alamat
                child: TextFormField(
                  style: TextStyle(color: Color(0xFF2F9DF5)),
                  maxLines: 3,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2F9DF5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2F9DF5))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Alamat",
                      hintStyle: TextStyle(color: Color(0xFF2F9DF5)),
                      labelText: "Alamat",
                      labelStyle: TextStyle(color: Color(0xFF2F9DF5)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
                ),
              ),
              // no.hp
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFFFFFF),
                ),
                // form no.hp
                child: TextFormField(
                  style: TextStyle(color: Color(0xFF2F9DF5)),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2F9DF5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2F9DF5))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "No.Handphone",
                      hintStyle: TextStyle(color: Color(0xFF2F9DF5)),
                      labelText: "No.Handphone",
                      labelStyle: TextStyle(color: Color(0xFF2F9DF5)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0XFF676B77),
                          onPrimary: Color(0XFFFFFFFF),
                          minimumSize: Size(150, 40),
                          textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          shadowColor: Color(0XFF000000)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Batal"),
                    ),
                  ),
                  // Button
                  Container(
                      // Button Simpan
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0XFF2F9DF5),
                              onPrimary: Color(0XFFFFFFFF),
                              minimumSize: Size(150, 40),
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              shadowColor: Color(0XFF000000)),
                          onPressed: () {},
                          child: Text("Simpan"))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}