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

- (CABasicAnimation*)baseAnimation
{
    CABasicAnimation* baseAnimation = [CABasicAnimation animationWithKeyPath:@"progress"] ;
    baseAnimation.fillMode = @"forward" ;
    baseAnimation.removedOnCompletion = NO ;
   
    
    return baseAnimation ;
}

- (void)showProgress
{
    [self.circleLayer removeAllAnimations];
    CABasicAnimation* baseAnimation = [self baseAnimation];
    baseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    baseAnimation.autoreverses = NO ;
    baseAnimation.repeatCount = INFINITY ;
    baseAnimation.fromValue = @0 ;
    baseAnimation.toValue = @1 ;
    baseAnimation.duration = 1.5f ;
    [self.circleLayer addAnimation:baseAnimation forKey:PROGRESS] ;
}

- (void)success
{
    [self.circleLayer removeAllAnimations];
    CABasicAnimation* baseAnimation = [self baseAnimation] ;
    baseAnimation.fromValue = @0 ;
    baseAnimation.toValue = @1 ;
    baseAnimation.duration = 1.f ;
    baseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    baseAnimation.autoreverses = NO ;
    baseAnimation.delegate = self ;
    [self.circleLayer addAnimation:baseAnimation forKey:SUCCESS] ;
}

- (void)warning
{
    
}

- (void)error
{
    [self.circleLayer removeAllAnimations];
    CABasicAnimation* baseAnimation = [self baseAnimation] ;
    baseAnimation.fromValue = @0 ;
    baseAnimation.toValue = @1 ;
    baseAnimation.duration = 1.f ;
    baseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    baseAnimation.autoreverses = NO ;
    baseAnimation.delegate = self ;
    [self.circleLayer addAnimation:baseAnimation forKey:ERROR] ;
}

#pragma mark - Animation Delegate

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag
{
//    if([anim ])
    NSLog(@"%@",anim.keyPath);
    
}

@end
