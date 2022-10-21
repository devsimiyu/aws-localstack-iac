FROM public.ecr.aws/lambda/nodejs:14 AS gateway-lambda
COPY index.js package.json ./
CMD [ "index.handler" ]
