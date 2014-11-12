//
//  CardView.m
//  CaraFlipSample
//
//

#import "CardView.h"

@implementation CardView
{
    UIImageView *frontImageView;
    UIImageView *backImageView;
    
    Boolean showingBack;
}


-(id) initWithFrame:(CGRect)frame frontImage:(UIImage*) frontImage backImage:(UIImage*)backImage
{
    self = [super initWithFrame:frame];
    
    if(self) {
        showingBack = YES;
        
        frontImageView = [[UIImageView alloc] initWithImage:frontImage];
        frontImageView.frame = CGRectMake(0, 0, backImage.size.width, backImage.size.height);
        
        backImageView = [[UIImageView alloc] initWithImage:backImage];
        backImageView.frame = CGRectMake(0, 0, backImage.size.width, backImage.size.height);
        
        [self addSubview:backImageView];
        
        UITapGestureRecognizer *tapGesture =
        [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view_Tapped:)];
        tapGesture.numberOfTapsRequired = 1;
        
        [self addGestureRecognizer:tapGesture];
        
        self.userInteractionEnabled = YES;
    }
    
    return self;
}

- (void)view_Tapped:(UITapGestureRecognizer *)sender
{
    self.userInteractionEnabled = NO;
    if(showingBack) {
        [UIView transitionFromView:backImageView toView:frontImageView duration:1 options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) {
            showingBack = NO;
            self.userInteractionEnabled = YES;
        }];
    } else {
        [UIView transitionFromView:frontImageView toView:backImageView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            showingBack = YES;
            self.userInteractionEnabled = YES;
        }];
    }
}

@end
