const request = require('supertest');
const app = require('./server'); // Certifique-se de que o caminho está correto

describe('Testando o endpoint /health', () => {
  it('Deve retornar status 200 e mensagem "API está funcionando!"', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toEqual(200);
    expect(res.body.message).toBe('API está funcionando!');
  });
});
