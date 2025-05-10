import 'dart:convert';

class Restaurant {
  final String name;
  final String description;
  final String menuItem;
  final String price;
  final String imageLink;

  Restaurant({
    required this.name,
    required this.description,
    required this.menuItem,
    required this.price,
    required this.imageLink,
  });

  // Optionally add a factory constructor for creating an instance from a map (useful for JSON parsing)
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'],
      description: json['description'],
      menuItem: json['menu_item'],
      price: json['price'],
      imageLink: json['image_link'],
    );
  }

  // Method to convert the restaurant instance back to a map (useful for JSON encoding)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'menu_item': menuItem,
      'price': price,
      'image_link': imageLink,
    };
  }
}

String jsonString = '''
  [
    {
        "name": "The Italian Bistro",
        "description": "Authentic Italian cuisine with a modern twist.",
        "menu_item": "Spaghetti Carbonara",
        "price": "\$12.99",
        "image_link": "https://static01.nyt.com/images/2021/02/14/dining/carbonara-horizontal/carbonara-horizontal-threeByTwoMediumAt2X-v2.jpg"
    },
    {
        "name": "Sushi House",
        "description": "Fresh sushi and Japanese delicacies.",
        "menu_item": "California Roll",
        "price": "\$8.50",
        "image_link": "https://vaya.in/recipes/wp-content/uploads/2019/01/California-Roll.jpg"
    },
    {
        "name": "Curry Corner",
        "description": "Traditional Indian curries and tandoori specials.",
        "menu_item": "Butter Chicken",
        "price": "\$10.50",
        "image_link": "https://img.taste.com.au/qDjJh8W8/taste/2016/11/butter-chicken-101831-1.jpeg"
    },
    {
        "name": "Burger Joint",
        "description": "Gourmet burgers and craft beers.",
        "menu_item": "Cheeseburger Deluxe",
        "price": "\$9.99",
        "image_link": "https://www.tysonfoodservice.com/adobe/dynamicmedia/deliver/dm-aid--92a52f1f-9d97-4118-93d0-a54d82e85a68/deluxe-cheeseburger-pickles-onion-pub-burger-137353-768x522.jpg?quality=75&preferwebp=true&width=1200"
    },
    {
        "name": "Veggie Delight",
        "description": "Innovative vegetarian and vegan dishes.",
        "menu_item": "Vegan Lasagna",
        "price": "\$11.00",
        "image_link": "https://www.crazyvegankitchen.com/wp-content/uploads/2022/12/vegan-lasagna-recipe.jpg"
    },
    {
        "name": "Steak House",
        "description": "Premium cuts and fine wines.",
        "menu_item": "Ribeye Steak",
        "price": "\$25.99",
        "image_link": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiJ1SQD_NtJ6I2GYLE72ejj0x-zTf8Klt7nTuSeWvPD74u2TCbo6o5IDl7ZNnEFYWBIEc&usqp=CAU"
    },
    {
        "name": "Mexican Fiesta",
        "description": "Colorful Mexican cuisine in a lively atmosphere.",
        "menu_item": "Tacos Al Pastor",
        "price": "\$7.99",
        "image_link": "https://iamafoodblog.b-cdn.net/wp-content/uploads/2021/05/al-pastor-3507w.jpg"
    },
    {
        "name": "Chinese Garden",
        "description": "Authentic Chinese flavors from various regions.",
        "menu_item": "Kung Pao Chicken",
        "price": "\$8.99",
        "image_link": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPEtCGssIf9TVJ9NtEMV0Cqwuy_1KxjqA32jhGvkzfgiaK3Hdk6v2ROZAeEJEJgK3bHPo&usqp=CAU"
    },
    {
        "name": "French Café",
        "description": "Elegant French desserts and pastries.",
        "menu_item": "Crème Brûlée",
        "price": "\$6.50",
        "image_link": "https://www.onceuponachef.com/images/2023/02/Creme-brulee-1-1200x814.jpg"
    },
    {
        "name": "Middle Eastern Delights",
        "description": "Exotic flavors from the Middle East.",
        "menu_item": "Falafel Wrap",
        "price": "\$5.99",
        "image_link": "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/falafel_0-1b60eb7.jpg?quality=90&resize=440,400"
    }
]
  ''';
var jsonResponse = json.decode(jsonString) as List;
