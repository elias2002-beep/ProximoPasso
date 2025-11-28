var treinoModel = require("../models/treinoModel");

function registrar(req, res) {
    console.log(req.body)
    var usuario_id = req.body.usuario_id;
    var distancia = req.body.distancia;
    var dia_semana = req.body.dia_semana;

    if (usuario_id == undefined) {
        res.status(400).send("O id do usuário está undefined!");
    } else if (distancia == undefined) {
        res.status(400).send("A distância está undefined!");
    } else if (dia_semana == undefined) {
        res.status(400).send("O dia da semana está undefined!");
    } else {

        
        treinoModel.registrar(usuario_id, distancia, dia_semana)
            .then(function (resultado) {
                res.status(201).json(resultado);
            }).catch(function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao registrar o treino! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

function listar(req, res) {
    var usuario_id = req.params.usuario_id;

    if (usuario_id == undefined) {
        res.status(400).send("O id do usuário está undefined!");
    } else {
        treinoModel.listar(usuario_id)
            .then(function (resultado) {
                if (resultado.length > 0) {
                    res.status(200).json(resultado);
                } else {
                    res.status(200).json([]);
                }
            }).catch(function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao buscar os treinos! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

module.exports = {
    registrar,
    listar
};

