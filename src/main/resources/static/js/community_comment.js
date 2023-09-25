var express = require("express");
var mysql = require("mysql");
var app = express();
app.use(express.json);

const con = mysql.createConnection({
    host: 'localhost', 
    user: 'yojulab',
    password: '!yojulab*',
    database: 'project_TAB'
})

con.connect((err) => {
    if(err) {
        console.log(err)
    } else {
        console.log("connected successfully")
    }
})

app.post('/post', (req,res) => {
    const comment = req.body.comment;
    const comment_date = req.body.comment_date;
    const post_id = req.body.post_id;
    const comment_id = req.body.comment_id;

    con.query('insert into community_comment values(?,?,?,?)', [comment, comment_date, post_id, comment_id], (err, result) => {
        if(err) {
            console.log(err)
        } else {
            res.send("POSTED")
        }
    })
})

app.listen(8080, (err) => {
    if(err) {
        console.log(err)
    } else {
        res.send("on port 8080")
    }
})



const form = document.querySelector("#newComment");
const commentsContainer = document.querySelector("#comments");
form.addEventListener("submit", function(e) {
    e.preventDefault();
    const commentInput = form.elements.comment.value;
    addComment(commentInput);
    commentInput.value = "";
})

const addComment = (comment) => {
    const newComment = document.createElement("li");
    const bTag = document.createElement("b");
    newComment.append(bTag);
    newComment.append(`${comment}`);
    console.log(newComment);
    commentsContainer.append(newComment);
};
