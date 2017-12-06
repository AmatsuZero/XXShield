//
//  ViewController.m
//  XXShield_OSX_Example
//
//  Created by modao on 2017/12/6.
//  Copyright © 2017年 ValiantCat. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <XXShield/XXShield.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [XXShieldSDK registerStabilityWithAbility:(EXXShieldTypeTimer)];
    });
}

-(void)mouseDown:(NSEvent *)event {
    [self testTimer];
}

- (void)testTimer {
    // 1 正常使用
    //    self.timerPerson = [Person new];
    //    [NSTimer scheduledTimerWithTimeInterval:1 target:self.timerPerson selector:@selector(fireTimer) userInfo:@{@"hah":@"jaj"} repeats:YES];
    // 2 target会被runloop持有 造成隐式的内存泄漏 开启防护之后会自动注销timer
    [NSTimer scheduledTimerWithTimeInterval:1 target:[Person new] selector:@selector(fireTimer) userInfo:@{@"hah":@"jaj"} repeats:YES];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
