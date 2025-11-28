var database = require("../database/config");

function registrar(usuario_id, distancia, dia_semana) {
    var instrucao = `
        INSERT INTO treino (usuario_id, distancia, dia_semana, data_registro)
        VALUES (${usuario_id}, ${distancia}, '${dia_semana}', NOW());
    `;
    return database.executar(instrucao);
}

function listar(usuario_id) {
    var instrucao = `
        SELECT id, usuario_id, dia_semana, distancia, DATE_FORMAT(data_registro, '%d/%m/%Y %H:%i') AS data_registro
        FROM treino
        WHERE usuario_id = ${usuario_id}
        ORDER BY data_registro DESC;
    `;
    return database.executar(instrucao);
}

module.exports = {
    registrar,
    listar
};
