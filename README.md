# SAEP_pratica
Pequeno sistema que simula pátio de automóveis para venda 


# Como iniciar o Frontend da aplicação

- Primeiro abra o terminal e execute o comando `cd front` após isso instale as depedências do projeto executando
o comando `npm install` e por fim após a intalação das depedências execute o comando `npm run dev`, isso iniciará
o servidor do frontend da aplicação.

# Como iniciar o Backend da aplicação

- Após fazer a incialização do front, você devera iniciar o servidor do seu banco de dados e alterar o valores
das variáveis de ambientes encontrada no arquivo `server.js`

```
  Configurações das variaveis de ambiente do banco de dados
  host: 'host do banco',
  user: 'seu usuário do banco',
  password: 'sua senha do banco (se não tiver pode deixar vazio)',
  database: 'nome do seu banco',
  port: 'porta do seu banco'
```
- Após a configuração das variaveis de ambiente, você abrirá outra aba no terminal e executará o comando `cd api`, após isso execute o 
comando `npm install` para intalar as depêndecias da api e por fim execute o comando `node server.js` para iniciar o servidor.


