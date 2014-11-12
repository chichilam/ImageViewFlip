//
//  ViewController.m
//  CaraFlipSample
//
//

#import "ViewController.h"

#import "CardView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CardView *cardView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *frontImage = [UIImage imageNamed:@"front"];
    UIImage *backImage = [UIImage imageNamed:@"back"];
    
    cardView = [[CardView alloc] initWithFrame:CGRectMake(30, 30, backImage.size.width, backImage.size.height)
                                    frontImage:frontImage
                                     backImage:backImage];
    
    [self.view addSubview:cardView];
}

@end
