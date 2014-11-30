//
//  ItemsViewController.m
//  Hope
//
//  Created by Bin Lang on 11/30/14.
//  Copyright (c) 2014 BinLang. All rights reserved.
//

#import "ItemsViewController.h"

@interface ItemsViewController ()

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_collectionView reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark Collection View delegate
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 15;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    UIImageView *imageview = (UIImageView *)[cell viewWithTag:100];
    [imageview setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",indexPath.row+1]]];
    UILabel *label = (UILabel *)[cell viewWithTag:200];
    label.text = [NSString stringWithFormat:@"Name:Bin %d", indexPath.row];
    [cell.layer setBorderColor:[UIColor grayColor].CGColor];
    [cell.layer setBorderWidth:2.0f];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
