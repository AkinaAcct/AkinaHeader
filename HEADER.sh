#by Akina | LuoYan

# 特殊变量
RED="\033[1;31m"          # RED
YELLOW="\033[1;33m"       # YELLOW
BLUE="\033[40;34m"        # BLUE
RESET="\033[0m"           # RESET
RANDOMNUM="$(date "+%N")" # RANDOM NUMBER

# 格式化打印消息
msg_info() { # 打印消息 格式: "[INFO] TIME: MSG"(BLUE)
	printf "${BLUE}%s${RESET}" "[INFO]$(date "+%H:%M:%S"): $1"
}
msg_warn() { # 打印消息 格式: "[WARN] TIME: MSG"(YELLOW)
	printf "${YELLOW}%s${RESET}" "[WARN]$(date "+%H:%M:%S"): $1"
}
msg_err() { # 打印消息 格式: "[ERROR] TIME: MSG"(RED)
	printf "${RED}%s${RESET}" "[ERROR]$(date "+%H:%M:%S"): $1"
}

# 日志记录
LOGPATH="${HOME}/log.txt"
log_info() {
	printf "%s" "[INFO]$(date "+%H:%M:%S.%N"): $1" >${LOGPATH}
}
log_warn() {
	printf "%s" "[WARN]$(date "+%H:%M:%S.%N"): $1" >${LOGPATH}
}
log_err() {
	printf "%s" "[INFO]$(date "+%H:%M:%S.%N"): $1" >${LOGPATH}
}

# 有用的函数
download_check() {
	EXITSTATUS=$?
	if [[ $EXITSTATUS -ne 0 ]]; then
		msg_err "Download failed!"
	fi
	return $EXITSTATUS
}
