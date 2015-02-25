//
//  MainTableViewController.m
//  Midterm
//
//  Created by 佐藤麻央 on 2015/02/24.
//  Copyright (c) 2015年 bcit. All rights reserved.
//

#import "MainTableViewController.h"
#import "StyleTableViewController.h"
#import "CustomizedTableViewController.h"
#import "AddViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    sections = [[NSArray alloc]initWithObjects:@"Cell Style Example", @"Edit Table Example",nil];
    styles = [[NSArray alloc]initWithObjects:@"Style", @"Accessory",@"Separator", @"Customized",nil];
    functions = [[NSArray alloc]initWithObjects:@"Add, Delete and Edit", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
// Return the number of sections.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [sections count];
}
//set section headders
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return sections[section];
}


// Return the number of rows in the section.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return [styles count];
    }else{
        return [functions count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    if(indexPath.section == 0){
        cell.textLabel.text = styles[indexPath.row];
    }else{
        cell.textLabel.text = functions[indexPath.row];
    }    
    return cell;
}

// when cell is selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath*) indexPath{
    name = styles[indexPath.row];
    if (indexPath.section == 0) {
        if(indexPath.row == [styles count] - 1){
            [self performSegueWithIdentifier:@"toCust" sender:self];
        }else{
            [self performSegueWithIdentifier:@"toStyle" sender:self];
        }
    }else{
        [self performSegueWithIdentifier:@"toAdd" sender:self];
    }
}


#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toStyle"]) {
        StyleTableViewController *vc = (StyleTableViewController*)[segue destinationViewController];
        vc.titleName = name;
    }
}


@end
