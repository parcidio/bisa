import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'praca_database.db'),
    // When the database is first created, create a table to store CartItems.
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE CartItems('
        'id TEXT PRIMARY KEY, '
        'name TEXT, '
        'meanDescription TEXT, '
        'longDescription TEXT, '
        'price REAL, '
        'previousPrice REAL, '
        'rating REAL, '
        'quantity REAL, '
        'unit TEXT, '
        'category TEXT, '
        'grade TEXT, '
        'tags TEXT, '
        'createdAt TEXT, '
        'userId TEXT, '
        'otherProperties TEXT, '
        'categoryId INTEGER, '
        'image BLOB, ' // Image stored as binary data
        'uuid TEXT' // UUID field for sync
        ')',
      );
    },
    version: 1,
  );

  // Function to insert CartItems into the database
  Future<void> insertFavouriteItem(CartItems item) async {
    final db = await database;

    await db.insert(
      'CartItems',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Method to retrieve all the CartItems from the database
  Future<List<CartItems>> getCartItems() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('CartItems');

    return List.generate(maps.length, (i) {
      return CartItems.fromMap(maps[i]);
    });
  }

  // Method to update a FavouriteItem
  Future<void> updateFavouriteItem(CartItems item) async {
    final db = await database;

    await db.update(
      'CartItems',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  // Method to delete a FavouriteItem from the database
  Future<void> deleteFavouriteItem(String id) async {
    final db = await database;

    await db.delete(
      'CartItems',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Example usage:
  var favouriteItem = CartItems(
    id: '1',
    name: 'Sample Item',
    meanDescription: 'A sample favourite item',
    createdAt: DateTime.now(),
    userId: 'user123',
    uuid: 'uuid123',
  );

  // Insert the item
  await insertFavouriteItem(favouriteItem);

  // Retrieve all favourite items
  print(await getCartItems());

  // Update the item
  favouriteItem = CartItems(
    id: favouriteItem.id,
    name: 'Updated Item',
    meanDescription: 'An updated sample favourite item',
    createdAt: favouriteItem.createdAt,
    userId: favouriteItem.userId,
    uuid: favouriteItem.uuid,
  );
  await updateFavouriteItem(favouriteItem);

  // Retrieve all favourite items
  print(await getCartItems());

  // Delete the item
  await deleteFavouriteItem(favouriteItem.id);

  // Retrieve all favourite items
  print(await getCartItems()); // Should be empty
}

class CartItems {
  final String id;
  final String name;
  final String? meanDescription;
  final String? longDescription;
  final double? price;
  final double? previousPrice;
  final double? rating;
  final double? quantity;
  final String? unit;
  final String? category;
  final String? grade;
  final String? tags;
  final DateTime createdAt;
  final String userId;
  final String? otherProperties;
  final int? categoryId;
  final Uint8List? image; // Binary data for image
  final String uuid; // UUID field for sync

  CartItems({
    required this.id,
    required this.name,
    this.meanDescription,
    this.longDescription,
    this.price,
    this.previousPrice,
    this.rating,
    this.quantity,
    this.unit,
    this.category,
    this.grade,
    this.tags,
    required this.createdAt,
    required this.userId,
    this.otherProperties,
    this.categoryId,
    this.image, // Image as binary data
    required this.uuid, // UUID field
  });

  // Convert CartItems to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'meanDescription': meanDescription,
      'longDescription': longDescription,
      'price': price,
      'previousPrice': previousPrice,
      'rating': rating,
      'quantity': quantity,
      'unit': unit,
      'category': category,
      'grade': grade,
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
      'userId': userId,
      'otherProperties': otherProperties,
      'categoryId': categoryId,
      'image': image, // Storing image as binary data
      'uuid': uuid, // UUID field
    };
  }

  // Convert a Map to CartItems for database retrieval
  static CartItems fromMap(Map<String, dynamic> map) {
    return CartItems(
      id: map['id'],
      name: map['name'],
      meanDescription: map['meanDescription'],
      longDescription: map['longDescription'],
      price: map['price'],
      previousPrice: map['previousPrice'],
      rating: map['rating'],
      quantity: map['quantity'],
      unit: map['unit'],
      category: map['category'],
      grade: map['grade'],
      tags: map['tags'],
      createdAt: DateTime.parse(map['createdAt']),
      userId: map['userId'],
      otherProperties: map['otherProperties'],
      categoryId: map['categoryId'],
      image: map['image'], // Retrieving binary data for image
      uuid: map['uuid'], // UUID field
    );
  }
}
