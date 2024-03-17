const app = require('./app.js');
const db = require('./config/db');
const UserModel = require('./model/user.model.js')

const port = 3000;

app.get('/', (req,res) => {
    res.send("Hello World.")
});

app.listen(port,()=>{
    console.log(`Server listening on http://127.0.0.1:${port}`);
}); 

