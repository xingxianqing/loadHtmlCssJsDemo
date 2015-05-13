//
//  ViewController.m
//  ios-loadHtml
//
//  Created by 邢现庆 on 15-4-22.
//  Copyright (c) 2015年 邢现庆. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Load HTML";
    [self loadHTMLFile];
}

//Load
-(void)loadHTMLFile{
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"index1"
                                                          ofType:@"html"];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    [self.webView loadHTMLString:htmlCont baseURL:baseURL];
}
#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType{
    
    NSURL* url = [request URL];
    NSString* urlstring = [NSString stringWithFormat:@"%@",url];
//    if ([urlstring isEqualToString:@"http://baidu.com/"]) {
//        return NO;
//    }
    NSLog(@"url = >%@",url);
    
    return YES;
}


















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
