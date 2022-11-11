import * as AWS from 'aws-sdk';
import { Injectable } from '@nestjs/common';

import { Notification } from './app.model';

@Injectable()
export class AppService {

  private readonly notification: AWS.SNS = new AWS.SNS({
    region: process.env.AwsRegion,
    ...(process.env.AwsEnv === 'local' && {endpoint: process.env.AwsEndpoint})
  });

  async broadcast(event: any): Promise<void> {
    console.log('received event', event);
    let topic: string;
    switch (event.type) {
      case Notification.PROCORE:
        topic = process.env.AwsTopicProcore;
        break;
      case Notification.INTACCT:
        topic = process.env.AwsTopicIntacct;
        break;
      default: {
        throw new Error('Failed to broadcast webhook');
      }
    }
    console.log('broadcasting message to', topic);
    await this.notification.publish({
      TopicArn: topic,
      Message: event.message
    })
    .promise();
  }
}
