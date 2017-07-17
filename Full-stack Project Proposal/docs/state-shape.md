```js
{
  session: {
    id: 1,
    username: "demo_user",
    errors: ["User name can't be blank."]
  },
  
  items: {
    byId: {
      1: {
        id: 1,
        title: "Ziplite 2.0 20-inch Spinner Luggage",
        producer: "Samsonite",
        price: 50,
        description: "staple",
        category: "luggage"
      },
      // ...
    },
    byCategory: {
      luggage: [1],
      // ...
    }
    byPrice: [1, 5, 2],
    filtered: []
  },
  
  cart: {
    cartId: 1,
    cartItems: {
      1: {
	     itemId: 1,
	     itemQuantity: 2
	   },
	   // ...
	 }
  },
  
  reviews: {
    1: {
      id: 1,
      username: 'personx',
      body: "Strongly recommend!",
      stars: 5
    }
  }
  
}
```
