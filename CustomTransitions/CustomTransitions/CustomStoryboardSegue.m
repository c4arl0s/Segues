//
//  CustomStoryboardSegue.m
//  CustomTransitions
//
//  Created by Carlos Santiago Cruz on 23/12/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import "CustomStoryboardSegue.h"

@implementation CustomStoryboardSegue
-(void)perform
{
    UIViewController *sourceViewController = (UIViewController *)self.sourceViewController;
    UIViewController *destinationViewController = (UIViewController *)self.destinationViewController;
    CGRect frame = sourceViewController.view.frame;
    CGRect originalSourceRect = sourceViewController.view.frame;
    frame.origin.y = frame.size.height;
    [UIView animateWithDuration:0.6 animations:^{
        sourceViewController.view.frame = frame;
    } completion:^(BOOL finished) {
        sourceViewController.view.alpha = 0;
        destinationViewController.view.frame = frame;
        destinationViewController.view.alpha = 0.0f;
        [[sourceViewController.view superview] addSubview:destinationViewController.view];
        [UIView animateWithDuration:0.6 animations:^{
            destinationViewController.view.frame = originalSourceRect;
            destinationViewController.view.alpha = 1.0f;
        } completion:^(BOOL finished) {
            [destinationViewController.view removeFromSuperview];
            sourceViewController.view.alpha = 1.0f;
            [sourceViewController.navigationController pushViewController:destinationViewController animated:NO];
        }];
    }];
}
@end
