
# Use uma imagem oficial do Python como imagem pai.
# A imagem 'alpine' é usada para manter o tamanho final pequeno.
FROM python:3.13.5-alpine3.22

# Define variáveis de ambiente para boas práticas em Python com Docker
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta em que o aplicativo é executado
EXPOSE 8000

# Define o comando para executar a aplicação quando o contêiner for iniciado
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
