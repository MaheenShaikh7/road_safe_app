let app = require('express')()
var bodyParser = require('body-parser')
let bb = require('express-busboy');
bb.extend(app);
app.post("/",(req,res)=>{
    console.log(req.files);
    res.send("2")
    res.end()
    console.log("asd")
})

app.listen(5000)