#include<bits/stdc++.h>
using namespace std;

int main(){
    vector<int> fruits = {3,3,3,1,4};

    if(fruits.size()<3)
        return fruits.size();

    int tempmax = 1, max = 1, cnum = 1;
    int temp1 = fruits[0], temp2 = fruits[1];

    for(int i=1; i<fruits.size(); i++){
        if (fruits[i] !=  temp1 && fruits[i] !=  temp2){
            temp1 = fruits[i-1];
            temp2 = fruits[i];
            tempmax = cnum + 1;
        }else
            tempmax += 1;
        if (tempmax > max)
            max = tempmax;
        if (fruits[i] !=  fruits[i-1])
            cnum = 1 ;
        else
            cnum += 1;
    }

    cout << max << endl;
    return 0;
}
