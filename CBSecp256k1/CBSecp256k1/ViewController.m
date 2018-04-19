//
//  ViewController.m
//  CBSecp256k1
//
//  Created by caobo56 on 2018/4/18.
//  Copyright © 2018年 caobo56. All rights reserved.
//

#import "ViewController.h"
#import "CBSecp256k1.h"
#import "NSData+HexString.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    // 0339a36013301597daef41fbe593a02cc513d0b55527ec2df1050e2e8ff49c85c2
    
    NSData *prvData = [NSData hexStringToData:@"e8f32e723decf4051aefac8e2c93c9c5b214313817cdb01a1494b917c8436b35"];
    NSData *pubkey = [CBSecp256k1 generatePublicKeyWithPrivateKey:prvData compression:YES];
    NSLog(@"pubkey == %@", pubkey);
    
    NSString* message = @"Test message";
    NSData *msgData = [message dataUsingEncoding:NSUTF8StringEncoding];
    NSData *sigData = [CBSecp256k1 compactSignData:msgData withPrivateKey:prvData];
    __unused BOOL isSigInvalid = [CBSecp256k1 verifySignedData:sigData withMessageData:msgData usePublickKey:pubkey];
    if(isSigInvalid){
        NSLog(@"sigData == %@", sigData);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
