//
//  LinkedinLoginViewController.m
//  LinkedinWebViewDemo
//
//  Created by  fireFrog on 2017/6/2.
//  Copyright © 2017年 D8Ge_yeyongping. All rights reserved.
//

#import "LinkedinLoginViewController.h"
#import <WebKit/WebKit.h>

static NSString *const kRedirectUri = @"";
static NSString *const kLinkedinAuthorizationBaseUrl = @"https://www.linkedin.com/uas/oauth2/authorization";
static NSString *const kLinkedinAccessTokenBaseUrl = @"https://www.linkedin.com/uas/oauth2/accessToken";

@interface LinkedinLoginViewController ()<WKNavigationDelegate>

@property (nonatomic, weak) WKWebView *webView;

@end

@implementation LinkedinLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:[[WKWebViewConfiguration alloc] init]];
    _webView = webView;
    [self.view addSubview:webView];
    [self authorizationFromLinkedin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSString *url = navigationAction.request.URL.absoluteString.stringByRemovingPercentEncoding;
    NSURL *url1 = navigationAction.request.URL;
    NSString *urlQuery = [url1 query];
    
}

- (void)authorizationFromLinkedin {
    NSString *url = @"https://www.baidu.com";
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

- (void)requestForLinkedinToken:(NSString *)authorizationCode {
    /* 
     let grantType = "authorization_code"
     
     let redirectURL = "https://com.appcoda.linkedin.oauth/oauth".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())!
     
     // Set the POST parameters.
     var postParams = "grant_type=\(grantType)&"
     postParams += "code=\(authorizationCode)&"
     postParams += "redirect_uri=\(redirectURL)&"
     postParams += "client_id=\(linkedInKey)&"
     postParams += "client_secret=\(linkedInSecret)"
     */
    
    //Post发送请求
}

@end
