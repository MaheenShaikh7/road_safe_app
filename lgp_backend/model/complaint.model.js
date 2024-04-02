const db = require('../config/db');
const UserModel = require('../model/user.model.js');
const mongoose = require('mongoose');
const { Schema } = mongoose;

const complaintSchema = new Schema({

    userId: {
        type: Schema.Types.ObjectId,
        ref: UserModel.modelName
    },

    email: {
        type: String,
        require: true,
    },

    image: {
        type: String,
        required: true,
    },

    location: {
        type: String,
        // required: true,
    },

    category: {
        type: Array,
        // require: true,
    },

    description: {
        type: String,
        // require: true    
    }

},{timestamps:true});

const ComplaintModel = db.model('complaint',complaintSchema);

module.exports = ComplaintModel;
