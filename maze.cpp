#include <iostream>
#include <math.h>
#include <stdlib.h>
int random(int n) {return rand() % n; }
void randomize() {srand(time(NULL)); }
using namespace std;
int main(void)
int mz[30][30];
int i,j;
//initial
for(i=0;i<30;i++)
for(j=0;j<30;j++)
mz[i]lj]=0;
//make border
for(i=0;i<30;i++)
mz[0][i]=1;
mz[29][i]=1;
mz[i][0]=1;
mz[i][29]=1;
int xx,yy;
//random position
int x_tmp,y_tmp; //backup position
int dir;
//directory way
int count;
randomize();
for(i-0;i<100;i++)
//取偶數點
XX =
(random(14)+1)*2;
yy = (random(14)+1)*2;
x_tmp = xx;
y_tmp = yy;
if(mz[xx][yy] ==0)f
dof
count = 0;
xx = x_tmp;
yy = y_tmp;
dir = random(4);
cout << "dir:" << dir << endl;
count = count + 1;
switch (dir)
case 0: xx = xx-1;
break;
case 1: xx = xx+1;
break;
case 2: yy = yy+1;
break;
case 3: yy = yy-1;
break;
while(mz[xx][yy]!=1),//確認是否已經碰到牆壁
cout << "count:" << count << endl;
while(count>10);//長度不能超過陣列-邊緣的長度否則會生死路
xx = x_tmp;
yy =y tmp;
dof
dof
mz[xx][yy]=1,
switch (dir)
case 9: xx m XX-1;
break;
case 11 xx - xx+1;
break;
應用程式
大二-Google雲端...
痞客邦
case 2: yy = yy+1;
break;
case 3: yy = yy-1;
break;
Jwhile(mz[xx][yy]!=1);
l//if end
//列印迷宮
for(i0;ik30;i++)(
for(j=0;j<30;j++)(
if(mz[i][j]==1)
cout <く "a";
else
cout << "ㅁ";
cout << endl;
cin.get();
