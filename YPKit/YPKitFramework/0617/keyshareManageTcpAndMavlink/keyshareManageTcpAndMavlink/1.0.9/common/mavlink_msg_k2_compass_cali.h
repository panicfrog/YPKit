#define KSLINK_MSG_ID_K2_COMPASS_CALI 13

typedef struct __kslink_k2_compass_cali
{
    uint8_t cali_flag;//0---5
    uint8_t xy_cali_step;//0--108
    uint8_t z_cali_step;//0--108
} kslink_k2_compass_cali;

#define KSLINK_K2_COMPASS_CALI_LEN 3

#define KSLINK_K2_COMPASS_CALI_CRC 13



static inline uint16_t kslink_k2_compass_cali_pack(uint8_t system_id, uint8_t component_id, mavlink_message_t* msg,uint8_t cali_flag, uint8_t xy_cali_step,uint8_t z_cali_step )
{

    kslink_k2_compass_cali packet;
    packet.cali_flag = cali_flag;
    packet.xy_cali_step = xy_cali_step;
    packet.z_cali_step = z_cali_step;

    
    memcpy(_MAV_PAYLOAD_NON_CONST(msg), &packet, KSLINK_K2_COMPASS_CALI_LEN);

    msg->msgid = KSLINK_MSG_ID_K2_COMPASS_CALI;
    
#if MAVLINK_CRC_EXTRA
    return mavlink_finalize_message(msg, system_id, component_id, KSLINK_K2_COMPASS_CALI_LEN, KSLINK_K2_COMPASS_CALI_CRC);
#else
    return mavlink_finalize_message(msg, system_id, component_id, KSLINK_K2_COMPASS_CALI_LEN);
#endif
    
}


static inline uint8_t mavlink_msg_k2_compass_cali_get_cali_flag(const mavlink_message_t* msg)
{
    return _MAV_RETURN_uint8_t(msg,  0);
}

static inline uint8_t mavlink_msg_k2_compass_cali_get_xy_cali_step(const mavlink_message_t* msg)
{
    return _MAV_RETURN_uint8_t(msg,  1);
}

static inline uint8_t mavlink_msg_k2_compass_cali_get_z_cali_step(const mavlink_message_t* msg)
{
    return _MAV_RETURN_uint8_t(msg,  2);
}

static inline void mavlink_msg_k2_compass_cali_decode(const mavlink_message_t* msg, kslink_k2_compass_cali* k2_message)
{

    memcpy(k2_message, _MAV_PAYLOAD(msg), KSLINK_K2_COMPASS_CALI_LEN);

}
