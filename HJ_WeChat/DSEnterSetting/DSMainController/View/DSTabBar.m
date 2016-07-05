//
//  DSTabBar.m
//  HJ_WeChat
//
//  Created by 郭洪军 on 7/5/16.
//  Copyright © 2016 郭洪军. All rights reserved.
//

#import "DSTabBar.h"
#import "DSTabBarItem.h"

NSString* const KSELECTEDITEMNOTI = @"kselectedNoti";

@interface DSTabBar ()<DSTabBarItemDelegate> {
    struct {
        unsigned int tabBarItemClickedState : 1;
    }_tabBarItemWithTabBar;
    NSInteger _index;
}

@property (nonatomic, strong)DSTabBarItem* selectedItem;

@end

@implementation DSTabBar

- (void)tabBarWithTabBarItem:(UITabBarItem *)item
{
    DSTabBarItem* tabBarItem = [[DSTabBarItem alloc] init];
    tabBarItem.delegate = self;
    [self addSubview:tabBarItem];
    tabBarItem.item = item;
}

- (void)setDelegate:(id<DSTabBarDelegate>)delegate
{
    _delegate = delegate;
    _tabBarItemWithTabBar.tabBarItemClickedState = [_delegate respondsToSelector:@selector(tabBarItemWithTabBar:withSelectedItem:)];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarItemSelected:) name:KSELECTEDITEMNOTI object:nil];
}

- (void)clickedTabBarIndex:(NSUInteger)index
{
    DSTabBarItem* item = self.subviews[index];
    self.selectedItem.selected = NO;
    item.selected = YES;
    self.selectedItem = item;
}

- (void)tabBarItemSelected:(NSNotification *)noti
{
    NSInteger index = [noti.object integerValue];
    DSTabBarItem *item = self.subviews[index];
    self.selectedItem.selected = NO;
    item.selected = YES;
    self.selectedItem = item;
}

- (void)tabBarItemSelectedWithItem:(DSTabBarItem *)item
{
    if (_tabBarItemWithTabBar.tabBarItemClickedState) {
        [_delegate tabBarItemWithTabBar:self withSelectedItem:item.tag];
    }
    self.selectedItem.selected = NO;
    item.selected = YES;
    self.selectedItem = item;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    for (int i = 0; i<self.subviews.count; ++i) {
        DSTabBarItem* item = self.subviews[i];
        CGFloat buttonX = i * buttonW;
        item.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        item.tag = i;
    }
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
