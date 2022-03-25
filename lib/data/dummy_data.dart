import 'package:furniture_app/constants/app_images.dart';
import 'package:furniture_app/models/furnitre_item.dart';

var furnitureNames = ['All', 'Chairs', 'Tables', 'Sofa', 'Bed'];

var furnitureItemData = [
  FurnitureItem(
    title: 'Chair',
    name: 'John',
    description: 'A new high quality chair',
    imageUrl: AppImages.chair,
    price: 2000,
  ),
  FurnitureItem(
    title: 'Sofa',
    name: 'Peter',
    description: 'A new Leather Sofa',
    imageUrl: AppImages.sofa,
    price: 3000,
  ),
  FurnitureItem(
    title: 'Bed',
    name: 'Paul',
    description: 'A new single bed with high quality mattress',
    imageUrl: AppImages.bed,
    price: 5000,
  ),
];
