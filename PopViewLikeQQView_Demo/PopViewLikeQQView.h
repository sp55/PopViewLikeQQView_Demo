//
//  PopViewLikeQQView.h
//  PopViewLikeQQView_Demo
//
//  Created by admin on 16/6/15.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopViewLikeQQViewDelegate <NSObject>
- (void)PopViewLikeQQViewDelegateWithTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

typedef void(^Dismiss)(void);


@interface PopViewLikeQQView : UIView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) id<PopViewLikeQQViewDelegate> delegate;
@property (nonatomic, strong) NSArray *arrData;
@property (nonatomic, strong) NSArray *arrImgName;
@property (nonatomic, copy) Dismiss dismiss;

//初始化
- (instancetype)initWithDataArr:(NSArray *)dataArr origin:(CGPoint)origin width:(CGFloat)width rowHeight:(CGFloat)rowHeight;

- (void)dismissWithCompletion:(void (^)(PopViewLikeQQView *object))completion;

@end
