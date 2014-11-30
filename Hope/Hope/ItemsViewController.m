//
//  ItemsViewController.m
//  Hope
//
//  Created by Bin Lang on 11/30/14.
//  Copyright (c) 2014 BinLang. All rights reserved.
//

#import "ItemsViewController.h"
#import "SearchViewController.h"

@interface ItemsViewController ()

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)segmentedControlAction:(id)sender;

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationController.navigationBarHidden  = NO;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationItem.rightBarButtonItem = [self rightMenuBarButtonItem];
    
    [self setTitle:@"Info"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIBarButtonItem *)rightMenuBarButtonItem {
    
    
    UIImage *image = [UIImage imageNamed:@"Search.png"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return [[UIBarButtonItem alloc]
            initWithImage:image style:UIBarButtonItemStylePlain
            target:self
            action:@selector(rightSideMenuButtonPressed:)];
}


- (IBAction)rightSideMenuButtonPressed:(id)sender{
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:NO];
}

- (IBAction)segmentedControlAction:(id)sender{
    NSLog(@"%d",_segmentedControl.selectedSegmentIndex);
    if(_segmentedControl.selectedSegmentIndex == 0){
        [_collectionView reloadData];
    }
    
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
