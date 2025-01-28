# Rust API Project with Actix, Serde, Diesel, and PostgreSQL

This is a practice project for building a Rust API using Actix web framework, Serde for serialization/deserialization, Diesel for database interaction, and PostgreSQL as the database.

## Prerequisites

Make sure you have the following installed before running the project:

- [Rust](https://www.rust-lang.org/tools/install)
- [PostgreSQL](https://www.postgresql.org/download/)

## Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/deepakpyt/test-api-rust.git
   ```
2. Navigate to the project directory:

  ```bash
  cd test-api-rust
  ```
3. Build the project using cargo:
  
  ```bash
  cargo build --release
  ```
4. Run the database migrations (you will need to install diesel_cli first):
  
  ```bash
  diesel migration run
  ```
5. Start the server:

  ```bash
  cargo run
  ```

## Project Structure

```graphql
src/
|-- main.rs         # Application entry point
|-- models/         # Database models
|-- routes/         # API routes and handlers
|-- schema.rs       # Generated by Diesel, represents the database schema
|-- db.rs           # Database initialization and connection
|-- .env.example    # Example environment file
|-- diesel.toml     # Diesel configuration file
```

## API Endpoints

    + `GET /tweets`: Get all tweets.
    + `GET /tweets/{id}`: Get a tweet by ID.
    + `POST /tweets`: Create a new tweet.
    + `DELETE /tweets/{id}`: Delete a tweet by ID.
    + `GET /tweets/{id}/likes`: Get likes on a tweet by ID.
    + `POST /tweets/{id}/like`: Like a tweet by ID.
    + `DELETE /tweets/{id}/like`: Unlike a tweet by ID.

```vbnet
Feel free to use and modify this template according to your project's needs.
If you have any questions or suggestions, please let me know!</s>
```

## Deployed on Docker

```bash
docker compose up --build
```
The APIs will be exposed to port 9090