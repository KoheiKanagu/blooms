export interface ProcessImagesRequest {
  images: [{
    base64: string;
  }];
}

export interface ProcessImagesResponse {
  images: [{
    gsPath: string;
    blurHash: string;
    width: number;
    height: number;
    mimeType: string;
  }];
}
