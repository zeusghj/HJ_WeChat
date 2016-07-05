//
//  DSTabBar.h
//  HJ_WeChat
//
//  Created by 郭洪军 on 7/5/16.
//  Copyright © 2016 郭洪军. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DSTabBar;
extern NSString* const KSELECTEDITEMNOTI;
@protocol DSTabBarDelegate <NSObject>

@optional

- (void)tabBarItemWithTabBar:(DSTabBar *)tabBar withSelectedItem:(NSUInteger)selectedIndex;

@end

@interface DSTabBar : UIView
- (void)tabBarWithTabBarItem:(UITabBarItem *)item;
/**
 *  selected index, default selected 0
 */
@property (nonatomic, assign)NSUInteger selectedIndex;
@property (nonatomic, assign)id<DSTabBarDelegate> delegate;

- (void)clickedTabBarIndex:(NSUInteger)index;

@end
