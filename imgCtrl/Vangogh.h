// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>


/**
 * Integrate Vangogh into your app by creating an instance of @c VGWindow as your application's 
 * key window (instead of UIWindow). This is usually done in the application delegate or main 
 * storyboard.
 *
 * Once the application is running, shake the device (or press Cmd-Ctrl-Z on the Simulator) to 
 * activate filtering.
 *
 * A details view displays the current type of color blindness and how common it is for males 
 * and females. You can switch filters by tapping the arrow buttons and pause the current filter 
 * by tapping between them. You can also limit filtering to one side of the screen by panning 
 * from the middle of the view to the left or right.
 *
 * You can dismiss the details view by swiping it downwards. When you're done, shake the device
 * again to stop filtering completely.
 */
@interface VGWindow : UIView

@end


/**
 * If you don't want to use shake gestures you can create a @c VGFilterWindow and control
 * filtering manually by toggling its @c hidden property. Be sure to pass an appropriate
 * frame to the @c initWithFrame: initializer.
 */
@interface VGFilterWindow : UIView

@end
