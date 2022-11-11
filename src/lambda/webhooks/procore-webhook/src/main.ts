import { Context, SQSHandler, SQSEvent } from 'aws-lambda';
import { NestFactory } from '@nestjs/core';

import { AppModule } from './app.module';
import { AppService } from './app.service';

export const handler: SQSHandler = async (
  event: SQSEvent,
  context: Context): Promise<void> => {
  const app = await NestFactory.createApplicationContext(AppModule);
  const service = app.get(AppService);
  service.handleWebhook(event);
};
