## Component Hierarchy

**App**
 - NavBar
 - Routes
 - Footer

**SessionFormContainer**
 - AuthForm

**ItemIndexContainer**
 - ItemIndex

**ItemDetailContainer**
 - ItemDetail
 - Reviews

**SearchResultsContainer**
 - Search
 - ItemIndex

**CartContainer**
 - Cart
   - CartItems

**PurchaseSuccess**

## Routes

|Path   | Component   |
|-------|-------------|
| "/" | "ItemIndexContainer" |
| "/sign-up" | "AuthFormContainer" |
| "/sign-in" | "AuthFormContainer" |
| "/items/:itemId" | "ItemDetailContainer" |
| "/items/search-results" | "SearchResultsContainer"
| "/cart" | "CartContainer" |
| "/purchase-success" | "PurchaseSuccess" |
