//
//  OneViewController.m
//  AnimationEffect
//
//  Created by 李根 on 16/9/14.
//  Copyright © 2016年 ligen. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()
@property (weak, nonatomic) IBOutlet UIView *leftTopView;
@property (weak, nonatomic) IBOutlet UIView *rightTopView;
@property (weak, nonatomic) IBOutlet UIView *leftBottomView;
@property (weak, nonatomic) IBOutlet UIView *rightBottomView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation OneViewController

- (void)addSpriteImage:(UIImage *)image WithContentRect:(CGRect)rect toLayer:(CALayer *)layer {
    
    layer.contents = (__bridge id)image.CGImage;
    
    //  scale contents to fit
    layer.contentsGravity = kCAGravityResizeAspect;
    
    //  set contentsRect
    layer.contentsRect = rect;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  分割图片
    UIImage *image = [UIImage imageNamed:@"0.JPG"];
    
    [self addSpriteImage:image WithContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:_leftTopView.layer];
    [self addSpriteImage:image WithContentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:_rightTopView.layer];
    [self addSpriteImage:image WithContentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:_leftBottomView.layer];
    [self addSpriteImage:image WithContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:_rightBottomView.layer];
    
    //  拼接图片
    _bottomView.layer.contents = (__bridge id)[UIImage imageNamed:@"1.png"].CGImage;
    
    CALayer *leftLayer = [CALayer layer];
    leftLayer.frame = CGRectMake(0, 0, 120, 150);
    leftLayer.contents = (__bridge id)[UIImage imageNamed:@"1.JPEG"].CGImage;
    leftLayer.contentsGravity = kCAGravityResizeAspect;
    
    CALayer *rightLayer = [CALayer layer];
    rightLayer.frame = CGRectMake(120, 0, 120, 150);
    rightLayer.contents = (__bridge id)[UIImage imageNamed:@"2.JPEG"].CGImage;
    rightLayer.contentsGravity = kCAGravityResizeAspect;
//    rightLayer.contentsScale = [UIScreen mainScreen].scale;
//    rightLayer.masksToBounds = YES;
    
    [_bottomView.layer addSublayer:leftLayer];
    [_bottomView.layer addSublayer:rightLayer];
    
    
    //  一个layer的默认的contentsCenter为{0, 0, 1, 1}, 拉伸图片
    _leftTopView.layer.contentsCenter = CGRectMake(0.25, 0.25, 0.5, 0.5);
    //    leftLayer.contentsCenter = CGRectMake(0.25, 0.25, 0.5, 0.5);
    //    rightLayer.contentsCenter = CGRectMake(0.25, 0.25, 0.5, 0.5);
    //    NSLog(@"%f", _bottomView.layer.contentsCenter.size.width);
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
