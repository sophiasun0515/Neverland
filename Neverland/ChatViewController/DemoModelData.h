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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <FirebaseDatabase/FirebaseDatabase.h>
#import "JSQMessages.h"

@class DemoMessagesViewController;
//@interface DemoMessagesViewController
//@end

/**
 *  This is for demo/testing purposes only. 
 *  This object sets up some fake model data.
 *  Do not actually do anything like this.
 */

static NSString * const kJSQDemoAvatarDisplayNameSquires = @"Jesse Squires";
static NSString * const kJSQDemoAvatarDisplayNameCook = @"Tim Cook";
static NSString * const kJSQDemoAvatarDisplayNameJobs = @"Jobs";
static NSString * const kJSQDemoAvatarDisplayNameWoz = @"Steve Wozniak";

static NSString * const kJSQDemoAvatarIdSquires = @"053496-4509-289";
static NSString * const kJSQDemoAvatarIdCook = @"468-768355-23123";
static NSString * const kJSQDemoAvatarIdJobs = @"707-8956784-57";
static NSString * const kJSQDemoAvatarIdWoz = @"309-41802-93823";



@interface DemoModelData : NSObject

// internet connectivity related
@property (strong, nonatomic) FIRDatabaseReference *globalReference;
@property (nonatomic) FIRDatabaseHandle globalRefereneceHandle;

@property (strong, nonatomic) FIRDatabaseReference *roomReference;
@property (nonatomic) FIRDatabaseHandle *roomReferenceHandle;
@property (nonatomic, weak) DemoMessagesViewController *delegate;
@property (strong, nonatomic) NSString *roomNumber;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *senderId;
@property (strong, nonatomic) NSString *characterImageName;

- (void)sendMessage:(JSQMessage *)message;
- (instancetype)initWithRoomNumber:(NSString *)numberString withGroupName: (NSString *)groupName withCharacterImage: (UIImage *)characterImage withcharacterImageName:(NSString *)characterImageName ;
@property (strong, nonatomic) NSMutableArray *messages;

@property (strong, nonatomic) NSDictionary *avatars;

@property (strong, nonatomic) JSQMessagesBubbleImage *outgoingBubbleImageData;

@property (strong, nonatomic) JSQMessagesBubbleImage *incomingBubbleImageData;

@property (strong, nonatomic) NSDictionary *users;

- (void)addPhotoMediaMessage;

- (void)addLocationMediaMessageCompletion:(JSQLocationMediaItemCompletionBlock)completion;

- (void)addVideoMediaMessage;

- (void)addVideoMediaMessageWithThumbnail;

- (void)addAudioMediaMessage;
- (void)detatchListener;

@end
