## tool
## https://grammar.intrinsiclabs.ai/

cd /mnt/datadisk/llm/framework/llama.cpp

## llama2-7b-chat
./main -m /mnt/datadisk/llm/models/ggml-model-q5_0.gguf -n 1280 --grammar-file grammars/receipt/restaurant_receipt.gbnf -p 'describe sample restaurant receipt' --n-gpu-layers 30

## mistral-7b 
./main -m /mnt/datadisk/llm/models/Mistral-7B-v0.1-instruct-q5_0.gguf -n 1280 --n-gpu-layers 35 --grammar-file grammars/receipt/restaurant_receipt.gbnf -p 'describe a sample car owner, audio features and safety features'

## output
{"restaurant":{
        "name":"Burger King",
        "location":{
            "address":"150 Broadway",
            "city":"New York",
            "state":"NY",
            "country":"US"},
        "year":2019,
        "phone_number": "646-337-1841",
        "email": "[support@burgerking.com](mailto:support@burgerking.com)"},"customer":{
    "first_name":"John",
    "last_name":"Doe",
    "email": "[johndoe@gmail.com](mailto:johndoe@gmail.com)",
    "phone_number": "555-1234"},"order_date": "2021-08-20T16:55:37Z","total_price": 10.99,
    "tax_rate": 0.0825,"tax_amount": 0.9143,"discount_code":"KINGMEAT","payment_method": "Credit card",
        "card_type": "Visa",
        "card_number": "**** **** **** 5555",
        "expiration_month": 12,
        "expiration_year": 2025,
        "cvv": "***","shipping_address": "123 Main St",
        "items": [{"item_name": "Whopper",
            "quantity": 1,
            "unit_price": 4.99,
            "description": "","item_total": 4.99},
        {"item_name": "Fries",
            "quantity": 1,
            "unit_price": 3.99,
            "description": "",
            "item_total": 3.99}
        ]
    }
}

## llama example
{
      "restaurant": {
        "name": "Pizza Palace",
        "location": {
          "address": "123 Main St, Anytown USA",
          "city": "Anytown",
          "state": "CA",
          "country": "USA"},
        "year": 2018,
        "phone_number": "555-555-5555",
        "email": "pizza@palace.com"},
      "customer": {
        "first_name": "John",
        "last_name": "Doe",
        "email": "john@example.com",
        "phone_number": "555-555-1234"},
      "order_date": "2018-02-27T17:30:00-07:00",
      "total_price": 39.99,
      "tax_rate": 10.5,
      "tax_amount": 4.49,
      "discount_code": "NONE",
      "payment_method": "CREDIT_CARD",
      "card_type": "Visa",
      "card_number": "1234-5678-9012-3456",
      "expiration_month": 03,
      "expiration_year": 2020,
      "cvv": "123",
      "shipping_address": "123 Main St, Anytown USA","items": [
        {
          "item_name": "Large Pepperoni Pizza",
          "quantity": 1,
          "unit_price": 14.99,
          "description": "Our signature large pepperoni pizza with melted cheese and fresh toppings.","item_total": 14.99},
        {
          "item_name": "Garlic Knots",
          "quantity": 2,
          "unit_price": 3.99,
          "description": "Freshly baked garlic knots sprinkled with parmesan cheese and herbs.","item_total": 7.98}
        ]
} 
    


