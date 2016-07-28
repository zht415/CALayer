//
//  ViewController.m
//  CALayer
//
//  Created by YK- on 16/7/24.
//  Copyright © 2016年 zht. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIView *layerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _layerView = [[UIView alloc]initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-200)/2,(CGRectGetHeight(self.view.frame)-200)/2, 200, 200)];
    _layerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_layerView];
    
    //create subLayer
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    //set controller as layer delegate
    blueLayer.delegate = self;
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.layerView.layer addSublayer:blueLayer];
    
    //force layer to redraw
    [blueLayer display];
    
}
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{

    //draw a thick red circle
    
    //Sets the line width for a graphics context.
    //The default line width is 1 unit. When stroked, the line straddles the path, with half of the total width on either side.
    CGContextSetLineWidth(ctx, 10.0f);
    //Sets the current stroke color in a context, using a Quartz color.
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    //Strokes an ellipse that fits inside the specified rectangle.
    //As a side effect when you call this function, Quartz clears the current path
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
