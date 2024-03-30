const customCommands = {}

customCommands["giveItem"] = async function (args) {
    // Pegando o ID do comprador de string e convertendo para número.
    const userId = parseInt(args[0]);

    // Aqui você pega os argumentos que quiser, por exemplo o item que está na posição 1 depois do id do usuário.
    const item = args[1];

    console.log(userId, item);
}

module.exports = {
    customCommands
}