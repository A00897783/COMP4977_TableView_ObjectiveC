//
//  SeparatorTableViewController.m
//  Midterm
//
//  Created by 佐藤麻央 on 2015/02/24.
//  Copyright (c) 2015年 bcit. All rights reserved.
//

#import "SeparatorTableViewController.h"

@interface SeparatorTableViewController ()

@end

@implementation SeparatorTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _titleName;
    cells = [[NSArray alloc]initWithObjects:@"cell 1", @"cell 2",@"cell 3", @"cell 4",nil];
    
    if([_titleName isEqualToString: @"None"]){
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }else if([_titleName isEqualToString: @ "Single Line"]){
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }else if ([_titleName isEqualToString: @ "Single Line Etched"]){
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [cells count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = cells[indexPath.row];
    if([_titleName isEqualToString: @"Single Line Etched" ]){
        cell.contentView.backgroundColor = [UIColor greenColor];
    }
    
    return cell;
}

@end
