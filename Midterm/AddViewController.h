//
//  AddViewController.h
//  Midterm
//
//  Created by 佐藤麻央 on 2015/02/24.
//  Copyright (c) 2015年 bcit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *cells;
}

@property IBOutlet UITableView *tableView;
@property IBOutlet UITextField *textField;


@end
