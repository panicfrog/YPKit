#define MAVLINK_MSG_ID_K2_MESSAGE 3 

typedef struct __mavlink_k2_message_t 
{
    int32_t latitude;
    int32_t longitude;
    float ground_speed;
    float alt;
    uint16_t battery_voltage;
    uint8_t num_stat;
    uint8_t arm_status;
} mavlink_k2_message_t; 


#define MAVLINK_MSG_ID_K2_MESSAGE_LEN 20

#define MAVLINK_MSG_ID_K2_MESSAGE_CRC 3 

static inline int32_t mavlink_msg_k2_message_get_latitude(const mavlink_message_t* msg)
{
    return _MAV_RETURN_int32_t(msg,  0);
}

static inline int32_t mavlink_msg_k2_message_get_longitude(const mavlink_message_t* msg)
{
    return _MAV_RETURN_int32_t(msg, 4);
}

static inline float mavlink_msg_k2_message_get_ground_speed(const mavlink_message_t* msg)
{
    return _MAV_RETURN_float(msg,  8);
} 

static inline float mavlink_msg_k2_message_get_alt(const mavlink_message_t* msg)
{
    return _MAV_RETURN_float(msg,  12);
}


static inline uint16_t mavlink_msg_k2_message_get_battery_voltage(const mavlink_message_t* msg)
{
    return _MAV_RETURN_uint16_t(msg,  16);
}


static inline uint8_t mavlink_msg_k2_message_get_num_stat(const mavlink_message_t* msg)
{
    return _MAV_RETURN_uint8_t(msg,  18);
}


static inline uint8_t mavlink_msg_k2_message_arm_status(const mavlink_message_t* msg)
{
    return _MAV_RETURN_uint8_t(msg,  19);
}


static inline void mavlink_msg_k2_message_decode(const mavlink_message_t* msg, mavlink_k2_message_t* k2_message)
{

    memcpy(k2_message, _MAV_PAYLOAD(msg), MAVLINK_MSG_ID_K2_MESSAGE_LEN);

}
