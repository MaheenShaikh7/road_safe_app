const router = require('express').Router();

const ComplaintController = require("../controller/complaint.controller");

router.post('/complaintDetails',ComplaintController.raiseComplaint);

module.exports = router;