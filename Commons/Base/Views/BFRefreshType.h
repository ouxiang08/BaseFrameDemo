//
//  BFRefreshType.h
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#ifndef BFRefreshType_h
#define BFRefreshType_h

typedef enum {
    BFRefreshTypeTop = 1 << 0,
    BFRefreshTypeBottom = 1 << 1,
    BFRefreshTypeBoth = 1 << 2,
    BFRefreshTypeNone = 1 << 3,
}BFRefreshType;

#endif /* BFRefreshType_h */
