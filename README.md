## Atividade PICK 2024 - linuxtips.io

### Segundo desafio prático

Este repositório contém as instruções para realizar o segundo desafio prático da Atividade PICK 2024 hospedada em linuxtips.io.

### Passos:
1. **Buildar a imagem:**
   ```bash
   docker build -t vandervieira/linuxtips-giropops-senhas:1.0 .
   ```

2. **Criar Rede:**
   ```bash
   docker network create giropops_network
   ```

3. **Subir Redis:**
```bash
docker run -d --name redis-giropops --network giropops_network redis:7.2.4
```

3. **Subir Giropops-senhas:
```bash
docker run -d --name giropops-senhas -p 80:5000 --network giropops_network -e REDIS_HOST=redis-giropops vandervieira/linuxtips-giropops-senhas:1.0
```

### Imagem no Docker Hub

A imagem Docker vandervieira/linuxtips-giropops-senhas:1.0 pode ser encontrada no Docker Hub [vandervieira/linuxtips-giropops-senhas](https://hub.docker.com/r/vandervieira/linuxtips-giropops-senhas)
