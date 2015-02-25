//
//  CustomizedTableViewController.m
//  Midterm
//
//  Created by 佐藤麻央 on 2015/02/24.
//  Copyright (c) 2015年 bcit. All rights reserved.
//

#import "CustomizedTableViewController.h"

@interface CustomizedTableViewController ()

@end

@implementation CustomizedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Customized";
    
    imgArray = [[NSArray alloc]initWithObjects:@"img0.png",@"img1.jpg",@"img2.jpg",nil];
    label2Array = [[NSArray alloc]initWithObjects:@"2013/8/23/16:04",@"2013/8/23/16:15",@"2013/8/23/16:47",nil];
    label1Array = [[NSArray alloc]initWithObjects:@"BCIT",@"D'Arcy Smith",@"Set R",nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
// Return the number of sections.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Return the number of rows in the section.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [imgArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"tableCell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    UIImage *img = [UIImage imageNamed:imgArray[indexPath.row]];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    imageView.image = img;
    
    UILabel *label1 = (UILabel *)[cell viewWithTag:2];
    label1.text = label1Array[indexPath.row];
    
    UILabel *label2 = (UILabel *)[cell viewWithTag:3];
    label2.text = label2Array[indexPath.row];
    
    return cell;
}



@end
