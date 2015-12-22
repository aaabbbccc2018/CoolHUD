//
//  CHCircleLayer.h
//  CoolHUD
//
//  Created by legendry on 15/12/4.
//  Copyright © 2015年 legendry. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#define PROGRESS    @"ch_progress"
#define SUCCESS     @"ch_success"
#define ERROR       @"ch_failed"
#define WARNING     @"ch_warning"



@interface CHCompleteCircleLayer : CALayer
@property(nonatomic,assign)CGFloat progress ;
@property(nonatomic,assign)CGFloat lineWeight;


@end
