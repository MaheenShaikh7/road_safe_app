const ComplaintServices = require("../services/complaint.services");

exports.raiseComplaint = async (req,res,next) =>{
    try{
        const {userId,image,location,category,description} = req.body;

        let complaint = await ComplaintServices.raiseComplaint(userId,image,location,category,description);

        res.json({status:true, success:complaint});
    }
    catch(error){
        next(error);
    }
}