//
//  ViewController.m
//  AttributedTextIOS8Demo
//
//  Created by 林峰 on 14-9-25.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *data = [[NSBundle mainBundle] pathForResource:@"111" ofType:@"plist"];
    NSMutableDictionary *infoDict = [NSMutableDictionary dictionaryWithContentsOfFile:data];
    NSString *string = [infoDict objectForKey:@"aa"];
    
    NSTextStorage *storage = [[NSTextStorage alloc] initWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    [storage addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:NSMakeRange(10, 20)];// [NSString stringWithFormat:@"%d", NSUnderlineStyleSingle]
    
    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:storage,@"storage", nil];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 40, 320, 300)];
    textView.attributedText = [dict objectForKey:@"storage"];
    // [[NSAttributedString alloc] initWithString:@"aaaa"]
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
