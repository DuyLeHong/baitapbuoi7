import 'package:baitapbuoi6/product_model.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  FocusNode myFocusNode = new FocusNode();

  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptrionController = TextEditingController();
  TextEditingController imageURLController = TextEditingController();

  String url = '';
  String title = '';
  double price = 0.0;
  bool _loadingImage = false;

  final _formKey = GlobalKey<FormState>();

  void loadImage() {
    _loadingImage = true;
    precacheImage(NetworkImage(url), context, onError: (e, stackTrace) {
      //print('error $e');
      setState(() {
        _loadingImage = false;
        //print(_loadingimage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _saveForm(context);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Expanded',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(children: [
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      Positioned(
                          left: 1,
                          child: Container(
                              height: 20,
                              color: Colors.brown.withOpacity(0.8),
                              child: Text(
                                '1',
                                style: TextStyle(fontSize: 15),
                              )))
                    ]),
                  ),
                  Expanded(
                    flex: 2,
                    child: Stack(children: [
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.blue,
                        ),
                      ),
                      Center(
                          child: Container(
                              height: 20,
                              color: Colors.brown.withOpacity(0.8),
                              child: Text(
                                '1',
                                style: TextStyle(fontSize: 15),
                              )))
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(children: [
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.orange,
                        ),
                      ),
                      Positioned(
                          right: 1,
                          child: Container(
                              height: 20,
                              color: Colors.brown.withOpacity(0.8),
                              child: Text(
                                '2',
                                style: TextStyle(fontSize: 15),
                              )))
                    ]),
                  ),
                ],
              ),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                      color: myFocusNode.hasFocus ? Colors.blue : Colors.grey),
                  //I believe the size difference here is 6.0 to account padding
                  labelText: 'Title',
                ),
                validator: (String? value) {
                  if (value?.isEmpty == true) {
                    return 'Title is required';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  //_initValues['name'] = value ?? '';
                },
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                  //alignLabelWithHint: true,
                  labelStyle: TextStyle(
                      fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                      color: Colors.grey),
                  //I believe the size difference here is 6.0 to account padding
                  labelText: 'Price',
                ),
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value!) == null) {
                    return 'Please enter a valid number';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero';
                  }
                  return null;
                },
                onSaved: (String? value) {},
              ),
              TextFormField(
                controller: descriptrionController,
                decoration: InputDecoration(
                  //alignLabelWithHint: true,
                  labelStyle: TextStyle(
                      fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                      color: Colors.grey),
                  //I believe the size difference here is 6.0 to account padding
                  labelText: 'Description',
                ),
                validator: (value) => (value?.isEmpty == true)
                    ? 'Please enter a description'
                    : null,
                onSaved: (String? value) {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        _getImageView(),
                      ]),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: imageURLController,
                            onChanged: (value) {
                              setState(() {
                                url = value;
                                loadImage();
                              });
                            },
                            decoration: InputDecoration(
                              //alignLabelWithHint: true,
                              labelStyle: TextStyle(
                                  fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                                  color: Colors.grey),
                              //I believe the size difference here is 6.0 to account padding
                              labelText: 'Image URL',
                            ),
                            onSaved: (String? value) {},
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _saveForm(BuildContext context) {
    if (_formKey.currentState?.validate() == true) {
      _formKey.currentState?.save();

      var newProduct = ProductModel(titleController.text, double.tryParse(priceController.text)!, descriptrionController.text, imageURLController.text);

      Navigator.pop(context, newProduct);

      // Navigator.pop(
      //     context,
      //     ProductItem(
      //         id: _initValues['id'].toString(),
      //         name: _initValues['name'],
      //         price: double.parse(_initValues['price']),
      //         description: _initValues['description'],
      //         quantity: 1,
      //         image: _initValues['image']));
    }
  }

  Widget _getImageView() {
    if (_loadingImage == false) {
      return Positioned(top: 10, left: 10, child: Icon(Icons.image_outlined));
    } else {
      return Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            image:
                DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
      );
    }
  }
}
