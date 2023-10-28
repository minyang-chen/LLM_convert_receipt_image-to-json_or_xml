medium link: https://medium.com/@mychen76/finetune-llm-to-convert-a-receipt-image-to-json-or-xml-3f9a6237e991

### Setup
Finetune LLM to convert an invoice or receipt image to receipt JSON object.
```
# !pip install huggingface_hub
# from huggingface_hub import notebook_login
# notebook_login()

## installs if required
# !pip install -q -U bitsandbytes
# !pip install -q -U git+https://github.com/huggingface/transformers.git
# !pip install -q -U git+https://github.com/huggingface/accelerate.git
# !pip install -q -U einops
# !pip install -q -U safetensors
# !pip install -q -U torch
# !pip install -q -U xformers
# !pip install scipy
```

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
} ```

# Invoice or Receipt Image-to-Strucuture data (XML or Json) 
Finetune LLM to convert an invoice or receipt image to receipt XML or JSON object.


*JSON OUTPUT*
```json
{
    'header': {
        'invoice_no': '13194726',
        'invoice_date': '05/29/2021',
        'seller': 'Hopkins and Sons 62283 Flores Tunnel North Luis, IA 69983',
        'client': 'Sims PLC USS Kramer FPO AA 81651',
        'seller_tax_id': '952-73-7223',
        'client_tax_id': '995-88-9495',
        'iban': 'GB31LZX520242755934691'
    },
    'items': [
        {
            'item_desc': 'Beach Lunch Lounge Striped Shirt Dress Large Navy Blue White Long Sleeve Casual',
            'item_qty': '1,00',
            'item_net_price': '16,99',
            'item_net_worth': '16,99',
            'item_vat': '10%',
            'item_gross_worth': '18,69'
        },
        {
            'item_desc': 'Jams World Hawaiian 0 Dress Rayon SZ.L',
            'item_qty': '5,00',
            'item_net_price': '65,00',
            'item_net_worth': '325,00',
            'item_vat': '10%',
            'item_gross_worth': '357,50'
        },
        {
            'item_desc': 'LuLaRoe Nicole Dress Size Large 26',
            'item_qty': '2,00',
            'item_net_price': '1,99',
            'item_net_worth': '3,98',
            'item_vat': '10%',
            'item_gross_worth': '4,38'
        },
        {
            'item_desc': 'phynny Was Medium Linen Wrap Dress Dessert Rose Embroidered Bohemian',
            'item_qty': '2,00',
            'item_net_price': '89,99',
            'item_net_worth': '179,98',
            'item_vat': '10%',
            'item_gross_worth': '197,98'
        },
        {
            'item_desc': "Eileen Fisher Women's Long Sleeve Fleece Lined Front Pockets Dress XS Gray",
            'item_qty': '2,00',
            'item_net_price': '15,99',
            'item_net_worth': '31,98',
            'item_vat': '10%',
            'item_gross_worth': '35,18'
        },
        {
            'item_desc': "Hanna Anderson Women's L Large Coral Short Sleeve Casual Fall Tee Shirt Dress",
            'item_qty': '1,00',
            'item_net_price': '24,00',
            'item_net_worth': '24,00',
            'item_vat': '10%',
            'item_gross_worth': '26,40'
        }
    ],
    'summary': {'total_net_worth': '$581,93', 'total_vat': '$58,19', 'total_gross_worth': '$ 640,12'}
}```

*XML OUTPUT*
```xml
<s_header>
    <s_invoice_no> 13194726</s_invoice_no>
    <s_invoice_date> 05/29/2021</s_invoice_date>
    <s_seller> Hopkins and 
    Sons 62283 Flores Tunnel North Luis, IA 69983</s_seller>
    <s_client> Sims PLC USS Kramer FPO AA 
    81651</s_client>
    <s_seller_tax_id> 952-73-7223</s_seller_tax_id>
    <s_client_tax_id> 
    995-88-9495</s_client_tax_id>
    <s_iban> GB31LZX520242755934691</s_iban>
</s_header>
<s_items>
    <s_item_desc> Beach Lunch 
    Lounge Striped Shirt Dress Large Navy Blue White Long Sleeve Casual</s_item_desc>
    <s_item_qty> 
    1,00</s_item_qty>
    <s_item_net_price> 16,99</s_item_net_price>
    <s_item_net_worth> 16,99</s_item_net_worth>
    <s_item_vat>
    10%</s_item_vat>
    <s_item_gross_worth> 18,69</s_item_gross_worth>
    <sep/>
    <s_item_desc> Jams World Hawaiian 0 Dress 
    Rayon SZ.L</s_item_desc>
    <s_item_qty> 5,00</s_item_qty>
    <s_item_net_price> 65,00</s_item_net_price>
    <s_item_net_worth>
    325,00</s_item_net_worth>
    <s_item_vat> 10%</s_item_vat>
    <s_item_gross_worth> 
    357,50</s_item_gross_worth>
    <sep/>
    <s_item_desc> LuLaRoe Nicole Dress Size Large 26</s_item_desc>
    <s_item_qty> 
    2,00</s_item_qty>
    <s_item_net_price> 1,99</s_item_net_price>
    <s_item_net_worth> 3,98</s_item_net_worth>
    <s_item_vat> 
    10%</s_item_vat>
    <s_item_gross_worth> 4,38</s_item_gross_worth>
    <sep/>
    <s_item_desc> phynny Was Medium Linen Wrap 
    Dress Dessert Rose Embroidered Bohemian</s_item_desc>
    <s_item_qty> 2,00</s_item_qty>
    <s_item_net_price> 
    89,99</s_item_net_price>
    <s_item_net_worth> 179,98</s_item_net_worth>
    <s_item_vat> 
    10%</s_item_vat>
    <s_item_gross_worth> 197,98</s_item_gross_worth>
    <sep/>
    <s_item_desc> Eileen Fisher Women's Long 
    Sleeve Fleece Lined Front Pockets Dress XS Gray</s_item_desc>
    <s_item_qty> 2,00</s_item_qty>
    <s_item_net_price> 
    15,99</s_item_net_price>
    <s_item_net_worth> 31,98</s_item_net_worth>
    <s_item_vat> 
    10%</s_item_vat>
    <s_item_gross_worth> 35,18</s_item_gross_worth>
    <sep/>
    <s_item_desc> Hanna Anderson Women's L Large 
    Coral Short Sleeve Casual Fall Tee Shirt Dress</s_item_desc>
    <s_item_qty> 1,00</s_item_qty>
    <s_item_net_price> 
    24,00</s_item_net_price>
    <s_item_net_worth> 24,00</s_item_net_worth>
    <s_item_vat> 
    10%</s_item_vat>
    <s_item_gross_worth> 26,40</s_item_gross_worth>
</s_items>
<s_summary>
    <s_total_net_worth> 
    $581,93</s_total_net_worth>
    <s_total_vat> $58,19</s_total_vat>
    <s_total_gross_worth> $ 
    640,12</s_total_gross_worth>
</s_summary>
```
