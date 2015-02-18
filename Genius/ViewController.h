//
//  ViewController.h
//  Genius
//
//  Created by Lidia Chou on 2/13/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fila.h"

@interface ViewController : UIViewController {
    Fila *sequencia;
    NSInteger numRodadas;
    NSInteger jogada;
    NSInteger qtdJogada;
}
@property (weak, nonatomic) IBOutlet UIButton *clickAzul;
@property (weak, nonatomic) IBOutlet UIButton *clickVerde;
@property (weak, nonatomic) IBOutlet UIButton *clickVermelho;
@property (weak, nonatomic) IBOutlet UIButton *clickAmarelo;
@property (weak, nonatomic) IBOutlet UIButton *botaoAzul;
@property (weak, nonatomic) IBOutlet UIButton *botaoVerde;
@property (weak, nonatomic) IBOutlet UIButton *botaoVermelho;
@property (weak, nonatomic) IBOutlet UIButton *botaoAmarelo;
@property NSInteger numRodadas;
@property NSInteger jogada;
- (IBAction)clickAmarelo:(UIButton *)sender;
- (IBAction)clickVermelho:(UIButton *)sender;
- (IBAction)clickVerde:(UIButton *)sender;
- (IBAction)clickAzul:(UIButton *)sender;
- (IBAction)clickHighScore:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *score1;
@property (weak, nonatomic) IBOutlet UILabel *score2;
@property (weak, nonatomic) IBOutlet UILabel *socre3;
@property (weak, nonatomic) IBOutlet UILabel *scoreValue1;
@property (weak, nonatomic) IBOutlet UILabel *scoreValue2;
@property (weak, nonatomic) IBOutlet UILabel *scoreValue3;
@property (weak, nonatomic) IBOutlet UIButton *botaoHighScore;
@property (weak, nonatomic) IBOutlet UITextField *fieldNome;
@property (weak, nonatomic) IBOutlet UIButton *botaoJogar;

@property (weak, nonatomic) IBOutlet UIButton *botaoAcertou;
@property (weak, nonatomic) IBOutlet UILabel *labelnVezes;

- (IBAction)botaoVermelho:(UIButton *)sender;
- (IBAction)Amarelo1:(UIButton *)sender;
- (IBAction)Jogar:(UIButton *)sender;
- (void)proxRodada;
-(void) mostraCor;
-(void) resetarCor;
-(void) perdeu;
-(void) acertou;
-(void) rodada;
-(void)pronto;
-(void) confere: (NSInteger)num;

@end

