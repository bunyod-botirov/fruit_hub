import 'package:flutter/material.dart';

String userName = "";
Set favourite = {};
Set orders = {};

List ordersHistory = [];

List<Color> containerColor = [
  Colors.orange.shade50,
  Colors.grey.shade200,
  Colors.pink.shade50,
  Colors.cyan.shade50,
  Colors.purple.shade50,
  Colors.yellow.shade50,
  Colors.blue.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.pink.shade50,
  Colors.purple.shade50,
  Colors.yellow.shade50,
  Colors.blue.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.pink.shade50,
  Colors.purple.shade50,
  Colors.yellow.shade50,
  Colors.blue.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.pink.shade50,
  Colors.purple.shade50,
  Colors.yellow.shade50,
  Colors.blue.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.pink.shade50,
  Colors.purple.shade50,
  Colors.yellow.shade50,
  Colors.blue.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.pink.shade50,
  Colors.purple.shade50,
  Colors.yellow.shade50,
  Colors.blue.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.pink.shade50,
  Colors.purple.shade50,
  Colors.yellow.shade50,
  Colors.blue.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.pink.shade50,
  Colors.purple.shade50,
  Colors.yellow.shade50,
  Colors.blue.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.pink.shade50,
];

List products = [
  {
    "img": "assets/db_images/6.png",
    "name": "Honey lime combo",
    "price": "2000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/28.png",
    "name": "Berry mango combo",
    "price": "8000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/50.png",
    "name": "Greek salad combo",
    "price": "10000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/1.png",
    "name": "Orange smuzzi combo",
    "price": "15000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/2.png",
    "name": "Stawberry salad combo",
    "price": "10000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/3.png",
    "name": "Honey fruits coctail",
    "price": "8000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/4.png",
    "name": "Fruits combo",
    "price": "13000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/5.png",
    "name": "Banana & strawberry combo",
    "price": "10000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/7.png",
    "name": "Fruits & vegetables combo",
    "price": "4000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/8.png",
    "name": "Dry fruits combo",
    "price": "18000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/9.png",
    "name": "Juice fruits combo",
    "price": "15000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/10.png",
    "name": "Fruits Basket",
    "price": "20000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/11.png",
    "name": "Kiwi & A pinapple combo",
    "price": "8000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/12.png",
    "name": "Multi Friuts",
    "price": "25000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/13.png",
    "name": "Multi Coctails",
    "price": "17000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/14.png",
    "name": "Multifruits salad combo",
    "price": "15000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/15.png",
    "name": "Honey fruits combo",
    "price": "10000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/16.png",
    "name": "Fruits ice-creame",
    "price": "6000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/17.png",
    "name": "Multifruits salad combo",
    "price": "15000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/18.png",
    "name": "Fruits smuzzi",
    "price": "20000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/19.png",
    "name": "Honey peach combo",
    "price": "7000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/20.png",
    "name": "A pinapple & apple combo",
    "price": "10000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/21.png",
    "name": "Aapple salad combo",
    "price": "5000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/22.png",
    "name": "Honey Fruits combo",
    "price": "25000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/23.png",
    "name": "Watermelon & fruits combo",
    "price": "8000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/24.png",
    "name": "Strawberry yogurt",
    "price": "6000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/25.png",
    "name": "Black current & Mint combo",
    "price": "9000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/26.png",
    "name": "Apple & current combo",
    "price": "9000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/27.png",
    "name": "Lemon salad combo",
    "price": "5000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/29.png",
    "name": "Nice fruits combo",
    "price": "12000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/30.png",
    "name": "Tropic fruits combo",
    "price": "40000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/31.png",
    "name": "Beatiful fruits combo",
    "price": "30000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/32.png",
    "name": "Tropic fruits juice",
    "price": "15000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/33.png",
    "name": "Fruits salad combo",
    "price": "30000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/34.png",
    "name": "Mini fruits combo",
    "price": "10000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/35.png",
    "name": "Greyfruit salad combo",
    "price": "20000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/36.png",
    "name": "Fruits Yogurt",
    "price": "7000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/37.png",
    "name": "Tropic Fruits Yogurt",
    "price": "25000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/39.png",
    "name": "Cubik-rubik combo",
    "price": "50000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/40.png",
    "name": "Fruits Cake",
    "price": "18000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/41.png",
    "name": "Orange & Kiwi combo",
    "price": "12000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/42.png",
    "name": "Life Salad combo",
    "price": "45000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/43.png",
    "name": "Life Tropic combo",
    "price": "15000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/44.png",
    "name": "Pomegranate & Kiwi combo",
    "price": "25000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/45.png",
    "name": "Strawberry cake",
    "price": "8000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/46.png",
    "name": "Tropic Life combo",
    "price": "40000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/47.png",
    "name": "Grape & fruits combo",
    "price": "10000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/48.png",
    "name": "Tropic salad combo",
    "price": "20000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/49.png",
    "name": "Fruits and vegatables",
    "price": "15000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/51.png",
    "name": "Palm fruits combo",
    "price": "5000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
];

List recommendations = [
  {
    "img": "assets/db_images/9.png",
    "name": "Juice fruits combo",
    "price": "15000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/48.png",
    "name": "Tropic salad combo",
    "price": "20000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/43.png",
    "name": "Life Tropic combo",
    "price": "15000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/23.png",
    "name": "Watermelon & fruits combo",
    "price": "8000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/35.png",
    "name": "Greyfruit salad combo",
    "price": "20000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/14.png",
    "name": "Multifruits salad combo",
    "price": "15000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/6.png",
    "name": "Greek salad combo",
    "price": "10000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/34.png",
    "name": "Mini fruits combo",
    "price": "10000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    "img": "assets/db_images/24.png",
    "name": "Strawberry yogurt",
    "price": "6000",
    "count": 1,
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
];
