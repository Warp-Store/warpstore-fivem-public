module.exports = {
    config: {
        /* 
            Token obtida em: https://warpstore.app/dashboard/integration
        */
        token: '',
        /*
            Lista de comandos, chave e valor, altere apenas o valor.
        */
        commands: {
            /*
                Comando para ver as compras do jogador
            */
            vip: 'vip'
        },
        /*
           Exibe um card em seu chat sobre os detalhes da compra do usuário
        */
        chat: {
            enabled: true, // true = ativo, false = desativado.
            global: true, // Se o valor tiver ativo todos os jogadores verão a mensagem de forma global.
            content: ':name comprou :product em nossa loja!', // Conteudo da mensagem apareçida. {name}: nome do jogador, {product}: nome do produto.
            style: [
                "font-size: 16px",
                "display: flex",
                "align-items: center",
                "padding: 0.7vw",
                "background-image: linear-gradient(to right, #00dc82 3%, rgba(0, 0, 0,0) 95%)",
                "border-radius: 5px",
            ]
        },
        /*
           Exibe uma mensagem bem bonita na tela do usuário/usuários, parabenizando pela sua compra.
        */
        nui: {
            enabled: true, // true = ativo, false = desativado.
            global: true, // Se o valor tiver ativo todos os jogadores verão a mensagem de forma global.
            content: {
                title: '💗 Nova Doação', // Título da mensagem exemplo: Nova Doação
                subTitle: ':name acabou de comprar o :product e contribuiu com o servidor!' // Conteudo.
            },
            cooldown: 10000 // O tempo total que a mensagem ficará na tela do usuário, tempo definido em (ms) 1000 = (1) segundo
        },
        /*
            Usamos o debug para reportar erros de entrega por exemplo: O usuário X já possui o veículo X
        */
        debug: true // true = ativo, false = desativado.
    }
}