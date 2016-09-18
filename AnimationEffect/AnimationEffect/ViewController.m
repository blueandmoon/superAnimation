//
//  ViewController.m
//  AnimationEffect
//
//  Created by 李根 on 16/9/14.
//  Copyright © 2016年 ligen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
#warning    one
    
#if 0
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    //  add it to ZeroView
    [_layerView.layer addSublayer:blueLayer];
    
    UIImage *image = [UIImage imageNamed:@"0.JPG"];
    
    //  layer的接收对象要是CGImage类型才好, 否则是白板
    blueLayer.contents = (__bridge id _Nullable)(image.CGImage);
#endif
    
#warning two
    
#if 1
    UIImage *image = [UIImage imageNamed:@"0.JPG"];
    _layerView.layer.contents = (__bridge id)image.CGImage;
    //    _ZeroView.contentMode = UIViewContentModeScaleAspectFit;
    //  与UIView的contentMode对应的CALayer的属性是contentsGravity
    _layerView.layer.contentsGravity = kCAGravityCenter;
    //  在用代码处理寄宿图时, 一定得手动设置图层的contentsScale属性, , 否则在Retina屏上显示就会不正确, 如下
    _layerView.layer.contentsScale = [UIScreen mainScreen].scale;
    
    _layerView.layer.masksToBounds = YES;
    //  contentRect是允许我们在图层上显示寄宿图的区域
    _layerView.layer.contentsRect = CGRectMake(0, 0, 1, 1);
    
#endif
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
