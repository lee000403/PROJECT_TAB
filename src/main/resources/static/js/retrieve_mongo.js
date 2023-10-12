const express = require('express');
const MongoClient = require('mongodb').MongoClient;
const app = express();

MongoClient.connect('mongodb://localhost:27017/db_institutions', (err, client) => {
    if (err) throw err;
    const db = client.db('db_institutions');
    const collection = db.collection('db_institutions');

    app.get('/getData', (req, res) => {
        collection.find({}).toArray((err, data) => {
            if (err) throw err;
            res.json(data);
        })
    })
})

app.listen(3000, () => {
    console.log('server is running on port 3000')
})