#include <log/log.h>
#include <cutils/log.h>
#include <sys/stat.h>
#include <fcntl.h>

#define XLOG_DEVICE "/proc/xlog/setfil"

#define XLOG_NAME_MAX_LEN 64

#define XLOG_SET_LEVEL       12
#define XLOG_GET_LEVEL       13

#define XLOG_FILTER_DEFAULT_LEVEL 0x00223222

#define LOG_TAG "xlog"

int xlogf_set_level(uint32_t level)
{
    int ret = -1;
    int fd = open(XLOG_DEVICE, O_RDONLY);
    if (fd >= 0) {
        if (ioctl(fd, XLOG_SET_LEVEL, level) == 0) {
            ret = 0;
        }
        close(fd);
    }
    return ret;
}

uint32_t xlogf_get_level(void)
{
    uint32_t level = XLOG_FILTER_DEFAULT_LEVEL;
    int fd = open(XLOG_DEVICE, O_RDONLY);
    if (fd >= 0) {
        ioctl(fd,XLOG_GET_LEVEL, &level);
        close(fd);
    }

    return level;
}
