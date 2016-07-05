//
//  DSMainController.m
//  HJ_WeChat
//
//  Created by 郭洪军 on 7/5/16.
//  Copyright © 2016 郭洪军. All rights reserved.
//

#import "DSMainController.h"
#import "DSTabBar.h"
#import "DSWeChatController.h"
#import "DSAddressBookController.h"
#import "DSFindController.h"
#import "DSMineController.h"

@interface DSMainController ()<DSTabBarDelegate>

@property (nonatomic, strong) DSTabBar* customerTabBar;

@end

@implementation DSMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBar addSubview:self.customerTabBar];
    
    [self loadSubViewControllers];
    
    
    
}

- (void)loadSubViewControllers
{
    DSWeChatController *weChat = [[DSWeChatController alloc] init];
    [self addTabBarItemWithController:weChat
                            WithTitle:@"微信"
                            withImage:@"tabbar_mainframe.png"
                   withHighlightImage:@"tabbar_mainframeHL.png"];
    
    DSAddressBookController *addressBook = [[DSAddressBookController alloc] init];
    [self addTabBarItemWithController:addressBook
                            WithTitle:@"通讯录"
                            withImage:@"tabbar_contacts.png"
                   withHighlightImage:@"tabbar_contactsHL.png"];
    
    DSFindController *find = [[DSFindController alloc] init];
    [self addTabBarItemWithController:find
                            WithTitle:@"发现"
                            withImage:@"tabbar_discover.png"
                   withHighlightImage:@"tabbar_discoverHL.png"];
    
    DSMineController *mine = [[DSMineController alloc] init];
    [self addTabBarItemWithController:mine
                            WithTitle:@"我"
                            withImage:@"tabbar_me.png"
                   withHighlightImage:@"tabbar_meHL.png"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView* view in self.tabBar.subviews) {
        if ([view isKindOfClass:[UIControl class]]) {
            [view removeFromSuperview];
        }
    }
}

- (void)tabBarItemWithTabBar:(DSTabBar *)tabBar withSelectedItem:(NSUInteger)selectedIndex
{
    self.selectedIndex = selectedIndex;
}

- (void)addTabBarItemWithController:(UIViewController *)controller WithTitle:(NSString *)title withImage:(NSString *)image withHighlightImage:(NSString *)highlightImage
{
    controller.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:image];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:highlightImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *naController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:naController];
    [self.customerTabBar tabBarWithTabBarItem:controller.tabBarItem];
}

- (DSTabBar *)customerTabBar
{
    if (!_customerTabBar) {
        _customerTabBar = [[DSTabBar alloc] init];
        _customerTabBar.frame = self.tabBar.bounds;
        _customerTabBar.delegate = self;
    }
    
    return _customerTabBar;
}

@end



















































