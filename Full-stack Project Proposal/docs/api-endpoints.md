# API Endpoints

## HTML API

### Root

- `GET /` - loads React web app

## JSON API

### Users

- `POST /api/users`

### Session

- `POST /api/session`
- `DELETE /api/session`

### Items

- `GET /api/items`
- `POST /api/items`
- `GET /api/items/:id`
- `PATCH /api/items/:id`
- `DELETE /api/items/:id`

### Reviews

- `GET /api/items/:id/reviews`
- `POST /api/items/:id/reviews`
- `DELETE /api/reviews/:id`
 
### Cart

- `GET /api/cart/:id`
- `POST /api/cart`
- `PATCH /api/cart/:id`
- `DELETE /api/cart/:id/cartitems/:id`
