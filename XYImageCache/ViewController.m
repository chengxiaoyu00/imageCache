//
//  ViewController.m
//  XYImageCache
//
//  Created by 成晓宇 on 2018/3/28.
//  Copyright © 2018年 xiaoyuCheng. All rights reserved.
//

#import "ViewController.h"
#import "XYImageCache.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i<201; i++) {
        @autoreleasepool {
            [[XYImageCache sharedImageCache]storeImage:[UIImage imageNamed:@"ceshi.png"] imageData:nil forKey:[NSString stringWithFormat:@"%ld",(long)i] toDisk:NO completion:^{
                
            }];
        }
    }
    [self seeCacheLog];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)seeCacheLog {
    for (int i = 0; i<201; i++) {
        @autoreleasepool {
          
            UIImage *img = [[XYImageCache sharedImageCache]imageFromMemoryCacheForKey:[NSString stringWithFormat:@"%ld",(long)i]];
            if (img) {
                NSLog(@"img cache %d",i);
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
