// MESSAGE LOG_ENTRY PACKING


#define MAVLINK_MSG_ID_EXECUTE_RETURN 18

typedef struct __mavlink_execute_return_t
{
    uint16_t command; /*< the action being executed*/
    uint16_t reserve1; /*< the progress of the action*/
    uint16_t reserve2; /*< reserved for future*/
}mavlink_execute_return_t;

#define MAVLINK_MSG_ID_EXECUTE_RETURN_LEN 6
#define MAVLINK_MSG_ID_EXECUTE_RETURN_CRC 38 



static inline uint16_t mavlink_mission_execute_return_command(const mavlink_message_t* msg)
{
	return _MAV_RETURN_uint16_t(msg,  0);
}


static inline uint16_t mavlink_mission_execute_return_reserve1(const mavlink_message_t* msg)
{
    return _MAV_RETURN_uint16_t(msg,  2);
}

static inline uint16_t mavlink_mission_execute_return_reserve2(const mavlink_message_t* msg)
{
    return _MAV_RETURN_uint16_t(msg,  4);
}


static inline void mavlink_execute_return_decode(const mavlink_message_t* msg, mavlink_execute_return_t* execute_return)
{
	memcpy(execute_return, _MAV_PAYLOAD(msg), MAVLINK_MSG_ID_EXECUTE_RETURN_LEN);

}
