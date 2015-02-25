//
//  StyleTableViewController.h
//  Midterm
//
//  Created by 佐藤麻央 on 2015/02/24.
//  Copyright (c) 2015年 bcit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StyleTableViewController : UITableViewController{
    NSArray *styles;
    NSArray *acce;
    NSArray *separators;
    NSString *nextTitle;
}
@property (nonatomic, strong) NSString *titleName;

@end
