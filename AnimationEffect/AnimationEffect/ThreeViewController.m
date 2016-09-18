//
//  ThreeViewController.m
//  AnimationEffect
//
//  Created by 李根 on 16/9/14.
//  Copyright © 2016年 ligen. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()
@property (weak, nonatomic) IBOutlet UIView *ZeroView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property(nonatomic, strong)CALayer *zeroLayer;
@property(nonatomic, strong)CALayer *oneLayer;
@property(nonatomic, strong)CALayer *twoLayer;

@property(nonatomic, assign)NSInteger xValue;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _ZeroView.layer.contents = (__bridge id)[UIImage imageNamed:@"2.JPEG"].CGImage;
    
//    CALayer *textLayer = [CALayer layer];
//    textLayer.frame = CGRectMake(30, 20, 100, 30);
//    [_ZeroView.layer addSublayer:textLayer];
//    textLayer.backgroundColor = [UIColor orangeColor].CGColor;
//    textLayer.contents = @"fda";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 100, 30)];
    [_ZeroView addSubview:label];
    label.text = @"能显示吗 ?";
    label.backgroundColor = [UIColor colorWithRed:123.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:0];
    
#warning 颜色变化
    _xValue = 0;
    
    _zeroLayer = [CALayer layer];
    _zeroLayer.frame = CGRectMake(0, 0, 80, 32);
    _zeroLayer.backgroundColor = [UIColor purpleColor].CGColor;
//    _zeroLayer.cornerRadius = 16;
    [_bottomView.layer addSublayer:_zeroLayer];
    
    _oneLayer = [CALayer layer];
    _oneLayer.frame = CGRectMake(80, 0, 80, 32);
    _oneLayer.backgroundColor = [UIColor greenColor].CGColor;
    [_bottomView.layer addSublayer:_oneLayer];
    
    _twoLayer = [CALayer layer];
    _twoLayer.frame = CGRectMake(160, 0, 80, 32);
    _twoLayer.backgroundColor = [UIColor redColor].CGColor;
    [_bottomView.layer addSublayer:_twoLayer];

    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(change:) userInfo:nil repeats:YES];
    
}

- (void)change:(id)sender {
    _xValue++;
    
    if (_xValue % 3 == 0) {
        _zeroLayer.backgroundColor = [UIColor purpleColor].CGColor;
        _oneLayer.backgroundColor = [UIColor greenColor].CGColor;
        _twoLayer.backgroundColor = [UIColor redColor].CGColor;
    } else if (_xValue % 3 == 1) {
        _zeroLayer.backgroundColor = [UIColor redColor].CGColor;
        _oneLayer.backgroundColor = [UIColor purpleColor].CGColor;
        _twoLayer.backgroundColor = [UIColor greenColor].CGColor;
    } else {    //  2
        _zeroLayer.backgroundColor = [UIColor greenColor].CGColor;
        _oneLayer.backgroundColor = [UIColor redColor].CGColor;
        _twoLayer.backgroundColor = [UIColor purpleColor].CGColor;
        
        
    }
    NSLog(@"%d", _xValue % 3);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
