# Flutter API

Flutter Api is a responsive app that used a login by a credentials and  a fruit API.

This app use [Getx](https://pub.dev/packages/get) as manager, specific components:

 - GetxController
 - GetxService
 - Rx
 - GetResponsiveView
 - GetConnect
 - GetStorage

## Fruit API
Link API documentation : https://www.fruityvice.com/

Response example:
    
    response = [
    {
    
    "genus": "Malus",
    "name": "Apple",
    "id": 6,
    "family": "Rosaceae",
    "order": "Rosales",
    "nutritions": {
          "carbohydrates": 11.4,
          "protein": 0.3,
          "fat": 0.4,
          "calories": 52,
          "sugar": 10.3
        }
      },
      {
        "genus": "Prunus",
        "name": "Apricot",
        "id": 35,
        "family": "Rosaceae",
        "order": "Rosales",
        "nutritions": {
          "carbohydrates": 3.9,
          "protein": 0.5,
          "fat": 0.1,
          "calories": 15,
          "sugar": 3.2
        }
      },
    ]
