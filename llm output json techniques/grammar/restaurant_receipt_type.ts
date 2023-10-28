interface RestaurantReceipt {
    restaurant: Restaurant;
    customer: Customer;
    order_date: string;
    total_price: number;
    tax_rate: number;
    tax_amount: number;
    discount_code: string;
    payment_method: string;
    card_type: string;
    card_number: string;
    expiration_month: number;
    expiration_year: number;
    cvv: string;
    shipping_address: string;
    items: Item[];
  }
   
  interface Restaurant {
    name: string;
    location: Location;
    year: number;
    phone_number: string;  
    email:string;  
  }
  
  interface Customer {
    first_name: string;
    last_name: string;
    email:string;
    phone_number: string;
  }
  
  interface Location {
    address: string;
    city: string;
    state: string;
    country: string;
  }
  
  interface Item {
    item_name: string;
    quantity: number;
    unit_price: number;
    description: string;
    item_total: number;
  }
  