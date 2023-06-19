const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const app = express();
const PORT = 3000;

const connection = mysql.createConnection({
  host: 'containers-us-west-117.railway.app',
  user: 'root',
  password: 'dO8jq7plTuVNzHd3t5KZ',
  database: 'railway',
  port: '5810'
});

app.use(cors());

app.get('/api/alocacao', (req, res) => {
  const query = 'SELECT area, SUM(quantidade) AS total FROM alocacao GROUP BY area';

  connection.query(query, (err, results) => {
    if (err) {
      console.error('Erro ao obter dados da tabela de alocação:', err);
      res.status(500).json({ error: 'Erro ao obter dados da tabela de alocação' });
    } else {
      const setores = results.map(row => ({
        area: row.area,
        cor: row.total > 0 ? 'azul' : 'branco',
      }));

      res.json(setores);
    }
  });
});



app.get('/api/automoveisPorArea/:areaId', (req, res) => {
  const areaId = req.params.areaId;

  const query = `
    SELECT automoveis.*, alocacao.quantidade
    FROM automoveis
    INNER JOIN alocacao ON automoveis.id = alocacao.automovel_id
    WHERE alocacao.area = ${areaId} AND alocacao.quantidade > 0
  `;

  connection.query(query, (error, results) => {
    if (error) {
      console.error('Erro ao obter os automóveis da área:', error);
      res.status(500).json({ error: 'Erro ao obter os automóveis da área.' });
      return;
    }

    res.json(results);
  });
});

app.get('/api/automoveis/:automovelId', (req, res) => {
  const automovelId = req.params.automovelId;

  const query = `
    SELECT * from automoveis where id = ${automovelId}
  `;

  connection.query(query, (error, results) => {
    if (error) {
      console.error('Erro ao obter os automóveis:', error);
      res.status(500).json({ error: 'Erro ao obter os automóveis.' });
      return;
    }

    res.json(results);
  });
});



app.get('/api/clientes', (req, res) => {

  const sqlQuery = 'SELECT * FROM clientes';
  connection.query(sqlQuery, (error, results) => {
    if (error) {
      res.status(500).json({ error: 'Erro ao obter os clientes do banco de dados.' });
    } else {
      res.json(results);
    }
  });
});

app.get('/api/concessionaria/:automovelId', (req, res) => {
  const automovelId = req.params.automovelId;

  const sqlQuery = `
    SELECT concessionaria.* FROM alocacao  
    JOIN concessionaria ON concessionaria.id = alocacao.concessionaria_id
    WHERE alocacao.automovel_id = ?
  `;

  connection.query(sqlQuery, [automovelId], (error, results) => {
    if (error) {
      res.status(500).json({ error: 'Erro ao obter as concessionárias do banco de dados.' });
    } else if (results.length === 0) {
      res.status(404).json({ message: 'Nenhuma concessionária encontrada para o automóvel especificado.' });
    } else {
      res.json(results);
    }
  });
});



app.put('/api/vendas/:automovelId', (req, res) => {
  const automovelId = req.params.automovelId;

  const updateQuery = `UPDATE alocacao SET quantidade = quantidade - 1 WHERE automovel_id = ${automovelId}`;

  connection.query(updateQuery, (error, results) => {
    if (error) {
      console.error('Erro ao atualizar a quantidade do automóvel:', error);
      res.status(500).json({ error: 'Erro ao atualizar a quantidade do automóvel' });
      return;
    }

    res.status(200).json({ message: 'Quantidade do automóvel atualizada com sucesso' });
  });
});

app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
