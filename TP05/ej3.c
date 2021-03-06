#include <stdint.h>

void timeToString();
char getFirstDigit(uint8_t num);
char getSecondDigit(uint8_t num);
void writeToScreen(char * str, unsigned color);
extern uint8_t get_sec();
extern uint8_t get_min();
extern uint8_t get_hr();

const char * screenStart = 0xB8000;

char getFirstDigit(uint8_t num) {
	return (char)(num / 10 + '0');
}

char getSecondDigit(uint8_t num) {
	return (char)(num % 10 + '0');
}

void timeToString() {
	int i;
	char str[9];
	uint8_t time[3];
	time[0] = get_hr();
	time[1] = get_min();
	time[2] = get_sec();
	for(i = 0; i < 3; i++) {
		str[i * 3] = getFirstDigit(time[i]);
		str[i * 3 + 1] = getSecondDigit(time[i]);
		char separator = ':';
		if(i == 2)
			separator = '\0';
		str[i * 3 + 2] = separator;
	}
	writeToScreen(str, 0xF2);
}

/*Color format: 0xF2 == White background (F), Green characters (2)*/
void writeToScreen(char * str, unsigned color) {
	char * pointer = screenStart;
	while(*str != '\0' && pointer - screenStart < 80 * 25) {
		*(pointer++) = *str;
		*(pointer++) = color;
		str++;
	}
}