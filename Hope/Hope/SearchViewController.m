//
//  SearchViewController.m
//  Hope
//
//  Created by Bin Lang on 11/30/14.
//  Copyright (c) 2014 BinLang. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchCell.h"

@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>{
    NSMutableArray *imageInfoArray;
    NSMutableArray *infoArray;
    NSDateFormatter *dateFormatter;
}
@property (weak, nonatomic) IBOutlet UIDatePicker *datePikcer;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)dataChanged:(id)sender;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [self setTitle:@"Search"];
    [super viewDidLoad];
    imageInfoArray = [@[@"Username",  @"Gender",@"Dob", @"Location", @"Accent"] mutableCopy];
    infoArray = [[NSMutableArray alloc] initWithObjects:@"Name",@"Gender", @"Date of Birth", @"Location", @"Accent", nil];
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [_datePikcer setDatePickerMode:UIDatePickerModeDate];
    [_datePikcer setHidden:YES];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dataChanged:(id)sender{
    NSString *date = [dateFormatter stringFromDate:_datePikcer.date];
    [infoArray replaceObjectAtIndex:2 withObject:date];
    [_tableView reloadData];
}


#pragma UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"SearchCell";
    SearchCell *customCell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [customCell.imageView setImage:[UIImage imageNamed:[imageInfoArray objectAtIndex:indexPath.row]]];
    [customCell.textField setPlaceholder:[infoArray objectAtIndex:indexPath.row]];
    customCell.textField.tag = indexPath.row;
    customCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return customCell;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if(textField.tag ==2){
        [self.view endEditing:YES];
        [_datePikcer setHidden:NO];
        return NO;
    }
    else{
        [_datePikcer setHidden:YES];
        return YES;
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    [_datePikcer setHidden:YES];
    return YES;
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
