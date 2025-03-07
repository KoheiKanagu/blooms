import { ResponseSchema } from '@google-cloud/vertexai';

export interface MyResponseSchema extends ResponseSchema {
  propertyOrdering: string[];
};
