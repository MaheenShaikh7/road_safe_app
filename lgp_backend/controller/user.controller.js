const {response} = require('../app');
const UserService = require('../services/user.services');

exports.register = async(req,res,next) => {
    try{
        const {email,password} = req.body;
        const successRes = await UserService.registerUser(email, password);

        res.json({status:true, success: "User Registered Successfully"});
    }
    catch(error){
        throw error
    }
}

exports.login = async(req,res,next) => {
    try{
        const {email,password} = req.body;
        // console.log("1st step")
        const user =await UserService.checkuser(email);
        // console.log("2st step",user)

        if (!user){
            // throw new Error('User does not exist');
            res.json({msg:"user does not exist"})
            return;
        }

        const isMatch =await user.comparePassword(password);
        if (isMatch == false){
            res.json({msg:"password is invalid"})
            return;
            // throw new Error('Password is invalid.'); 
        }

        let tokenData = {_id: user._id,email: user.email};  

        const token = await UserService.generateToken(tokenData,"secretkey",'1h' )

        res.status(200).json({status:true, token:token})
         
    }
    catch(error){
        throw error
    }
}