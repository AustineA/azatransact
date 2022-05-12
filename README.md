## Ruby version

`3.1.2`

## Database creation

First install **PostgreSQL** to your machine
run `rails db:create` to create db, followed by `rails db:migrate` to migrate all tables

## How to run the test suite

`bundle exec rspec` to run all tests

## Services (job queues, cache servers, search engines, etc.)

**CurrencyConverter**
For converting input amount to output currency value

**TokenDecoder**
For decoding JWT

**TokenGenerator**
For generating JWT

# Endpoints

## Transactions:

### POST: `/transactions`

For creating new transactions

**Body:**

```javascript
{
	"transaction" : {
		"input_amount": 120000,
		"input_currency": "NGN",
		"output_currency": "USD"
	}
}
```

`output_amount` is optional. If given the action will skip calling the external currency converter API and simply record give value to the database.

**Header:**

```javascript
{ "Authorization" => "Bearer #JWTtoken" }
```

### GET: `/transactions/`

list all transactions in the system

### GET: `/transactions/:id`

get the specific transaction by ID

## Users:

### POST: `/users`

Register a new user

**Body:**

```javascript
{
	"user": {
		"email": "austine.amah@gmail.com",
		"password": "123456",
    "first_name": "Austine",
    "last_name": "Amah"
	}
}
```

`first_name` and `last_name` are optional

### POST: `/user_token`

Login user

**Body:**

```javascript
{
	"auth": {
		"email": "austine.amah@gmail.com",
		"password": "123456"
	}
}
```
