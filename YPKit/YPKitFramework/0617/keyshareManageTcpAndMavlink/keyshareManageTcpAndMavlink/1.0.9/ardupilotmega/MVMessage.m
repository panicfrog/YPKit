//
//  MVMessage.m
//  MAVLink communications protocol built from ardupilotmega, common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"
#import "MVArdupilotmegaMessages.h"
#import "MVCommonMessages.h"

@implementation MVMessage

@synthesize message=_message;


+ (id)messageWithCMessage:(mavlink_message_t)message {
  static NSDictionary *messageIdToClass = nil;
  if (!messageIdToClass) {
    messageIdToClass = @{
      @0 : [MVMessageHeartbeat class],
      @1 : [MVMessageSysStatus class],
      @2 : [MVMessageSystemTime class],
      @3 : [MVMessagek2message class],
      @4 : [MVMessagePing class],
      @5 : [MVMessageChangeOperatorControl class],
      @6 : [MVMessageChangeOperatorControlAck class],
      @7 : [MVMessageAuthKey class],
      @8 :  [MVMessagek2messageack class],
      @11 : [MVMessageSetMode class],
      @13 : [MVMessagek2compasscali class],
      @16 : [MVMessagemission_message class],
      @17 : [MVMessageexceute class],
      @18 : [MVMessageexceutereturn class],
      @20 : [MVMessageParamRequestRead class],
      @21 : [MVMessageParamRequestList class],
      @22 : [MVMessageParamValue class],
      @23 : [MVMessageParamSet class],
      @24 : [MVMessageGpsRawInt class],
      @25 : [MVMessageGpsStatus class],
      @26 : [MVMessageScaledImu class],
      @27 : [MVMessageRawImu class],
      @28 : [MVMessageRawPressure class],
      @29 : [MVMessageScaledPressure class],
      @30 : [MVMessageAttitude class],
      @31 : [MVMessageAttitudeQuaternion class],
      @32 : [MVMessageLocalPositionNed class],
      @33 : [MVMessageGlobalPositionInt class],
      @34 : [MVMessageRcChannelsScaled class],
      @35 : [MVMessageRcChannelsRaw class],
      @36 : [MVMessageServoOutputRaw class],
      @37 : [MVMessageMissionRequestPartialList class],
      @38 : [MVMessageMissionWritePartialList class],
      @39 : [MVMessageMissionItem class],
      @40 : [MVMessageMissionRequest class],
      @41 : [MVMessageMissionSetCurrent class],
      @42 : [MVMessageMissionCurrent class],
      @43 : [MVMessageMissionRequestList class],
      @44 : [MVMessageMissionCount class],
      @45 : [MVMessageMissionClearAll class],
      @46 : [MVMessageMissionItemReached class],
      @47 : [MVMessageMissionAck class],
      @48 : [MVMessageSetGpsGlobalOrigin class],
      @49 : [MVMessageGpsGlobalOrigin class],
      @50 : [MVMessageSetLocalPositionSetpoint class],
      @51 : [MVMessageLocalPositionSetpoint class],
      @52 : [MVMessageGlobalPositionSetpointInt class],
      @53 : [MVMessageSetGlobalPositionSetpointInt class],
      @54 : [MVMessageSafetySetAllowedArea class],
      @55 : [MVMessageSafetyAllowedArea class],
      @56 : [MVMessageSetRollPitchYawThrust class],
      @57 : [MVMessageSetRollPitchYawSpeedThrust class],
      @58 : [MVMessageRollPitchYawThrustSetpoint class],
      @59 : [MVMessageRollPitchYawSpeedThrustSetpoint class],
      @60 : [MVMessageSetQuadMotorsSetpoint class],
      @61 : [MVMessageSetQuadSwarmRollPitchYawThrust class],
      @62 : [MVMessageNavControllerOutput class],
      @64 : [MVMessageStateCorrection class],
      @66 : [MVMessageRequestDataStream class],
      @67 : [MVMessageDataStream class],
      @69 : [MVMessageManualControl class],
      @70 : [MVMessageRcChannelsOverride class],
      @74 : [MVMessageVfrHud class],
      @76 : [MVMessageCommandLong class],
      @77 : [MVMessageCommandAck class],
      @89 : [MVMessageLocalPositionNedSystemGlobalOffset class],
      @90 : [MVMessageHilState class],
      @91 : [MVMessageHilControls class],
      @92 : [MVMessageHilRcInputsRaw class],
      @100 : [MVMessageOpticalFlow class],
      @101 : [MVMessageGlobalVisionPositionEstimate class],
      @102 : [MVMessageVisionPositionEstimate class],
      @103 : [MVMessageVisionSpeedEstimate class],
      @104 : [MVMessageViconPositionEstimate class],
      @117 : [MVMessageLogRequestList class],
      @118 : [MVMessageLogEntry class],
      @119 : [MVMessageLogRequestData class],
      @120 : [MVMessageLogData class],
      @150 : [MVMessageSensorOffsets class],
      @151 : [MVMessageSetMagOffsets class],
      @152 : [MVMessageMeminfo class],
      @153 : [MVMessageApAdc class],
      @154 : [MVMessageDigicamConfigure class],
      @155 : [MVMessageDigicamControl class],
      @156 : [MVMessageMountConfigure class],
      @157 : [MVMessageMountControl class],
      @158 : [MVMessageMountStatus class],
      @160 : [MVMessageFencePoint class],
      @161 : [MVMessageFenceFetchPoint class],
      @162 : [MVMessageFenceStatus class],
      @163 : [MVMessageAhrs class],
      @164 : [MVMessageSimstate class],
      @165 : [MVMessageHwstatus class],
      @166 : [MVMessageRadio class],
      @249 : [MVMessageMemoryVect class],
      @250 : [MVMessageDebugVect class],
      @251 : [MVMessageNamedValueFloat class],
      @252 : [MVMessageNamedValueInt class],
      @253 : [MVMessageStatustext class],
      @254 : [MVMessageDebug class],
    };
  }

  Class messageClass = messageIdToClass[@(message.msgid)];
  // Store unknown messages to MVMessage
  if (!messageClass) {
    messageClass = [MVMessage class];
  }

    //initWithCMessage这个将message 与对象的—message关联了
  return [[messageClass alloc] initWithCMessage:message];
}

- (id)initWithCMessage:(mavlink_message_t)message {
  if ((self = [super init])) {
    self->_message = message;
  }
  return self;
}

- (NSData *)data {
  uint8_t buffer[MAVLINK_MAX_PACKET_LEN];

  NSInteger length = mavlink_msg_to_send_buffer(buffer, &self->_message);

    //bytes to data
  return [NSData dataWithBytes:buffer length:length];
}

- (uint8_t)systemId {
  return self->_message.sysid;
}

- (uint8_t)componentId {
  return self->_message.compid;
}

- (uint8_t)messageId {
  return self->_message.msgid;
}

- (uint8_t)current_seq {
    return self->_message.seq;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, systemId=%d, componentId=%d", [self class], self.systemId, self.componentId];
}

@end
