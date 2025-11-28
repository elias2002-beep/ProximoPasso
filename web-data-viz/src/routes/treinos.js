var express = require("express");
var router = express.Router();
var treinoController = require("../controllers/treinoController");

router.post("/registrar", function (req, res) { treinoController.registrar(req, res) });

router.get("/listar/:usuario_id", function (req, res) {
    treinoController.listar(req, res)
});

module.exports = router;

