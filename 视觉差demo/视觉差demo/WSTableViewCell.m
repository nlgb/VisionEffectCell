//
//  WSTableViewCell.m
//  视觉差demo
//
//  Created by sw on 16/7/17.
//  Copyright © 2016年 sw. All rights reserved.
//

#import "WSTableViewCell.h"

@interface WSTableViewCell ()


@end

@implementation WSTableViewCell

+ (instancetype)cellForTableView:(UITableView *)tableView {
    WSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
    }
    
    return cell;
}

- (void)updateBackImageViewYForTableView:(UITableView *)tableView andView:(UIView *)view {
    // 1.cell在view坐标系上的frame
    CGRect frameOnView = [tableView convertRect:self.frame toView:view];
    // 2.cell 和 view 的中心距离差
    CGFloat distanceOfCenterY = CGRectGetHeight(view.frame) * 0.5 - CGRectGetMinY(frameOnView);
    // 3.cell 和 backImageView的高度差
    CGFloat distanceH = CGRectGetHeight(self.backImageView.frame) - CGRectGetHeight(self.frame);
    // 4.计算图片Y值偏移量
    CGFloat distanceWillMove = distanceOfCenterY / CGRectGetHeight(view.frame) * distanceH;
    
    // 5.更新图片的Y值
    CGRect backImageFrame = self.backImageView.frame;
    backImageFrame.origin.y = distanceWillMove - distanceH * 0.5;
    self.backImageView.frame = backImageFrame;
    
}

#pragma mark - setter
- (void)setBackImage:(UIImage *)backImage {
    _backImage = backImage;
    self.backImageView.image = backImage;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    // 裁剪超出部分
    self.clipsToBounds = YES;
}

@end
