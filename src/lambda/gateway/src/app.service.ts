import AWS from 'aws-sdk';
import { Injectable } from '@nestjs/common';

import { Notification } from './app.model';

@Injectable()
export class AppService {

  private readonly notification: AWS.SNS = new AWS.SNS({
    region: process.env.AWS_REGION,
    endpoint: process.env.AWS_ENDPOINT
  });

  async broadcast(event: any): Promise<void> {
    let topic: string;
    switch (event.type) {
      case Notification.PROCORE:
        topic = process.env.AWS_TOPIC_PROCORE;
        break;
      case Notification.INTACCT:
        topic = process.env.AWS_TOPIC_INTACCT;
        break;
      default: {
        throw new Error('Failed to broadcast webhook');
      }
    }
    await this.notification.publish({
      TopicArn: topic,
      Message: event.message
    })
    .promise();
  }
}
