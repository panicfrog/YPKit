

#define MAVLINK_MSG_ID_EXCEUTE 17 

typedef struct __mavlink_execute
{
    uint16_t command; // 保留
    uint16_t reserve1; //低位对应关系,见表二。高位不用
    uint16_t reserve2;//预留
} mavlink_execute;

#define MAVLINK_EXECUTE_LEN 6
#define MAVLINK_EXECUTE_CRC 181


static inline uint16_t mavlink_execute_pack(uint8_t system_id, uint8_t component_id, mavlink_message_t* msg,uint16_t command, uint16_t reserve1,uint16_t reserve2)
{
    
    mavlink_execute packet;
    packet.command = command;
    packet.reserve1 = reserve1;
    packet.reserve2 = reserve2;
    
    
    memcpy(_MAV_PAYLOAD_NON_CONST(msg), &packet, MAVLINK_EXECUTE_LEN);
    
    msg->msgid = MAVLINK_MSG_ID_EXCEUTE;
    
#if MAVLINK_CRC_EXTRA
    return mavlink_finalize_message(msg, system_id, component_id, MAVLINK_EXECUTE_LEN, MAVLINK_EXECUTE_CRC);
#else
    return mavlink_finalize_message(msg, system_id, component_id, MAVLINK_EXECUTE_LEN);
#endif
    
}

