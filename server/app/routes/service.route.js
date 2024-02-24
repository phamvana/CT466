const express = require("express");
const services = require("../controllers/services.controller");

const router = express.Router();

router.route("/")
    .get(services.findAll)
    .post(services.create)
    .delete(services.deleteAll);

router.route("/favorite")
    .get(services.findAllFavorite);

router.route("/:id")
    .get(services.findOne)
    .put(services.update)
    .delete(services.delete);

module.exports = router;