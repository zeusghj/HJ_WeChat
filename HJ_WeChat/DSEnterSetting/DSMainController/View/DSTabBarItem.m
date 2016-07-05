//
//  DSTabBarItem.m
//  HJ_WeChat
//
//  Created by 郭洪军 on 7/5/16.
//  Copyright © 2016 郭洪军. All rights reserved.
//

#import "DSTabBarItem.h"
#import "DSGlobal.h"

@interface DSTabBarItem ()
{
    struct {
        unsigned int TabBarSelectedState : 1;
    }_tabBarSelected;
}

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end


@implementation DSTabBarItem

- (instancetype)init
{
    if (self = [super init]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"DSTabBarItem" owner:nil options:nil].lastObject;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(itemClicked)];
        [self addGestureRecognizer:tap];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noticeLanguageSwitch) name:KLanguageSwitching object:nil];
        self.selected = NO;
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)noticeLanguageSwitch
{
    NSLog(@"语言改变 notificationcenter....") ;
}

- (void)itemClicked
{
    if (_tabBarSelected.TabBarSelectedState) {
        [_delegate tabBarItemSelectedWithItem:self];
    }
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    self.titleLabel.text = item.title;
    self.iconImage.image = item.image;
}

- (void)setDelegate:(id<DSTabBarItemDelegate>)delegate
{
    _delegate = delegate;
    _tabBarSelected.TabBarSelectedState = [delegate respondsToSelector:@selector(tabBarItemSelectedWithItem:)];
}

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    
    if (selected) {
        self.titleLabel.textColor = [UIColor greenColor];
        self.iconImage.image = self.item.selectedImage;
    }else
    {
        self.titleLabel.textColor = [UIColor blackColor];
        self.iconImage.image = self.item.image;
    }
}

























































@end
