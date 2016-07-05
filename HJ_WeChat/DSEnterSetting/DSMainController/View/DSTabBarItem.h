//
//  DSTabBarItem.h
//  HJ_WeChat
//
//  Created by 郭洪军 on 7/5/16.
//  Copyright © 2016 郭洪军. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSTabBarItem;

@protocol DSTabBarItemDelegate <NSObject>

@optional

- (void)tabBarItemSelectedWithItem:(DSTabBarItem *)item;

@end

@interface DSTabBarItem : UIView

@property (nonatomic, assign) BOOL selected;
@property (nonatomic, strong) UITabBarItem* item;
@property (nonatomic, weak) id<DSTabBarItemDelegate> delegate;

@end
