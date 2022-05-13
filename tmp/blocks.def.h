//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"🔔 ", "yay -Qu | wc -l",	60,		0},
	{"🐳 ", "docker ps -q | wc -l",	60,		0},
	{"💾 ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
	{"", "dwmCpuTemp",	5,		0},
	{"", "dwmCpu",		5,		0},
	{"", "dwmWifi",		30,		0},
	{"🗓 ", "date +'%a %d/%m-%y'",3600,		0},
	{"", "dwmVolume",	2,		0},
	{"", "dwmBattery",	30,		0},
	{"", "dwmClock",	5,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
