const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Endpoint de teste para verificar a conexão
app.get('/health', (req, res) => {
  res.status(200).json({ message: 'API está funcionando!' });
});

// Inicia o servidor somente se o arquivo for executado diretamente
if (require.main === module) {
  const PORT = process.env.PORT || 3000;
  app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
  });
}

// Exporta o app para uso em testes
module.exports = app;
