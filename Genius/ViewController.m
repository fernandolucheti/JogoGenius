//
//  ViewController.m
//  Genius
//
//  Created by Lidia Chou on 2/13/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

#import "ViewController.h"
#include <stdlib.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize numRodadas, jogada;


- (void)viewDidLoad {
    [super viewDidLoad];
    sequencia = [Fila new];
    numRodadas = 0;
    qtdJogada = 0;
    _botaoAmarelo.enabled = NO;
    _botaoAzul.enabled = NO;
    _botaoVerde.enabled = NO;
    _botaoVermelho.enabled = NO;
    _fieldNome.hidden = YES;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) confere: (NSInteger)num{
    
    if(jogada >0){
        NSNumber *numero = (NSNumber *)[sequencia ler];
        NSInteger n = [numero integerValue];
        [sequencia desenfileirar];
        if (n == num){
            [sequencia enfileirar:numero];
            jogada = jogada - 1;
            [self acertou];
            if (jogada == 0){
                [self rodada];
            }
            
            
        }else{
            
            [sequencia limpar];
            [self perdeu];
            
        }
        
    }else{
        
        double delayInSeconds = 4.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self pronto];
            [self rodada];
        });
        
    }
}

-(void)acertou{
    [UIView animateWithDuration:0.00001 animations:^{
        _botaoAcertou.backgroundColor = [UIColor greenColor];
    }];
    double delayInSeconds = 0.000001;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self resetarCor];
    });
}
-(void)pronto{
    [UIView animateWithDuration:1.0 animations:^{
        _botaoAcertou.backgroundColor = [UIColor whiteColor];
    }];
    double delayInSeconds = 0.01;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self resetarCor];
    });
}


- (IBAction)clickAmarelo:(UIButton *)sender {
    
    [self confere:0];
    
}

- (IBAction)clickVermelho:(UIButton *)sender {
        [self confere:1];
}

- (IBAction)clickVerde:(UIButton *)sender {
        [self confere:2];
}

- (IBAction)clickAzul:(UIButton *)sender {
        [self confere:3];
}

- (IBAction)clickHighScore:(UIButton *)sender {
    _score1.text = _fieldNome.text;
    _botaoHighScore.hidden = YES;
    _fieldNome.hidden = YES;
    _fieldNome.text = @"Seu Nome";
    
}






- (IBAction)botaoVermelho:(UIButton *)sender {
}

- (IBAction)Amarelo1:(UIButton *)botao {
    [self confere:0];
}
- (void) proxRodada {
    numRodadas = numRodadas +1;
    NSInteger numAleat = arc4random_uniform(4);
    [sequencia enfileirar:[NSNumber numberWithInteger:numAleat]];
}
-(void) perdeu{
    [UIView animateWithDuration:0.9 animations:^{
        _botaoAmarelo.backgroundColor = [UIColor redColor];
        _botaoAzul.backgroundColor = [UIColor redColor];
        _botaoVerde.backgroundColor = [UIColor redColor];
        _botaoVermelho.backgroundColor = [UIColor redColor];
        _botaoAcertou.backgroundColor = [UIColor redColor];
        
    }];
    NSInteger valor = [_scoreValue1.text integerValue];
    if (numRodadas > valor){
        _botaoHighScore.hidden = NO;
        _scoreValue1.text = [NSString stringWithFormat:@"%ld", (long)numRodadas];
        _fieldNome.hidden = NO;
        
        [self acertou];
    }
    qtdJogada = qtdJogada +1;
    numRodadas = 0;
    _labelnVezes.text = [NSString stringWithFormat:@"%ld", (long)qtdJogada];
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self resetarCor];
        _botaoJogar.hidden = NO;
        [UIView animateWithDuration:0.4 animations:^{
            _botaoJogar.backgroundColor= [UIColor redColor];
        }];
    });
}

- (void) resetarCor{
    [UIView animateWithDuration:1.0 animations:^{
    _botaoAmarelo.backgroundColor = [UIColor blackColor];
    _botaoAzul.backgroundColor = [UIColor blackColor];
    _botaoVerde.backgroundColor = [UIColor blackColor];
    _botaoVermelho.backgroundColor = [UIColor blackColor];
        _botaoAcertou.backgroundColor = [UIColor blackColor];
         }];
    
    
}


-(void) mostraCor
{
    NSNumber *numero = (NSNumber *)[sequencia ler];
    [sequencia desenfileirar];
    
        
    
    switch ([numero integerValue]) {
        case 0:
        {
            _botaoAmarelo.backgroundColor = [UIColor yellowColor];
            
            
            break;
        }
        case 1:
        {
            _botaoVermelho.backgroundColor = [UIColor redColor];
            break;
        }
        case 2:
        {
            _botaoVerde.backgroundColor = [UIColor greenColor];
            break;
        }
        case 3:
        {
            _botaoAzul.backgroundColor = [UIColor blueColor];
            break;
        }
            
        default:
            break;
    }
    
    [sequencia enfileirar: numero];
    
}
-(void) rodada{
    
    int i = 0;
    double delayInSeconds = 0.0;
    _clickAmarelo.enabled = NO;
    _clickVermelho.enabled = NO;
    _clickAzul.enabled = NO;
    _clickVerde.enabled = NO;
    _fieldNome.hidden =YES;
    [self proxRodada];
    jogada = numRodadas;
    
    do{
    
        
        delayInSeconds = delayInSeconds + 0.8;
        [NSTimer scheduledTimerWithTimeInterval:delayInSeconds
                                         target:self
                                       selector:@selector(mostraCor)
                                       userInfo:nil
                                        repeats:NO];
        [NSTimer scheduledTimerWithTimeInterval:delayInSeconds
                                         target:self
                                       selector:@selector(resetarCor)
                                       userInfo:nil
                                        repeats:NO];
        
        i++;
        
    }while(i<numRodadas);
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        _clickAmarelo.enabled = YES;
        _clickVermelho.enabled = YES;
        _clickAzul.enabled = YES;
        _clickVerde.enabled = YES;
        [NSTimer scheduledTimerWithTimeInterval:0.6
                                         target:self
                                       selector:@selector(pronto)
                                       userInfo:nil
                                        repeats:NO];
        
    });
    
}

- (IBAction)Jogar:(UIButton *)sender {
    
    [self rodada];
    [UIView animateWithDuration:0.9 animations:^{
        _botaoJogar.backgroundColor= [UIColor whiteColor];
          }];
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        _botaoJogar.hidden = YES;
        
    });
    
    
}

@end
