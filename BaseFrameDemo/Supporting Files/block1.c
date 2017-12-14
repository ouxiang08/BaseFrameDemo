//
//  block.c
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/14.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

 #include <stdio.h>

int main() {
     int a = 100;
     void (^block2)(void) = ^{
             printf("%d\n", a);
         };
     block2();
     return 0;
}
