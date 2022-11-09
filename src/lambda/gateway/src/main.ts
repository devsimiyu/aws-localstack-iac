import { Context, Handler, APIGatewayProxyEvent } from 'aws-lambda';
import { NestFactory } from '@nestjs/core';

import { AppModule } from './app.module';
import { AppService } from './app.service';

export const handler: Handler = async (
  event: APIGatewayProxyEvent,
  context: Context) => {
  try {
    const app = await NestFactory.createApplicationContext(AppModule);
    const service = app.get(AppService);
    const payload = JSON.parse(event.body);
    service.broadcast(payload);
    return {
      statusCode: 200,
      body: JSON.stringify({
        message: 'success'
      })
    };
  } catch (error) {
    return {
      statusCode: 500,
      body: JSON.stringify({
        message: 'Failed to process request',
        error
      })
    };
  }
};
