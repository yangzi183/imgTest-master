//
//  YZImgTest.m
//  imgCtrl
//
//  Created by apple on 14-11-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "YZImgTest.h"

@implementation YZImgTest

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }

    return self;
}

static CGContextRef CreateRGBBitmapCtx (CGImageRef inImage)
{
    CGContextRef context = NULL;
    CGColorSpaceRef colorSpace;
    void *bitmapData;
    unsigned long bitmapByCount;
    unsigned long bitmapPerRow;
    
    size_t pixWid = CGImageGetWidth(inImage);
    size_t pixHeight = CGImageGetHeight(inImage);
    
    bitmapPerRow = pixWid * 4;
    bitmapByCount = (bitmapPerRow * pixHeight);
    colorSpace = CGColorSpaceCreateDeviceRGB();
    bitmapData = malloc(bitmapByCount);
    context = CGBitmapContextCreate(bitmapData, pixWid, pixHeight, 8, bitmapPerRow, colorSpace, kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);
    return context;
}

static unsigned char *RequestImgData(UIImage *inimage) {
    CGImageRef imgRef = [inimage CGImage];
    CGSize size = [inimage size];
    CGContextRef context = CreateRGBBitmapCtx(imgRef);
    CGRect rect = {{0,0}, {size.width, size.height}};
    CGContextDrawImage(context, rect, imgRef);
    unsigned char *data = CGBitmapContextGetData(context);
    CGContextRelease(context);
    return data;
}

static void changeRGBA(int *red,int *green,int *blue,int *alpha, const float* f){
    int redV=*red;
    int greenV=*green;
    int blueV=*blue;
    int alphaV=*alpha;
    *red=f[0]*redV+f[1]*greenV+f[2]*blueV+f[3]*alphaV+f[4];
    *green=f[0+5]*redV+f[1+5]*greenV+f[2+5]*blueV+f[3+5]*alphaV+f[4+5];
    *blue=f[0+5*2]*redV+f[1+5*2]*greenV+f[2+5*2]*blueV+f[3+5*2]*alphaV+f[4+5*2];
    *alpha=f[0+5*3]*redV+f[1+5*3]*greenV+f[2+5*3]*blueV+f[3+5*3]*alphaV+f[4+5*3];
    if (*red>255) {
        *red=255;
    }
    if(*red<0){
        *red=0;
    }
    if (*green>255) {
        *green=255;
    }
    if (*green<0) {
        *green=0;
    }
    if (*blue>255) {
        *blue=255;
    }
    if (*blue<0) {
        *blue=0;
    }
    if (*alpha>255) {
        *alpha=255;
    }
    if (*alpha<0) {
        *alpha=0;
    }
}

+ (UIImage *)processImg:(UIImage *)inImg withColor:(const float*) f {
    unsigned char *imgPix = RequestImgData(inImg);
    CGImageRef imgRef = [inImg CGImage];
    size_t w = CGImageGetWidth(imgRef);
    size_t h = CGImageGetHeight(imgRef);
    int woff = 0;
    int pixoff = 0;
    
    for (size_t y = 0; y < h; y++) {
        pixoff = woff;
        for (size_t x = 0; x < w; x++) {
            int red = (unsigned char)imgPix[pixoff];
            int green = (unsigned char)imgPix[pixoff + 1];
            int blue = (unsigned char)imgPix[pixoff + 2];
            int alpha = (unsigned char)imgPix[pixoff + 3];
            changeRGBA(&red, &green, &blue, &alpha, f);
            imgPix[pixoff] = red;
            imgPix[pixoff + 1] = green;
            imgPix[pixoff + 2] = blue;
            imgPix[pixoff + 3] = alpha;
            pixoff += 4;
        }
        woff += w * 4;
    }
    NSInteger dataLength = w*h* 4;
    //下面的代码创建要输出的图像的相关参数
    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, imgPix, dataLength, NULL);
    // prep the ingredients
    int bitsPerComponent = 8;
    int bitsPerPixel = 32;
    size_t bytesPerRow = 4 * w;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault;
    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
    
    //创建要输出的图像
    CGImageRef imageRef = CGImageCreate(w, h,
                                        bitsPerComponent,
                                        bitsPerPixel,
                                        bytesPerRow,
                                        colorSpaceRef,
                                        bitmapInfo,
                                        provider,
                                        NULL, NO, renderingIntent);
    
    UIImage *my_Image = [UIImage imageWithCGImage:imageRef];
    
    CFRelease(imageRef);
    CGColorSpaceRelease(colorSpaceRef);
    CGDataProviderRelease(provider);
    return my_Image;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end
