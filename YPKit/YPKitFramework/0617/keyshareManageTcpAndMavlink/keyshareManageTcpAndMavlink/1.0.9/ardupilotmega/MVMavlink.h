//
//  MVMavlink.h
//  MAVLink communications protocol built from ardupilotmega, common.xml
//
//  Created on Mon Sep 14 23:43:05 2015 by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"
#import "MVArdupilotmegaMessages.h"
#import "MVCommonMessages.h"

@class MVMavlink;
@protocol MVMessage;

@protocol MVMavlinkDelegate <NSObject>

/*!
 Method called on the delegate when a full message has been received. Note that this may be called multiple times when parseData: is called, if the data passed to parseData: contains multiple messages.

 @param mavlink The MVMavlink object calling this method
 @param message The id<MVMessage> class containing the parsed message
 */
- (void)mavlink:(MVMavlink *)mavlink didGetMessage:(id<MVMessage>)message;

/*!
 Method called on the delegate when data should be sent.

 @param mavlink The MVMavlink object calling this method
 @param data NSData object containing the bytes to be sent
 */
- (BOOL)mavlink:(MVMavlink *)mavlink shouldWriteData:(NSData *)data;

@end

/*!
 Class for parsing and sending instances of id<MVMessage>

 @discussion MVMavlink receives a stream of bytes via the parseData: method and calls the delegate method mavlink:didGetMessage: each time a message is fully parsed. Users of MVMavlink can call parseData: anytime they get new data, even if that data does not contain a complete message.
 */
@interface MVMavlink : NSObject
@property (weak, nonatomic) id<MVMavlinkDelegate> delegate;

/*!
 Parse byte data received from a MAVLink byte stream.

 @param data NSData containing the received bytes
 */
- (void)parseData:(NSData *)data;

/*!
 Compile MVMessage object into a bytes and pass to the delegate for sending.

 @param message Object conforming to the MVMessage protocol that represents the data to be sent
 @return YES if message sending was successful
 */
- (BOOL)sendMessage:(id<MVMessage>)message;

@end
