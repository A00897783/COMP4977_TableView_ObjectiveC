//
//  StyleTableViewController.m
//  Midterm
//
//  Created by 佐藤麻央 on 2015/02/24.
//  Copyright (c) 2015年 bcit. All rights reserved.
//

#import "StyleTableViewController.h"
#import "SeparatorTableViewController.h"

@interface StyleTableViewController ()

@end

@implementation StyleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    styles = [[NSArray alloc]initWithObjects:@"Default", @"Value1", @"Value2",@"Subtitle",nil];
   
    separators = [[NSArray alloc]initWithObjects:@"None", @"Single Line", @"Single Line Etched",nil];
    acce= [[NSArray alloc]initWithObjects:
                   @"None",@"Disclosure Indicator", @"Detail Disclosure Button",@"Checkmark", @"Detail Button",nil];
    self.navigationItem.title = _titleName;
    
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
    NSInteger num = 0;
    if([_titleName isEqualToString:@"Style"]){
        num = [styles count];
    }else if ([_titleName isEqualToString:@"Accessory"]){
        num =  [acce count];
    }else if ([_titleName isEqualToString:@"Separator"]){
        num =  [separators count];
    }
    return num;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell ;
    NSString *cellIdentifier = @"Cell";
    if([_titleName isEqualToString:@"Style"]){
        switch(indexPath.row){
            case 0: cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];break;
            case 1: cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];break;
            case 2: cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentifier];break;
            case 3: cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];break;
            default: cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.textLabel.text = styles[indexPath.row];
        cell.detailTextLabel.text = @"detail";
        
    }else if ([_titleName isEqualToString:@"Accessory"]){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        switch(indexPath.row){
            case 0: cell.accessoryType = UITableViewCellAccessoryNone;break;
            case 1: cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;break;
            case 2: cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;break;
            case 3: cell.accessoryType = UITableViewCellAccessoryCheckmark;break;
            case 4: cell.accessoryType = UITableViewCellAccessoryDetailButton;break;
            default: cell.accessoryType = UITableViewCellAccessoryNone;
        }
        cell.textLabel.text = acce[indexPath.row];
        
    }else if ([_titleName isEqualToString:@"Separator"]){
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.text = separators[indexPath.row];
    }else{
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}


// when cell is selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath*) indexPath{
    if ([_titleName isEqualToString:@"Separator"]) {
        nextTitle = separators[indexPath.row];
        [self performSegueWithIdentifier:@"toSeparator" sender:self];
    }
}


#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toSeparator"]) {
        SeparatorTableViewController *vc = (SeparatorTableViewController*)[segue destinationViewController];
        vc.titleName = nextTitle;
    }
}


@end
