//
//  ItemInfoViewController.m
//  Hope
//
//  Created by Bin Lang on 12/7/14.
//  Copyright (c) 2014 BinLang. All rights reserved.
//

#import "ItemInfoViewController.h"
#import "ItemInfoTableViewCell.h"
#import "SVProgressHUD.h"

@interface ItemInfoViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray *imageInfoArray;
    NSArray *infoArray;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ItemInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"ItemInfo"];
    [_imageView setImage:_image];
  //  [SVProgressHUD showWithStatus:@"Loading..." maskType:SVProgressHUDMaskTypeGradient];
    imageInfoArray = @[@"Username", @"Dob", @"Location"];
    infoArray = @[@"Name", @"Date of Birth", @"Location"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [infoArray count];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString *itemIdentifier = @"ItemInfoCell";
    ItemInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:itemIdentifier forIndexPath:indexPath];
    [cell.imageView  setImage:[UIImage imageNamed:[imageInfoArray objectAtIndex:indexPath.row]]];
    [cell.textField setPlaceholder:[infoArray objectAtIndex:indexPath.row]];
    return  cell;
}

@end
