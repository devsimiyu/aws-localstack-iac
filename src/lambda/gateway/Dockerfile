FROM public.ecr.aws/lambda/nodejs:14
WORKDIR ${LAMBDA_TASK_ROOT}
COPY package*.json ./
RUN npm ci
COPY . ./
RUN npm run build
CMD ["dist/main.handler"]
