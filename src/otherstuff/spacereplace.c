#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#define NELEMS(x)  (sizeof(x) / sizeof((x)[0]))

int getspaceNum(char *str, int length) {
    int num = 0;
    for (int i = 0; i < length; i++) {
        if(str[i] == ' ') {
            num++;
        } else if (str[i] == '\0') {
            break;
        }
    }
    return num;
}
int getlength(char *str, int length) {
    int num = 0;
    for (int i = 0; i < length; i++) {
        if (str[i] == '\0') {
            break;
        }
        num++;
    }
    return num;
}

void replaceSpace(char str[],int length) {
    int spaceNum = getspaceNum(str,length);
//    char* emptystr = "";
//    for (int i = 0;i < spaceNum;i++) {
//        strcat(emptystr, "  ");
//    }
//    
//    strcat(str, emptystr);
    int catedLength = spaceNum*2+getlength(str,length);
    if (catedLength > length) {
        return;
    }
    
    for (int i = getlength(str,length);i>=0;i--) {
        if (str[i]== ' ') {
            str[catedLength] = '0';
            str[catedLength-1] = '2';
            str[catedLength-2] = '%';
            catedLength -= 3;
        } else {
            str[catedLength] = str[i];
            catedLength --;
        }
    }
}
        

int main() {
    char str[100] = "we are happy." ;
    replaceSpace(str, 100);
    printf("%s\n", str);

   return 0;
}
