#import <Foundation/Foundation.h>
#import "WebrtcPlugin.h"

@interface WebrtcPlugin (RTCMediaStream)

-(void)getUserMedia:(NSDictionary *)constraints
             result:(FlutterResult)result;

-(void)getSources:(FlutterResult)result;
@end


