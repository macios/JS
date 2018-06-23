//
//  JSCoreVC.m
//  JS
//
//  Created by ac hu on 2018/6/21.
//  Copyright © 2018年 ac hu. All rights reserved.
//

#import "JSCoreVC.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "RootVC.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface JSCoreVC ()<UIWebViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong, nonatomic) UIWebView *webView;

@end

@implementation JSCoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JSCText" ofType:@"html"];
    //加载一个本地网页
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
    
//    [self JSEXportUser];
//    [self JSCoreUser];
}

-(void)JSCoreUser{
    //获取JS执行的环境
    JSContext *context = [[JSContext alloc]init];
    [context evaluateScript:@"var num = 6"];
    [context evaluateScript:@"function result(num){return num * 5}"];
    
    JSValue *value = [context evaluateScript:@"result(num)"];
    NSLog(@"%@",value);
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    JSContext *context = [webView valueForKeyPath:@"application/javascript"];
    
    __weak typeof (self)weekSelf = self;
    context[@"navResult"] = ^{
        RootVC *vc = [RootVC new];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weekSelf.navigationController pushViewController:vc animated:YES];
        });
        return @"跳转成功";
    };
    
    context[@"openAAA"] = ^{
        NSLog(@"打开AAA");
    };
    context[@"openIosAblum"] = ^{
        NSLog(@"调用相机");
    };
    
}

@end
