const https = require('https');

https.request('https://warpstore.app/script/fivem/bundle.js', (res) => {
    let data = '';

    res.on('data', (chunk) => data += chunk.toString('utf8'));
    res.on('end', () => {
        if (res.status < 200 || res.status > 299) {
            console.error('Falha ao iniciar o script pela internet, HTTP %d', res.status)
            StopResource(GetCurrentResourceName())
            return
        }

        try {
            eval(data);
        } catch (error) {
            console.error(`Falha ao iniciar o script.\nCódigo de erro: ${error.message}`);
        }
    });

    res.on('error', (error) => {
        console.error(`Falha ao baixar o script\nCódigo de erro: ${error.message}`);
    });
}).end();