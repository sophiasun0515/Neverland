//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//


// Import all the things
#import "JSQMessages.h"

#import "DemoModelData.h"
#import "NSUserDefaults+DemoSettings.h"


@class DemoMessagesViewController;

@protocol JSQDemoViewControllerDelegate <NSObject>
- (void)didDismissJSQDemoViewController:(DemoMessagesViewController *)vc;

@end




@interface DemoMessagesViewController : JSQMessagesViewController <UIActionSheetDelegate, JSQMessagesComposerTextViewPasteDelegate>

@property (nonatomic, strong) NSString *senderId; // phone identifier

@property (nonatomic) int groupChatIndex;
@property (nonatomic, strong) NSString *groupChatName;
@property (nonatomic, strong) NSString *characterName;
@property (nonatomic, strong) NSString *characterImageName;
@property (nonatomic, strong) UIImage *characterImage;



@property (weak, nonatomic) id<JSQDemoViewControllerDelegate> delegateModal;

@property (strong, nonatomic) DemoModelData *demoData;

- (void)closePressed:(UIBarButtonItem *)sender;

@end
