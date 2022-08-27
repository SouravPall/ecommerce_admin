import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class NewProductsPage extends StatefulWidget {
  static const routeName = '/new-products';

  const NewProductsPage({Key? key}) : super(key: key);
  @override
  State<NewProductsPage> createState() => _NewProductsPageState();
}

class _NewProductsPageState extends State<NewProductsPage> {
  String? _dropdownValue;

  final _formKey = GlobalKey<FormState>();
  final productNameController = TextEditingController();
  final productSalePriceController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final purchasePriceController = TextEditingController();
  final purchaseQuantityController = TextEditingController();

  DateTime? dateTime;
  bool isUploading = false;
  String? imageUrl;
  bool isGallery = true;
  String? categorySelectedValue;

  @override
  void dispose() {
    productNameController.dispose();
    productSalePriceController.dispose();
    productDescriptionController.dispose();
    purchasePriceController.dispose();
    purchaseQuantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Products'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 4),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Purchase Date :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  showDatePickerDialog();
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green,
                  ),
                  child: Row(
                    children: const [
                      SizedBox(width: 16),
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 110),
                      Text(
                       'No date chosen',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Card(
                elevation: 4,
                child: SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Center(
                      child: imageUrl == null
                          ? Image.asset(
                        'images/product.jpg',
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                          : Image.network(
                        imageUrl!,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const Text(
                      'Chose  Photo',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                isGallery = false;
                                _getImage();
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.green,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Camera',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 50),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                isGallery = true;
                                _getImage();
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.green,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Gallery',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Category :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const FittedBox(
                        child: Text(
                          'No category Selected',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Consumer<ProductProvider>(
                        builder: (context, provider, _) => DropdownButtonFormField<String>(
                          hint: const Text('select'),
                          value: _dropdownValue,
                          borderRadius: BorderRadius.circular(15),
                          dropdownColor: Colors.white,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.green,
                          ),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                          items: provider.categoryList.map((model) {
                            return DropdownMenuItem<String>(
                              value: model.name,
                              child: Text(model.name!),
                            );
                          }).toList(),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Please select a Category';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            setState(() {
                              _dropdownValue = newValue;
                              //categorySelectedValue = newValue.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    NewProductTextField(
                      controller: productNameController,
                      hintText: 'Product Name',
                      prefixIcon: Icons.card_giftcard,
                    ),
                    SizedBox(height: 15),
                    NewProductTextField(
                      controller: productSalePriceController,
                      hintText: 'Product Sale Price',
                      prefixIcon: Icons.monetization_on,
                      keyBordType: TextInputType.number,
                    ),
                    SizedBox(height: 15),
                    NewProductTextField(
                      controller: purchasePriceController,
                      hintText: 'Purchase Price',
                      prefixIcon: Icons.monetization_on,
                      keyBordType: TextInputType.number,
                    ),
                    SizedBox(height: 15),
                    NewProductTextField(
                      controller: purchaseQuantityController,
                      hintText: 'Purchase Quantity',
                      prefixIcon: Icons.add,
                      keyBordType: TextInputType.number,
                    ),
                    const SizedBox(height: 15),
                    NewProductTextField(
                      controller: productDescriptionController,
                      hintText: 'Product Description',
                      prefixIcon: Icons.text_increase,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              isUploading
                  ? CircularProgressIndicator()
                  : InkWell(
                onTap: _submitNewProduct,
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green,
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getImage() async {
    final status = isGallery;
    final selectedImage = await ImagePicker()
        .pickImage(source: isGallery ? ImageSource.gallery : ImageSource.camera);
    if (selectedImage != null) {
      setState(() {
        isUploading = true;
      });
      try {
        final url =
        await context.read<ProductProvider>().updateImage(selectedImage);
        setState(() {
          imageUrl = url;
          isUploading = false;
        });
      } catch (e) {}
    }
  }

  Future<void> showDatePickerDialog() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        dateTime = selectedDate;
      });
    }
  }

  // void _submitNewProduct() {
  //   if (dateTime == null) {
  //     showMsg(context, 'Please select a date');
  //     return;
  //   }
  //   if (imageUrl == null) {
  //     showMsg(context, 'Please select an image');
  //     return;
  //   }if (CategorySelectedValue == null) {
  //     showMsg(context, 'Please select an category');
  //     return;
  //   }
  //   if (_formKey.currentState!.validate()) {
  //     final productModel = ProductModel(
  //       name: productNameController.text,
  //       descripton: productDescriptionController.text,
  //       salePrice: num.parse(productSalePriceController.text),
  //       category: CategorySelectedValue,
  //       imageUrl: imageUrl,
  //     );
  //     final purchaseModel = PurchaseModel(
  //       dateModel: DateModel(
  //         timestamp: Timestamp.fromDate(dateTime!),
  //         day: dateTime!.day,
  //         month: dateTime!.month,
  //         year: dateTime!.year,
  //       ),
  //       purchasePrice: num.parse(purchasePriceController.text),
  //       productQuantity: num.parse(purchaseQuantityController.text),
  //     );
  //     final catModel = context
  //         .read<ProductProvider>()
  //         .getCategoryModelByCatName(CategorySelectedValue!);
  //     context
  //         .read<ProductProvider>()
  //         .addNewProduct(productModel, purchaseModel, catModel)
  //         .then((value) {
  //       _resetField();
  //     }).catchError((error) {
  //       showMsg(context, 'Could not find');
  //     });
  //   }
  // }
  void _submitNewProduct() {
    if(_formKey.currentState!.validate()){

    }
  }
  void _resetField() {
    setState(() {
      productNameController.clear();
      productDescriptionController.clear();
      productSalePriceController.clear();
      purchasePriceController.clear();
      purchaseQuantityController.clear();
      imageUrl = null;
      categorySelectedValue = null;
      dateTime = null;
    });
  }
}