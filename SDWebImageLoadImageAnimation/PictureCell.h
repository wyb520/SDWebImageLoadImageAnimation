//
//  PictureCell.h
//  SDWebImageLoadImageAnimation
//
//  Created by YouXianMing on 15/4/30.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureModel.h"

#define  FLAG_PictureCell     @"PictureCell"
#define  HEIGHT_PictureCell   200.f

@interface PictureCell : UITableViewCell

- (void)loadData:(id)data withIndexPath:(NSIndexPath *)indexPath;

@end
