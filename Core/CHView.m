//
//  CHView.m
//  CoolHUD
//
//  Created by legendry on 15/12/8.
//  Copyright © 2015年 legendry. All rights reserved.
//

#import "CHView.h"
#import "CHCompleteCircleLayer.h"
#import <QuartzCore/QuartzCore.h>

@interface CHView ()
@property(nonatomic,strong)CHCompleteCircleLayer* circleLayer ;
@end
@implementation CHView

- (instancetype)init
{
    self = [super init] ;
    if(self)
    {
       
        [self setupComponents];
    }
    return self ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame] ;
    if(self)
    {
        [self setupComponents] ;
        
    }
    return self ;
}

- (void)setupComponents
{
    self.backgroundColor = [UIColor blackColor] ;
    self.circleLayer = [[CHCompleteCircleLayer alloc] init] ;
    self.circleLayer.frame = self.layer.bounds ;
    [self.layer addSublayer:self.circleLayer] ;
}
- (void)showProgress
{
    [self.circleLayer removeAllAnimations];
    CABasicAnimation* baseAnimation = [CABasicAnimation animationWithKeyPath:@"progress"] ;
    baseAnimation.fromValue = @0 ;
    baseAnimation.toValue = @1 ;
    baseAnimation.duration = 1.5f ;
    baseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    baseAnimation.autoreverses = NO ;
    baseAnimation.repeatCount = INFINITY ;
    baseAnimation.fillMode = @"forward" ;
    baseAnimation.removedOnCompletion = NO ;
    [self.circleLayer addAnimation:baseAnimation forKey:@"ch_progress"] ;
}

- (void)success
{
    [self.circleLayer removeAllAnimations];
    CABasicAnimation* baseAnimation = [CABasicAnimation animationWithKeyPath:@"progress"] ;
    baseAnimation.fromValue = @0 ;
    baseAnimation.toValue = @1 ;
    baseAnimation.duration = 1.f ;
    baseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    baseAnimation.autoreverses = NO ;
//    baseAnimation.repeatCount = INFINITY ;
    baseAnimation.fillMode = @"forward" ;
    baseAnimation.removedOnCompletion = NO ;
    baseAnimation.delegate = self ;
    [self.circleLayer addAnimation:baseAnimation forKey:@"ch_success"] ;
}

- (void)warning
{

}

- (void)error
{
    
}

#pragma mark - Animation Delegate

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag
{
//    if([anim ])
    NSLog(@"%@",anim.keyPath);
    
}

@end
