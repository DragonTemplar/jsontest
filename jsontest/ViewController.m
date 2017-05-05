//
//  ViewController.m
//  jsontest
//
//  Created by Narist Chalangsut on 11/21/57 BE.
//  Copyright (c) 2557 Narist Chalangsut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{

    NSMutableArray *myObject;
    // A dictionary object
    NSDictionary *dict;
    // Define keys

    NSString *memberid;
    
    NSString *name;
    
    NSString *tel;
    
}

@property (nonatomic, strong) NSMutableData *responseData;


@end



@implementation ViewController
- (void)viewDidLoad

{

    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    // Define keys

    
    
    
    
    }

    // values in foreach loop

-(IBAction)jsonparser:(id)sender{
    NSData *jsonSource = [NSData dataWithContentsOfURL:
                          [NSURL URLWithString:@"http://192.168.0.12:8080/ImageData/webresources/image.imagedata/1"]];
    NSDictionary *json=[NSJSONSerialization JSONObjectWithData:jsonSource options:kNilOptions error:nil];
    

    NSString *jsonstring=[[NSString alloc] initWithData:jsonSource encoding:NSUTF8StringEncoding];

    NSLog(@"%@",jsonstring);
    
    
//    NSArray *game=[[json objectForKey:@"GameStatusID"]];
        NSString *namestring= [json objectForKey:@"name"];
        NSString *Picstring= [json objectForKey:@"imageID"];
        
        NSLog(@"%@",Picstring);
        NSLog(@"%@",namestring);
//    NSArray *gameStatusdata=json[@"gameStatusID"];

    //    NSLog(@"%@",json[@"imageID"]);
     //    NSLog(@"%@",json[@"name"]);


    
    
    
}
-(IBAction)jsonplayerparser:(id)sender{
    
    NSData *jsonSource = [NSData dataWithContentsOfURL:
                          [NSURL URLWithString:@"http://192.168.0.12:8080/BingoWebServiceRemaster/webresources/bingo.playerdata/"]];
    NSDictionary *json=[NSJSONSerialization JSONObjectWithData:jsonSource options:kNilOptions error:nil];
    
    
   // NSString *jsonstring=[[NSString alloc] initWithData:jsonSource encoding:NSUTF8StringEncoding];
    
  //  NSLog(@"%@",jsonstring);
    NSLog(@"test %ld",(long)[test1 tag ]);
    NSLog(@"test %ld",(long)[test2 tag ]);
    NSLog(@"test %ld",(long)[test3 tag ]);
    NSLog(@"test %ld",(long)[test4 tag ]);
    NSLog(@"test %ld",(long)[test5 tag ]);
    
    for(NSDictionary *shit in json){
       int PlayerID= [[shit objectForKey:@"playerID"] intValue];
            NSString *namestring= [shit objectForKey:@"name"];
        NSString *playerRegistrationstring=[[shit objectForKey:@"playerRegistrationID"]objectForKey:@"desEN"];
        NSString *playertypeIDstring=[[shit objectForKey:@"playerTypeID"] objectForKey:@"desEN"];
        if (![playertypeIDstring isEqualToString:@"Dealer"] && [playerRegistrationstring isEqualToString:@"Player is not Registered"]) {
            NSLog(@"%d",PlayerID);
            NSLog(@"%@",namestring);
            NSLog(@"%@",playertypeIDstring);

            if (PlayerID ==test1.tag) {
             
                [test1 setBackgroundColor:[UIColor greenColor]];
           
            }
            if (PlayerID ==test2.tag) {
                
                [test2 setBackgroundColor:[UIColor greenColor]];
                
            }
            
            if (PlayerID ==test3.tag) {
                
                [test3 setBackgroundColor:[UIColor greenColor]];
                
            }
            
            if (PlayerID ==test4.tag) {
                
                [test4 setBackgroundColor:[UIColor greenColor]];
                
            }
            
            if (PlayerID ==test5.tag) {
                
                [test5 setBackgroundColor:[UIColor greenColor]];
                
            }
            
           
            
        }
         }
    
}
-(IBAction)jsonthirdparser:(id)sender{
     NSData *jsonSource = [NSData dataWithContentsOfURL:
                          [NSURL URLWithString:@"http://192.168.0.12:8080/BingoWebServiceRemaster/webresources/bingo.gamedata/getbyjson/1"]];
    id json=[NSJSONSerialization JSONObjectWithData:jsonSource options:kNilOptions error:nil];
    
    
    //NSString *jsonstring=[[NSString alloc] initWithData:jsonSource encoding:NSUTF8StringEncoding];
    
    //NSLog(@"%@",jsonstring);
    NSString *CheckGameStatusString,*shit;
    
    //    NSArray *game=[[json objectForKey:@"GameStatusID"]];
    CheckGameStatusString=[[json objectForKey:@"gameStatusID"] objectForKey:@"desEN"] ;
shit=    [[json objectForKey:@"dealer"] objectForKey:@"name"];
        
        NSLog(@"%@",CheckGameStatusString);
    NSLog(@"%@",shit);
    if([CheckGameStatusString isEqualToString:@"Dealer is not open registration"]){
        UIAlertView *errorbynotopening = [[UIAlertView alloc]  initWithTitle:@"Error!"
                                                                     message:@"You Cannot enter to play. Beacause Dealer is not open Registration."
                                                                    delegate:self                                            cancelButtonTitle:@"OK"
                                                           otherButtonTitles:nil];
        
        [errorbynotopening show];
    }
    
        }
-(IBAction)jsoncreategamecreatetime:(id)sender{
    NSDate *createtime=[NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
[dateformatter setDateFormat:@"YYYY-MM-dd'T'hh:mm:ss+'07:00'"];
   createtimeString=[dateformatter stringFromDate:createtime];
    NSDictionary * DealerRegistrationDictionary =@{@"desEN":@"Player is not Registered" ,
                                                   @"desTh":@"ผู้เล่นยังไม่ได้สมัครเล่นเกม",
                                                   @"playerRegistrationID" : [NSNumber numberWithInt:2]};
    NSDictionary* DealerStateDictionary= @{
                                           @"desEN":@"Player is not claim bingo.",
                                           @"desTh":@"ผู้เล่นไม่ได้กดปุ่มบิงโก",
                                           @"playerStateID":[NSNumber numberWithInt:2]
                                           } ;
     NSDictionary*  DealerStatusDictionary = @{
                                              @"desEN":@"Player is not call bingo card",
                                              @"desTh":@"ผู้เล่นยังไม่ได้กดปุ่มเรียกตั๋ว",
                                              @"playerStatusID":[NSNumber numberWithInt:2]
                                              };
    NSDictionary* DealerTypeDictionary= @{
                                          @"desEN":@"Dealer",
                                          @"desTh":@"ผู้ตวบคุมเกม",
                                          @"playerTypeID":[NSNumber numberWithInt:1]
                                          };
    NSDictionary*  DealerWinnerDictionary=@{
                                            @"desEN":@"Player is not win bingo",
                                            @"desTh":@"ผู้เล่นยังไม่ชนะเกมบิงโก",
                                            @"winnerStatusID":[NSNumber numberWithInt:2]
                                            };
    NSDictionary *Dealerplayer=@{ @"name":@"testmother",
                                  @"picture":@"",
                                  @"playerID":@1,
                                  @"playerRegistrationID":DealerRegistrationDictionary,
                                  @"playerStateID":DealerStateDictionary,
                                  @"playerStatusID":DealerStatusDictionary,
                                  @"playerTypeID": DealerTypeDictionary,
                                  @"winnerStatusID":DealerWinnerDictionary
                                  };
    NSDictionary *gameStateDictaionary=@{@"desEN":@"Dealer is in the play room",
                                         @"desTh": @"ผู้ควบคุมเกมเข้าห้องเล่นเกม",
                                         @"gameStateID":[NSNumber numberWithInt:2]};
    
    NSDictionary *gameStatusDictaionary=@{@"desEN":@"Dealer is not open registration",
                                          @"desTh": @"ผู้ควบคุมเกมไม่ได้เปิดการรับสมัคร",
                                          @"gameStatusID":[NSNumber numberWithInt:2]};
    NSDictionary *winneringame=@{@"desEN":@"Player is not win bingo",
                                 @"desTh": @"ผู้เล่นยังไม่ชนะเกมบิงโก",
                                 @"winnerStatusID":[NSNumber numberWithInt:2]};
    
    NSDictionary *gamepost=@{@"closeRegistrationTime":createtimeString,
                             @"createTime":createtimeString,
                             @"dealer":Dealerplayer,
                             @"gameID":@1,
                             @"gameStateID":gameStateDictaionary,
                             @"gameStatusID":gameStatusDictaionary,
                             @"openRegistrationTime":createtimeString,
                             @"winner":winneringame
                             };
    NSData *jsonDealer=[NSJSONSerialization dataWithJSONObject:gamepost options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString=[[NSString alloc]initWithData:jsonDealer encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",jsonString);
    NSURL *Dealergamestatus=[NSURL URLWithString:@"http://192.168.0.12:8080/BingoWebServiceRemaster/webresources/bingo.gamedata/"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:Dealergamestatus];
    request.HTTPMethod=@"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding] ];
    NSURLConnection *conn= [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
    if (conn) {
        NSLog(@"come here");
    }else
    {
        NSLog( @"shit");
    }
    
    
}

-(IBAction)jsoncreateclosetime:(id)sender{
    NSDate *closetime=[NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [NSTimeZone localTimeZone];
    [dateformatter setDateFormat:@"YYYY-MM-dd'T'hh:mm:ss+'07:00'"];
    
    
closetimeString=[dateformatter stringFromDate:closetime];
    NSDictionary * DealerRegistrationDictionary =@{@"desEN":@"Player is not Registered" ,
                                                   @"desTh":@"ผู้เล่นยังไม่ได้สมัครเล่นเกม",
                                                   @"playerRegistrationID" : [NSNumber numberWithInt:2]};
    
    NSDictionary* DealerStateDictionary= @{
                                           @"desEN":@"Player is not claim bingo.",
                                           @"desTh":@"ผู้เล่นไม่ได้กดปุ่มบิงโก",
                                           @"playerStateID":[NSNumber numberWithInt:2]
                                           } ;
    
    
    NSDictionary*  DealerStatusDictionary = @{
                                              @"desEN":@"Player is not call bingo card",
                                              @"desTh":@"ผู้เล่นยังไม่ได้กดปุ่มเรียกตั๋ว",
                                              @"playerStatusID":[NSNumber numberWithInt:2]
                                              };
    
    
    NSDictionary* DealerTypeDictionary= @{
                                          @"desEN":@"Dealer",
                                          @"desTh":@"ผู้ตวบคุมเกม",
                                          @"playerTypeID":[NSNumber numberWithInt:1]
                                          };
    
    NSDictionary*  DealerWinnerDictionary=@{
                                            @"desEN":@"Player is not win bingo",
                                            @"desTh":@"ผู้เล่นยังไม่ชนะเกมบิงโก",
                                            @"winnerStatusID":[NSNumber numberWithInt:2]
                                            
                                            };
    
    NSDictionary *Dealerplayer=@{ @"name":@"testmother",
                                  @"picture":@"",
                                  @"playerID":@1,
                                  @"playerRegistrationID":DealerRegistrationDictionary,
                                  @"playerStateID":DealerStateDictionary,
                                  @"playerStatusID":DealerStatusDictionary,
                                  @"playerTypeID": DealerTypeDictionary,
                                  @"winnerStatusID":DealerWinnerDictionary
                                  };
    
    NSDictionary *gameStateDictaionary=@{@"desEN":@"Dealer is in the play room",
                                         @"desTh": @"ผู้ควบคุมเกมเข้าห้องเล่นเกม",
                                         @"gameStateID":[NSNumber numberWithInt:2]};
    
    NSDictionary *gameStatusDictaionary=@{@"desEN":@"Dealer is not open registration",
                                          @"desTh": @"ผู้ควบคุมเกมไม่ได้เปิดการรับสมัคร",
                                          @"gameStatusID":[NSNumber numberWithInt:2]};
    NSDictionary *winneringame=@{@"desEN":@"Player is not win bingo",
                                 @"desTh": @"ผู้เล่นยังไม่ชนะเกมบิงโก",
                                 @"winnerStatusID":[NSNumber numberWithInt:2]};
    
    NSDictionary *gamepost=@{@"closeRegistrationTime":closetimeString,
                             @"createTime":createtimeString,
                             @"dealer":Dealerplayer,
                             @"gameID":@1,
                             @"gameStateID":gameStateDictaionary,
                             @"gameStatusID":gameStatusDictaionary,
                             @"openRegistrationTime":opentimeString,
                             @"winner":winneringame
                             };
    
    
    NSData *jsonDealer=[NSJSONSerialization dataWithJSONObject:gamepost options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString=[[NSString alloc]initWithData:jsonDealer encoding:NSUTF8StringEncoding];
    NSString *DataURL=[NSString stringWithFormat:@"http://192.168.0.12:8080/BingoWebServiceRemaster/webresources/bingo.gamedata/%d",1];
    NSLog(@"%@",jsonString);
    NSURL *Dealergamestatus=[NSURL URLWithString:DataURL];
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:Dealergamestatus];
    request.HTTPMethod=@"PUT";
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding] ];
    NSURLConnection *conn= [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
    
    if (conn) {
        NSLog(@"come here");
    }else
    {
        NSLog( @"shit");
    }
    
}

-(IBAction)jsoncreateopentime:(id)sender{
    NSDate *opentime=[NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [NSTimeZone localTimeZone];
    [dateformatter setDateFormat:@"YYYY-MM-dd'T'hh:mm:ss+'07:00'"];
    
    
opentimeString=[dateformatter stringFromDate:opentime];
    NSDictionary * DealerRegistrationDictionary =@{@"desEN":@"Player is not Registered" ,
                                                   @"desTh":@"ผู้เล่นยังไม่ได้สมัครเล่นเกม",
                                                   @"playerRegistrationID" : [NSNumber numberWithInt:2]};
    
    NSDictionary* DealerStateDictionary= @{
                                           @"desEN":@"Player is not claim bingo.",
                                           @"desTh":@"ผู้เล่นไม่ได้กดปุ่มบิงโก",
                                           @"playerStateID":[NSNumber numberWithInt:2]
                                           } ;
    
    
    NSDictionary*  DealerStatusDictionary = @{
                                              @"desEN":@"Player is not call bingo card",
                                              @"desTh":@"ผู้เล่นยังไม่ได้กดปุ่มเรียกตั๋ว",
                                              @"playerStatusID":[NSNumber numberWithInt:2]
                                              };
    
    
    NSDictionary* DealerTypeDictionary= @{
                                          @"desEN":@"Dealer",
                                          @"desTh":@"ผู้ตวบคุมเกม",
                                          @"playerTypeID":[NSNumber numberWithInt:1]
                                          };
    
    NSDictionary*  DealerWinnerDictionary=@{
                                            @"desEN":@"Player is not win bingo",
                                            @"desTh":@"ผู้เล่นยังไม่ชนะเกมบิงโก",
                                            @"winnerStatusID":[NSNumber numberWithInt:2]
                                            };
    
    NSDictionary *Dealerplayer=@{ @"name":@"Mother",
                                  @"picture":@"",
                                  @"playerID":@1,
                                  @"playerRegistrationID":DealerRegistrationDictionary,
                                  @"playerStateID":DealerStateDictionary,
                                  @"playerStatusID":DealerStatusDictionary,
                                  @"playerTypeID": DealerTypeDictionary,
                                  @"winnerStatusID":DealerWinnerDictionary
                                  };
    
    NSDictionary *gameStateDictaionary=@{@"desEN":@"Dealer is in the play room",
                                         @"desTh": @"ผู้ควบคุมเกมเข้าห้องเล่นเกม",
                                         @"gameStateID":[NSNumber numberWithInt:1]};
    
    NSDictionary *gameStatusDictaionary=@{@"desEN":@"Dealer is open registration",
                                          @"desTh": @"ผู้ควบคุมเกมเปิดการรับสมัคร",
                                          @"gameStatusID":[NSNumber numberWithInt:1]};
    NSDictionary *winneringame=@{@"desEN":@"Player is not win bingo",
                                 @"desTh": @"ผู้เล่นยังไม่ชนะเกมบิงโก",
                                 @"winnerStatusID":[NSNumber numberWithInt:2]};
    
    NSDictionary *gamepost=@{@"closeRegistrationTime":createtimeString,
                             @"createTime":createtimeString,
                             @"dealer":Dealerplayer,
                             @"gameID":@1,
                             @"gameStateID":gameStateDictaionary,
                             @"gameStatusID":gameStatusDictaionary,
                             @"openRegistrationTime":opentimeString,
                             @"winner":winneringame
                             };
    
    
    NSData *jsonDealer=[NSJSONSerialization dataWithJSONObject:gamepost options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString=[[NSString alloc]initWithData:jsonDealer encoding:NSUTF8StringEncoding];
    NSString *DataURL=[NSString stringWithFormat:@"http://192.168.0.12:8080/BingoWebServiceRemaster/webresources/bingo.gamedata/%d",1 ];
    NSLog(@"%@",jsonString);
    NSURL *Dealergamestatus=[NSURL URLWithString:DataURL];
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:Dealergamestatus];
    request.HTTPMethod=@"PUT";
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding] ];
    NSURLConnection *conn= [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
    
    if (conn) {
        NSLog(@"come here");
    }else
    {
        NSLog( @"shit");
    }
    
}
-(IBAction)jsoncreateplayer:(id)sender{
//    NSString *PlayerName=@"Cross";
  //      NSString *b64Picturestring=@"";
  //  UIImage *Carina=[UIImage imageNamed:@"wanaan.png"];
   // NSData *Carinadata=UIImagePNGRepresentation(Carina);
   // NSString *CarinapictureString=[Carinadata base64EncodedStringWithOptions:NSUTF8StringEncoding];
    NSDictionary * PlayerRegistrationDictionary =@{@"desEN":@"Player is Registered" ,
                                                   @"desTh":@"ผู้เล่นสมัครเล่นเกม",
                                                   @"playerRegistrationID" : [NSNumber numberWithInt:1]};
    
    
    NSDictionary* PlayerStateDictionary= @{
                                           @"desEN":@"Player is not claim bingo.",
                                           @"desTh":@"ผู้เล่นไม่ได้กดปุ่มบิงโก",
                                           @"playerStateID":[NSNumber numberWithInt:2]
                                           } ;
    
    
    NSDictionary*  PlayerStatusDictionary = @{
                                              @"desEN":@"Player is not call bingo card",
                                              @"desTh":@"ผู้เล่นยังไม่ได้กดปุ่มเรียกตั๋ว",
                                              @"playerStatusID":[NSNumber numberWithInt:2]
                                              };
    
    
    NSDictionary* PlayerTypeDictionary= @{
                                          @"desEN":@"Player",
                                          @"desTh":@"ผู้เล่น",
                                          @"playerTypeID":[NSNumber numberWithInt:2]
                                          };
    
    NSDictionary*  PlayerWinnerDictionary=@{
                                            @"desEN":@"Player is not win bingo",
                                            @"desTh":@"ผู้เล่นยังไม่ชนะเกมบิงโก",
                                            @"winnerStatusID":[NSNumber numberWithInt:2]
                                            
                                            };
    
    NSDictionary* Confirmregistration=@{@"name":@"Scunt",
                                        @"picture":@"",
                                        @"playerID":[NSNumber numberWithInt:110],
                                        @"playerRegistrationID":
                                            PlayerRegistrationDictionary,
                                        @"playerStateID":
                                            PlayerStateDictionary,
                                        @"playerStatusID":
                                            PlayerStatusDictionary,
                                        @"playerTypeID":
                                            PlayerTypeDictionary,
                                        @"winnerStatusID":
                                            PlayerWinnerDictionary};
    
    NSURL *playerCreateandinitialstatus=[NSURL URLWithString:@"http://192.168.106.155:8080/BingoWebServiceRemaster/webresources/bingo.playerdata/"];
    
    NSData *Jsondatawrite=[NSJSONSerialization dataWithJSONObject:Confirmregistration options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *jsonString=[[NSString alloc]initWithData:Jsondatawrite encoding:NSUTF8StringEncoding];
    
      NSLog(@"%@",jsonString);
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:playerCreateandinitialstatus];
    request.HTTPMethod=@"POST";
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding] ];
    NSURLConnection *conn= [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
    
    if (conn) {
        NSLog(@"come here");
    }else
    {
        NSLog( @"shit");
    }
    
}
-(IBAction)jsoncreateDealer:(id)sender{
    //    NSString *PlayerName=@"Cross";
    //      NSString *b64Picturestring=@"";
    
    NSDictionary * PlayerRegistrationDictionary =@{@"desEN":@"Player is not Registered" ,
                                                   @"desTh":@"ผู้เล่นยังไม่ได้สมัครเล่นเกม",
                                                   @"playerRegistrationID" : [NSNumber numberWithInt:2]};
    
    
    NSDictionary* PlayerStateDictionary= @{
                                           @"desEN":@"Player is not claim bingo.",
                                           @"desTh":@"ผู้เล่นไม่ได้กดปุ่มบิงโก",
                                           @"playerStateID":[NSNumber numberWithInt:2]
                                           } ;
    
    
    NSDictionary*  PlayerStatusDictionary = @{
                                              @"desEN":@"Player is not call bingo card",
                                              @"desTh":@"ผู้เล่นยังไม่ได้กดปุ่มเรียกตั๋ว",
                                              @"playerStatusID":[NSNumber numberWithInt:2]
                                              };
    
    
    NSDictionary* PlayerTypeDictionary= @{
                                          @"desEN":@"Dealer",
                                          @"desTh":@"ผู้ควบคุมเกม",
                                          @"playerTypeID":[NSNumber numberWithInt:1]
                                          };
    
    NSDictionary*  PlayerWinnerDictionary=@{
                                            @"desEN":@"Player is not win bingo",
                                            @"desTh":@"ผู้เล่นยังไม่ชนะเกมบิงโก",
                                            @"winnerStatusID":[NSNumber numberWithInt:2]
                                            
                                            };
    
    NSDictionary* Confirmregistration=@{@"name":@"Mother",
                                        @"picture":@"",
                                        @"playerID":@1,
                                        @"playerRegistrationID":
                                            PlayerRegistrationDictionary,
                                        @"playerStateID":
                                            PlayerStateDictionary,
                                        @"playerStatusID":
                                            PlayerStatusDictionary,
                                        @"playerTypeID":
                                            PlayerTypeDictionary,
                                        @"winnerStatusID":
                                            PlayerWinnerDictionary};
    
    NSURL *playerCreateandinitialstatus=[NSURL URLWithString:@"http://192.168.0.12:8080/BingoWebServiceRemaster/webresources/bingo.playerdata/"];
    
    NSData *Jsondatawrite=[NSJSONSerialization dataWithJSONObject:Confirmregistration options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *jsonString=[[NSString alloc]initWithData:Jsondatawrite encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",jsonString);
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:playerCreateandinitialstatus];
    request.HTTPMethod=@"POST";
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding] ];
    NSURLConnection *conn= [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
    
    if (conn) {
        NSLog(@"come here");
    }else
    {
        NSLog( @"shit");
    }
    
}
-(IBAction)JsonDraw:(id)sender{




    NSDictionary *Drawtest =   @{@"dealerID":@{ @"name":@"Mother",
                                @"picture":@"",
                                @"playerID":@1,
        @"playerRegistrationID":@{@"desEN":@"Player is not Registered",@"desTh":@"ผู้เล่นยังไม่สมัครเล่นเกม",@"playerRegistrationID":@2},
        @"playerStateID":@{@"desEN":@"Player is not claim bingo.",@"desTh":@"ผู้เล่นไม่ได้กดปุ่มบิงโก",@"playerStateID":@2},
        @"playerStatusID":@{@"desEN":@"Player is not call bingo card",@"desTh":@"ผู้เล่นยังไม่ได้กดปุ่มเรียกตั๋ว",@"playerStatusID":@2},
        @"playerTypeID":@{@"desEN":@"Dealer",@"desTh":@"ผู้ควบคุมเกม",@"playerTypeID":@1},
        @"winnerStatusID":@{@"desEN":@"Player is not win bingo",@"desTh":@"ผู้เล่นยังไม่ชนะเกมบิงโก",@"winnerStatusID":@2}
                                                },
                                                                      
                @"drawnumber":@22,
                @"gameID":@{@"closeRegistrationTime": @"2015-04-19T15:37:40+07:00",
                            @"createTime":@"2015-04-19T13:55:14+07:00",
        @"dealer":@{@"name":@"Mother",                                                                                              @"picture":@"",@"playerID":@1,
        @"playerRegistrationID":@{@"desEN":@"Player is not Registered",@"desTh":@"ผู้เล่นยังไม่สมัครเล่นเกม",@"playerRegistrationID":@2},
        @"playerStateID":@{@"desEN":@"Player is not claim bingo.",@"desTh":@"ผู้เล่นไม่ได้กดปุ่มบิงโก",@"playerStateID":@2},
        @"playerStatusID":@{@"desEN":@"Player is not call bingo card",
            @"desTh":@"ผู้เล่นยังไม่ได้กดปุ่มเรียกตั๋ว",@"playerStatusID":@2},
        @"playerTypeID":@{@"desEN":@"Dealer",@"desTh":@"ผู้ควบคุมเกม",@"playerTypeID":@1},
        @"winnerStatusID":@{@"desEN":@"Player is not win bingo",@"desTh":@"ผู้เล่นยังไม่ชนะเกมบิงโก",@"winnerStatusID":@2}},
                            @"gameID":@1,
    @"gameStateID":@{@"desEN":@"Dealer is in the play room",@"desTh":@"ผู้ควบคุมเกมเข้าห้องเล่นเกม",@"gameStateID":@2},
@"gameStatusID":@{@"desEN":@"Dealer is not open registration",@"desTh":@"ผู้ควบคุมเกมไม่ได้เปิดการรับสมัคร",@"gameStatusID":@2},
    @"winner":@{@"desEN":@"Player is not win bingo",@"desTh":@"ผู้เล่นยังไม่ชนะเกมบิงโก",@"winnerStatusID":@2}},@"round":@1,@"timestamp":@"2015-04-19T14:35:40+07:00"
                                                                      
                                                                      
                                                                      };
    
    NSURL *playerCreateandinitialstatus=[NSURL URLWithString:@"http://192.168.0.12:8080/BingoWebServiceRemaster/webresources/bingo.drawtable/"];
    
    NSData *Jsondatawrite=[NSJSONSerialization dataWithJSONObject:Drawtest options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *jsonString=[[NSString alloc]initWithData:Jsondatawrite encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",jsonString);
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:playerCreateandinitialstatus];
    request.HTTPMethod=@"POST";
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding] ];
    NSURLConnection *conn= [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
    
    if (conn) {
        NSLog(@"come here");
    }else
    {
        NSLog( @"shit");
    }

}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    NSLog([NSString stringWithFormat:@"Connection failed: %@", [error description]]);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
