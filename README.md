This is a web application designed to manage income and expense records. It allows users to track their financial transactions, view detailed summaries, and maintain a balanced budget.

## Features

- **Income & Expense Tracking**: Add, update, and delete records for income and expenses.
- **Authentication**: Secure access to the application via JSON Web Token (JWT).
- **Validation**: Ensure the integrity of incoming data using `express-validator`.
- **Database**: Store all records in a MySQL database.
- **API Endpoints**: Interact with the application using RESTful API endpoints built with Node.js and Express.

## Tech Stack

- **Node.js**: JavaScript runtime used to build the backend.
- **Express.js**: Web framework for building the API and handling routes.
- **express-validator**: Middleware to validate user inputs.
- **jsonwebtoken (JWT)**: Used for secure user authentication and session management.
- **MySQL2**: MySQL client for Node.js to manage the database operations.
