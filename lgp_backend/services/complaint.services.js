const ComplaintModel = require("../model/complaint.model");

class ComplaintServices{

    static async raiseComplaint(userId,image,location,category,description){
        const raiseComplaint = new ComplaintModel({userId,image,location,category,description});
        return await raiseComplaint.save();

    }

}

module.exports = ComplaintServices;
