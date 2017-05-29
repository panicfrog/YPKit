//
//  YPBlock.m
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import "YPBlock.h"


struct YPBlockLiteral {
    void *isa; // initialized to &_NSConcreteStackBlock or &_NSConcreteGlobalBlock
    int flags;
    int reserved;
    void (*invoke)(void *, ...);
    struct block_descriptor {
        unsigned long int reserved;	// NULL
        unsigned long int size;         // sizeof(struct Block_literal_1)
        // optional helper functions
        void (*copy_helper)(void *dst, void *src);     // IFF (1<<25)
        void (*dispose_helper)(void *src);             // IFF (1<<25)
        // required ABI.2010.3.16
        const char *signature;                         // IFF (1<<30)
    } *descriptor;
    // imported variables
};

enum YPBlockDescriptionFlags {
    YPBlockDescriptionFlagsHasCopyDispose = (1 << 25),
    YPBlockDescriptionFlagsHasCtor = (1 << 26), // helpers have C++ code
    YPBlockDescriptionFlagsIsGlobal = (1 << 28),
    YPBlockDescriptionFlagsHasStret = (1 << 29), // IFF BLOCK_HAS_SIGNATURE
    YPBlockDescriptionFlagsHasSignature = (1 << 30)
};

NSMethodSignature *YPMethodSignature(id block) {
    struct YPBlockLiteral *blockRef = (__bridge struct YPBlockLiteral *)block;
    enum YPBlockDescriptionFlags flags = blockRef->flags;
    
    if (flags & YPBlockDescriptionFlagsHasSignature) {
        void *signatureLocation = blockRef->descriptor;
        signatureLocation += sizeof(unsigned long int);
        signatureLocation += sizeof(unsigned long int);
        
        if (flags & YPBlockDescriptionFlagsHasCopyDispose) {
            signatureLocation += sizeof(void(*)(void *dst, void *src));
            signatureLocation += sizeof(void(*)(void *src));
        }
        
        const char *signature = (* (const char **)signatureLocation);
        return [NSMethodSignature signatureWithObjCTypes:signature];
    }
    return 0;
}

NSUInteger YPArgCount(id block) {
    return YPMethodSignature(block).numberOfArguments;
}

@implementation YPBlock




@end
