//
//  AddViewController.m
//  Midterm
//
//  Created by 佐藤麻央 on 2015/02/24.
//  Copyright (c) 2015年 bcit. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()


@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Edit";
    cells = [[NSMutableArray alloc]initWithObjects:@"Cell 1(delete function disabled)", @"Cell 2", @"Cell 3", @"Cell 4",nil];
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
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = cells[indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView
canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0)
        return NO;
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [cells removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
        withRowAnimation:UITableViewRowAnimationFade];
	}
}

-(IBAction)add:(id)sender {
    [cells  addObject:_textField.text];
    _textField.text = @"";
    [_tableView reloadData];
}


// when cell is selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath*) indexPath{
    UIAlertController *alert= [UIAlertController
                                  alertControllerWithTitle:@"Edit"
                                  message:@"Enter New Name"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* saveAction = [UIAlertAction
                         actionWithTitle:@"SAVE"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             UITextField * alertTextField = alert.textFields.firstObject;
                             cells[indexPath.row] = [alertTextField text];
                             [tableView reloadData];

                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    UIAlertAction* cancelAction = [UIAlertAction
                             actionWithTitle:@"CANCEL"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.text = cells[indexPath.row];
        textField.secureTextEntry = false;
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}



@end
