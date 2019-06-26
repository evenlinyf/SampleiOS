//
//  ViewController.m
//  DeviceID
//
//  Created by EvenLin on 2019/6/26.
//  Copyright © 2019 evenlin. All rights reserved.
//

#import "ViewController.h"
#import "DeviceTool.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)refresh:(id)sender {
    [self.tableView reloadData];
}

#pragma mark *** <UITableViewDataSource> ***

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"tablecellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"BundleID";
            cell.detailTextLabel.text = [DeviceTool bundelID];
            break;
        case 1:
            cell.textLabel.text = @"Vendor UUID";
            cell.detailTextLabel.text = [DeviceTool vendorUUID];
            break;
        case 2:
            cell.textLabel.text = @"UUID";
            cell.detailTextLabel.text = [DeviceTool createUUID];
            break;
        case 3:
            cell.textLabel.text = @"广告标识符";
            cell.detailTextLabel.text = [DeviceTool advertisingID];
            break;
        default:
            break;
    }
    cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
    return cell;
    
}

#pragma mark *** <UITableViewDelegate> ***

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
