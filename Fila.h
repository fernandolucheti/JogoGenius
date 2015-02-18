//
//  Fila.h
//  Genius
//
//  Created by Lidia Chou on 2/13/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fila : NSObject
{
    NSMutableArray *elementos;
}
-(void) enfileirar:(NSObject *)elem;
-(void) desenfileirar;
-(NSObject *) ler;
-(BOOL) vazio;
-(void) limpar;


@end
