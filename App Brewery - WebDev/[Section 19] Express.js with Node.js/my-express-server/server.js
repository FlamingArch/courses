const { response } = require('express');
const express = require('express')

// Create an instance of express modules=
const app = express()

// Returns something when a GET request is made to the root
app.get("/", (request, response)=>{
    // console.log('request :>> ', request);
    // console.log('response :>> ', response);
    response.send("<h1>Hello, World!</h1>")
})

app.get("/contact", (req, res)=>{
    res.send("<h1>Contact me at username@example.com</h1>")
})

app.get("/about", (req, res)=>{
    res.send("<h1>The lambs are gonna eat me</h1><h3>(This is a cry for help...)</h3>")
})

app.get("/hobbies", (req, res)=> {
    res.send("Trying how far can I take my coffee addiction.")
})

// Create a server that listens on port 3000
// app.listen(3000);
app.listen(3000, ()=> {
    console.log("Server Started on Port 3000");
})

// Nodemon monitors for changes, and automatically restarts server.