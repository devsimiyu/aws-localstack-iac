import { SQSEvent } from 'aws-lambda';
import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {

  public async handleWebhook(event: SQSEvent): Promise<void> {
    console.log('PROCORE SQS event payload', event);
  }
}
