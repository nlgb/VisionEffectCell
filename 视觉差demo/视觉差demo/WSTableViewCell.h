//
//  WSTableViewCell.h
//  视觉差demo
//
//  Created by sw on 16/7/17.
//  Copyright © 2016年 sw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSTableViewCell : UITableViewCell
/**
 *  提供一个类方法获取cell
 *
 *  @param tableView tableView
 *
 *  @return cell对象
 */
+ (instancetype)cellForTableView:(UITableView *)tableView;

/**
 *  更新图片的Y
 *
 *  @param tableView tableView
 *  @param view      view   
 */
- (void)updateBackImageViewYForTableView:(UITableView *)tableView andView:(UIView *)view;

@property (nonatomic,strong) UIImage *backImage;

/**
 *  图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

@end
