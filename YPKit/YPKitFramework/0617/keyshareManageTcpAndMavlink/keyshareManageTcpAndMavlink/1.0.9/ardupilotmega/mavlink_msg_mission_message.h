// MESSAGE LOG_ENTRY PACKING

//接收返回的航点信息
#define MAVLINK_MSG_ID_MISSION_MESSAGE 16

typedef struct __mavlink_mission_message
{
    float x; //正在执行的航点经度
    float y; //正在执行的航点的纬度
    float z; //正在执行的航点的高度
    uint16_t seq; //任务序号
    uint16_t reserve1;//保留

} mavlink_mission_message;

#define MAVLINK_MISSION_MESSAGE_LEN 16

#define MAVLINK_MSG_ID_16_CRC 244



static inline float mavlink_mission_message_get_x(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  0);
}


static inline float mavlink_mission_message_get_y(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  4);
}


static inline float mavlink_mission_message_get_z(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  8);
}


static inline uint16_t mavlink_mission_message_get_seq(const mavlink_message_t* msg)
{
	return _MAV_RETURN_uint16_t(msg,  12);
}


static inline uint16_t mavlink_mission_message_get_reserve1(const mavlink_message_t* msg)
{
    return _MAV_RETURN_uint16_t(msg,  14);
}



static inline void mavlink_mission_message_entry_decode(const mavlink_message_t* msg, mavlink_mission_message* mission_message)
{
	memcpy(mission_message, _MAV_PAYLOAD(msg), MAVLINK_MISSION_MESSAGE_LEN);

}
