//
//  CHCircleLayer.m
//  CoolHUD
//
//  Created by legendry on 15/12/4.
//  Copyright © 2015年 legendry. All rights reserved.
//

#import "CHCompleteCircleLayer.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

const CGFloat ridus = 50 ;

@interface CHCompleteCircleLayer ()
@end
@implementation CHCompleteCircleLayer

- (instancetype)init
{
    self = [super init] ;
    if(self)
    {
        self.delegate = self ;
    }
    return self ;
}
//根据key来判断是否需要重绘
+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if([key isEqualToString:@"progress"])
    {
        return YES ;
    }
    
    return [super needsDisplayForKey:key] ;
}

//重绘
- (void)drawInContext:(CGContextRef)ctx
{
    
    if([self animationForKey:@"ch_success"])
    {
        CGFloat spe01 = 0.8;
        CGFloat spe12 = 0.9 ;
        CGFloat progress0 = 0 ;
        CGFloat progress1 = 0 ;
        CGFloat progress2 = 0 ;
        
        if(self.progress < spe01)
        {
            progress0 = 1 - self.progress / spe01 ;
        }
        else
        {
            progress0 = 1.0 ;
        }
        
        if(self.progress >= spe01 && self.progress < spe12)
        {
            progress1 = (spe12 - self.progress) / (spe12 - spe01) ;
        }
        else
        {
          
            progress1 = 1 ;
            
        }
        
        if(self.progress >= spe12)
        {
            progress1 = 0 ;
            progress2 = ( (1 - spe12) - (1 - self.progress) ) / (1 - spe12);
        }
        
        
        if(self.progress == 0)
        {
            progress0 = 1 ;
            progress1 = 0 ;
            progress2 = 1 ;
        }
        
        UIBezierPath* path = [UIBezierPath bezierPath] ;
        CGPoint centerPos = CGPointMake(self.frame.size.width / 2  , self.frame.size.height / 2 + 15 );
        
        if(progress0 > 0)
        {
            CGFloat original = (3.0 / 2.0 * M_PI) * ( progress0 ) ;
            CGFloat end = (3 * M_PI + 1.0 / 2.0 * M_PI) * ( progress0 )  ;
            if(progress0 == 1)
            {
                original = 0 ;
                end = - 2 * M_PI ;
            }
            [path addArcWithCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2) radius:ridus startAngle:original endAngle:end clockwise:NO] ;
        }
        
        if(progress1 > 0 || progress2 > 0 || self.progress == 0)
        {
           
            CGPoint startPos = CGPointMake(centerPos.x - ridus * 0.4 ,
                                           centerPos.y - ridus * 0.4 )  ;
            CGPoint moveCenterPos = CGPointMake(centerPos.x -  ridus * 0.4 *  progress1 ,
                                                centerPos.y -  ridus * 0.4  *  progress1);
            
            [path moveToPoint:startPos] ;
            [path addLineToPoint:moveCenterPos];
        }
        
        if(progress2 > 0 || self.progress == 0)
        {
            CGPoint endPos = CGPointMake(centerPos.x + ridus * 0.6 *  progress2 ,
                                         centerPos.y - ridus * 0.6 *  progress2);
            [path moveToPoint:centerPos];
            [path addLineToPoint:endPos];
        }
        CGContextAddPath(ctx, path.CGPath) ;
        CGContextSetLineWidth(ctx, 3);
        CGContextSetStrokeColorWithColor(ctx, [UIColor greenColor].CGColor) ;
        CGContextStrokePath(ctx);
    }
    else if([self animationForKey:@"ch_progress"])
    {
        CGFloat endOffset = 0 ;
        
        if(self.progress <= 0.5)
        {
            endOffset = -self.progress * (2 * M_PI) ;
        }
        else
        {
            endOffset = - (1 - self.progress ) * ( 2 * M_PI) ;
        }
        CGFloat original = (4 * M_PI) * (1 -  self.progress)  ;
        //结束点
        CGFloat end = original + endOffset ;

//        NSLog(@"起点:%f     终点:%f   偏移量:%f", original,end,endOffset);
        
        UIBezierPath* path = [UIBezierPath bezierPath] ;
        [path addArcWithCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2) radius:ridus startAngle:original endAngle:end clockwise:NO] ;
        
        CGContextAddPath(ctx, path.CGPath) ;
        CGContextSetLineWidth(ctx, 1.5);
        CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor) ;
        CGContextStrokePath(ctx);
    }

}



@end
