import 'package:get/get.dart';

class InvestasiController extends GetxController {
  var category = 'Hewan Ternak'.obs;
  var selectedList = List<Product>.empty(growable: true).obs;

  List<Peternakan> listPeternakan = [
    Peternakan(
      harga: 50000,
      slot: 10,
      lokasi: 'Jawa Timur',
      imgPath: 'assets/images/image_peternakan.png',
      name: 'Peternakan Kambing',
      categoryData1: '1 Jenis',
      categoryData2: '1 slot',
    ),
    Peternakan(
      harga: 50000,
      slot: 10,
      lokasi: 'Jawa Timur',
      imgPath: 'assets/images/image_peternakan.png',
      name: 'Peternakan Sapi',
      categoryData1: '2 Jenis',
      categoryData2: '0 slot',
    ),
  ];

  late var allProduct = [
    Peternakan(
      harga: 50000,
      slot: 10,
      lokasi: 'Jawa Timur',
      imgPath: 'assets/images/image_peternakan.png',
      name: 'Peternakan Ayam',
      categoryData1: '2 Jenis',
      categoryData2: '1 slot',
    ),
    HewanTernak(
      peternakan: listPeternakan[0],
      harga: 1000000,
      slot: 5,
      imgPath: 'assets/images/cow.png',
      name: 'Sapi Perah',
      categoryData1: '150-450 kg',
      categoryData2: '12-18%',
    ),
    Peternakan(
      harga: 50000,
      slot: 10,
      lokasi: 'Jawa Tengah',
      imgPath: 'assets/images/image_peternakan.png',
      name: 'Peternakan Bebek',
      categoryData1: '2 Jenis',
      categoryData2: '1 slot',
    ),
    HewanTernak(
      peternakan: listPeternakan[1],
      harga: 2000000,
      slot: 3,
      imgPath: 'assets/images/cow.png',
      name: 'Sapi Potong',
      categoryData1: '200-500 kg',
      categoryData2: '10-15%',
    ),
    Peternakan(
      harga: 50000,
      slot: 10,
      lokasi: 'Jawa Barat',
      imgPath: 'assets/images/image_peternakan.png',
      name: 'Peternakan Kambing',
      categoryData1: '2 Jenis',
      categoryData2: '1 slot',
    ),
    HewanTernak(
      peternakan: listPeternakan[0],
      harga: 1500000,
      slot: 4,
      imgPath: 'assets/images/cow.png',
      name: 'Kambing Etawa',
      categoryData1: '50-100 kg',
      categoryData2: '8-12%',
    ),
    Peternakan(
      harga: 50000,
      slot: 10,
      lokasi: 'Yogyakarta',
      imgPath: 'assets/images/image_peternakan.png',
      name: 'Peternakan Domba',
      categoryData1: '2 Jenis',
      categoryData2: 'Peternakan',
    ),
    HewanTernak(
      peternakan: listPeternakan[1],
      harga: 2500000,
      slot: 2,
      imgPath: 'assets/images/cow.png',
      name: 'Domba Garut',
      categoryData1: '30-70 kg',
      categoryData2: '5-10%',
    ),
    Peternakan(
      harga: 50000,
      slot: 10,
      lokasi: 'Bali',
      imgPath: 'assets/images/image_peternakan.png',
      name: 'Peternakan Babi',
      categoryData1: '2 Jenis',
      categoryData2: '1 slot',
    ),
    HewanTernak(
      peternakan: listPeternakan[0],
      harga: 3000000,
      slot: 6,
      imgPath: 'assets/images/cow.png',
      name: 'Babi Bali',
      categoryData1: '100-200 kg',
      categoryData2: '15-20%',
    ),
  ];

  getSelectedList() => selectedList;
  setSelectedList(List<Product> list) => selectedList.value = list;

  void changeCategory(String category) {
    this.category.value = category;
    setSelectedList(
        allProduct.where((product) => product.category == category).toList());
  }

  @override
  void onInit() {
    super.onInit();
    selectedList.value = allProduct
        .where((product) => product.category == category.value)
        .toList();
  }
}

abstract class Product {
  String imgPath;
  String name;
  String subheading;
  int harga;
  int slot;
  String categoryData1;
  String categoryData2;
  String category;

  Product({
    required this.imgPath,
    required this.subheading,
    required this.name,
    required this.harga,
    required this.slot,
    required this.categoryData1,
    required this.categoryData2,
    required this.category,
  });
}

class HewanTernak extends Product {
  Peternakan peternakan;

  HewanTernak({
    required this.peternakan,
    required harga,
    required slot,
    required imgPath,
    required name,
    required categoryData1,
    required categoryData2,
  }) : super(
            imgPath: imgPath,
            subheading: peternakan.name,
            name: name,
            harga: harga,
            slot: slot,
            categoryData1: categoryData1,
            categoryData2: categoryData2,
            category: 'Hewan Ternak') {
    peternakan = peternakan;
    harga = harga;
    slot = slot;
  }
}

class Peternakan extends Product {
  String lokasi;

  Peternakan({
    required this.lokasi,
    required harga,
    required slot,
    required imgPath,
    required name,
    required categoryData1,
    required categoryData2,
  }) : super(
            imgPath: imgPath,
            name: name,
            harga: harga,
            slot: slot,
            subheading: lokasi,
            categoryData1: categoryData1,
            categoryData2: categoryData2,
            category: 'Peternakan') {
    lokasi = lokasi;
  }
}
