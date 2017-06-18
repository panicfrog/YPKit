#define MAVLINK_MSG_ID_K2_MESSAGE_ACK 8

typedef struct  __mavlink_k2_message_ack_t
{
    uint8_t ack_type; ///应答类型
    uint8_t ack_value; ///应答值
} mavlink_k2_message_ack_t;

//参数：
//megid = 8		//指令ID
//
//全景自拍
//ack_type = 1;	 //全景自拍应答
//ack_value = 1;  //已经完成旋转
//
//解锁判断
//ack_type = 2;	 //解锁判断应答
//ack_value =  1解锁成功 2解锁失败


#define MAVLINK_MSG_ID_K2_MESSAGE_ACK_LEN 2

#define MAVLINK_MSG_ID_K2_MESSAGE_ACK_CRC 8

static inline uint8_t mavlink_msg_k2_message_get_ack_type(const mavlink_message_t* msg)
{
    return _MAV_RETURN_uint8_t(msg,  0);
}

static inline uint8_t mavlink_msg_k2_message_get_ack_value(const mavlink_message_t* msg)
{
    return _MAV_RETURN_uint8_t(msg,  1);
}

static inline void mavlink_msg_k2_message_ack_decode(const mavlink_message_t* msg, mavlink_k2_message_ack_t* k2_message)
{

    memcpy(k2_message, _MAV_PAYLOAD(msg), MAVLINK_MSG_ID_K2_MESSAGE_ACK_LEN);

}
