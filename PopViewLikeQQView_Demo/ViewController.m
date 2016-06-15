//
//  ViewController.m
//  PopViewLikeQQView_Demo
//
//  Created by admin on 16/6/15.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"
#import "PopViewLikeQQView.h"


@interface ViewController ()<PopViewLikeQQViewDelegate>

@property (nonatomic, strong) PopViewLikeQQView *menu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"schoolListItem.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showSchoolList:)];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)showSchoolList:(UIBarButtonItem *)barButtonItem
{
    __weak __typeof(self) weakSelf = self;
    if (!self.menu) {
        self.menu = [[PopViewLikeQQView alloc] initWithDataArr:@[@"附近学校", @"联赛流程", @"其他联赛", @"校内群聊", @"邀请好友"] origin:CGPointMake(0, 0) width:125 rowHeight:44];
        _menu.delegate = self;
        _menu.dismiss = ^() {
            weakSelf.menu = nil;
        };
        _menu.arrImgName = @[@"item_school.png", @"item_battle.png", @"item_list.png", @"item_chat.png", @"item_share.png"];
        [self.view addSubview:_menu];
        
    } else {
        [_menu dismissWithCompletion:^(PopViewLikeQQView *object) {
            weakSelf.menu = nil;
        }];
    }
}

- (void)PopViewLikeQQViewDelegateWithTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"select: %ld", indexPath.row);
}


@end
