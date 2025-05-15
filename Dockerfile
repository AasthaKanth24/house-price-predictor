FROM python:3.11-slim
# the base os that the container will use

WORKDIR /app
# the working dir is where the docjer image will be created

COPY src/api/ .
# the file contains the frontend of the code which needs to be published and it will get copied to the app (working directory)

RUN pip install -r requirements.txt
COPY models/trained/*.pkl models/trained/
EXPOSE 8000
CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000" ]