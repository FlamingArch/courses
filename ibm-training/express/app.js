import express from "express";
import productRoutes from "./routes/product.js";

// Create an Express App
const app = express();

// App Middlewares
app.use(express.json());
app.use("/ibm", productRoutes);

// Serve the App
app.listen(9999, () => {
  console.log("Server Started on port 9999: http://localhost:9999");
});
