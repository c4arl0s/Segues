# Segues

### Transitions between scenes.

With segues, you can use IB to define how one scene will transition to another. This works only in storyboards, not nibs.

# Perform Segues



# Custom Transitions (between view controllers)

There is two kind of transitions:

- push
- Modal
- Custom 

# Create a project with Master Detail Project (new prject -> Select)

![Screen Shot 2019-12-23 at 10 08 11](https://user-images.githubusercontent.com/24994818/71367966-2ecb6a00-256c-11ea-82fd-804445fea68a.png)
![Screen Shot 2019-12-23 at 10 08 22](https://user-images.githubusercontent.com/24994818/71367970-30952d80-256c-11ea-8938-82475eb03416.png)

```objective-c
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
    [UIView animateWithDuration:0.3 animations:^{
        sourceViewController.view.frame = frame;
    } completion:^(BOOL finished) {
        sourceViewController.view.alpha = 0;
        destinationViewController.view.frame = frame;
        destinationViewController.view.alpha = 0.0f;
        [[sourceViewController.view superview] addSubview:destinationViewController.view];
        [UIView animateWithDuration:0.3 animations:^{
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
```



