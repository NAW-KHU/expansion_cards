import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _cityController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _streetAddressController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Forms'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.blueGrey, width: 2.0)
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.account_box_outlined),
                    // suffixIcon: Icon(Icons.check_box_outlined),
                    hintText: 'John Doe',
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2.0)),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: 'johndoe@xyz.com',
                    labelText: 'Email Address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill this field';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _phoneController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2.0)),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    hintText: '09123456789',
                    labelText: 'Phone Number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill this field';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _streetAddressController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2.0)),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.streetview_outlined),
                    hintText: '123 State Street',
                    labelText: 'Street Address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill this field';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _cityController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2.0)),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.location_city_outlined),
                    hintText: 'Yangon',
                    labelText: 'City',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill this field';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Hello ${_nameController.text}\n Your details have been submitted and an emil sent to ${_emailController.text}')));
                      } else {
                        // the form has some validation errors.
                        //Do something...
                        const Text(
                            'Your input data does not match with format.Please try again.');
                      }
                    },
                    child: const Text('Submit', style: TextStyle(color: Colors.white),))
              ],
            )),
      ),
    );
  }

  // InputDecoration inputDecoration({
  //   InputBorder? enabledBorder,
  //   InputBorder? border,
  //   Color? fillColor,
  //   bool? filled,
  //   Widget? prefixIcon,
  //   String? hintText,
  //   String? labelText,
  // }) =>
  //    InputDecoration(
  //       enabledBorder: enabledBorder ??
  //            const OutlineInputBorder(
  //               borderSide: BorderSide(
  //             color: Colors.amber,
  //             width: 2.0,
  //           )),
  //       border: border ?? const OutlineInputBorder(borderSide: BorderSide()),
  //       fillColor: fillColor ?? Colors.red,
  //       filled: true,
  //       prefixIcon: prefixIcon,
  //       hintText: hintText,
  //       labelText: labelText,
  //     );
}
