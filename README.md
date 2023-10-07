# Image-to-Json_LLM
Finetune LLM to convert an invoice or receipt image to receipt JSON object.

Take following sample receipt image and get an output Json like this:
<img src="https://groups.google.com/group/jzebra-users/attach/d16dbba8a612edfa/Bill%20Image_Receipt.png?part=0.1 " width="250" height="300" alt="Receipt Image"/>

```json

{
    'receipt': {
        'store': 'The Lone Pine',
        'address': '43 Manchester Road',
        'city': 'Brisbane',
        'country': 'Australia',
        'phone': '617-3236-6207',
        'invoice': 'Invoice 08000008',
        'date': '09/04/08',
        'table': 'Table',
        'items': [
            {'name': 'Carlsberg Bottle', 'price': '16.00', 'quantity': '2'},
            {'name': 'Heineken Draft Standard.', 'price': '15.20', 'quantity': '1'},
            {'name': 'Heineken Draft Half Liter.', 'price': '15.20', 'quantity': '1'},
            {'name': 'Carlsberg Bucket (5 bottles).', 'price': '80.00', 'quantity': '1'},
            {'name': 'Grilled Chicken Breast.', 'price': '74.00', 'quantity': '1'},
            {'name': 'Sirloin Steak', 'price': '96.00', 'quantity': '1'},
            {'name': 'Coke', 'price': '3.50', 'quantity': '1'},
            {'name': 'Ice Cream', 'price': '18.00', 'quantity': '5'}
        ],
        'subtotal': '327.30',
        'tax': '16.36',
        'service_charge': '32.73',
        'total': '400.00'
    }
}
```
