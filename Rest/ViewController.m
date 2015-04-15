//
//  ViewController.m
//  Rest
//
//  Created by David Tanner Jr on 4/8/15.
//  Copyright (c) 2015 David Tanner Jr. All rights reserved.
//

#import "ViewController.h"
#import "XMLReader.h"

@interface NSURLRequest (DummyInterface)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end


@interface ViewController ()

@end

@implementation ViewController



- (IBAction)getContacts{
    NSURL *url = [NSURL URLWithString:@"https://discoverservice.bluesphereqa.com/api/contact"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/xml" forHTTPHeaderField:@"Accept"];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             
             NSLog(string);
             
         }
     }];
  


    
}

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){
        [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
    }
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"end");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@", error.localizedDescription);
}


- (IBAction)updateContact;
{
    //Cathan to DavidTanner
    NSString *entity =  @"<EntityCollection xmlns:i=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://schemas.microsoft.com/xrm/2011/Contracts\"><Entities><Entity><Attributes xmlns:d4p1=\"http://schemas.datacontract.org/2004/07/System.Collections.Generic\"><KeyValuePairOfstringanyType><d4p1:key>contactid</d4p1:key><d4p1:value xmlns:d6p1=\"http://schemas.microsoft.com/2003/10/Serialization/\" i:type=\"d6p1:guid\">47a0e5b9-88df-e311-b8e5-6c3be5a8b200</d4p1:value></KeyValuePairOfstringanyType><KeyValuePairOfstringanyType><d4p1:key>firstname</d4p1:key><d4p1:value xmlns:d6p1=\"http://www.w3.org/2001/XMLSchema\" i:type=\"d6p1:string\">TTTTTanner</d4p1:value></KeyValuePairOfstringanyType><KeyValuePairOfstringanyType><d4p1:key>lastname</d4p1:key><d4p1:value xmlns:d6p1=\"http://www.w3.org/2001/XMLSchema\" i:type=\"d6p1:string\">Lauriant</d4p1:value></KeyValuePairOfstringanyType><KeyValuePairOfstringanyType><d4p1:key>emailaddress1</d4p1:key><d4p1:value xmlns:d6p1=\"http://www.w3.org/2001/XMLSchema\" i:type=\"d6p1:string\">vlauriant@adatum.com</d4p1:value></KeyValuePairOfstringanyType></Attributes><EntityState i:nil=\"true\" /><FormattedValues xmlns:d4p1=\"http://schemas.datacontract.org/2004/07/System.Collections.Generic\" /><Id>47a0e5b9-88df-e311-b8e5-6c3be5a8b200</Id><LogicalName>contact</LogicalName><RelatedEntities xmlns:d4p1=\"http://schemas.datacontract.org/2004/07/System.Collections.Generic\" /></Entity></Entities><EntityName>contact</EntityName><MinActiveRowVersion>-1</MinActiveRowVersion><MoreRecords>false</MoreRecords><PagingCookie>&lt;cookie page=\"1\"&gt;&lt;contactid last=\"{E5A7E5B9-88DF-E311-B8E5-6C3BE5A8B200}\" first=\"{47A0E5B9-88DF-E311-B8E5-6C3BE5A8B200}\" /&gt;&lt;/cookie&gt;</PagingCookie><TotalRecordCount>-1</TotalRecordCount><TotalRecordCountLimitExceeded>false</TotalRecordCountLimitExceeded></EntityCollection>";
    
    //NSData* contact = [entity dataUsingEncoding:NSUTF8StringEncoding];
    NSData *postData = [entity dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    NSURL *url = [NSURL URLWithString:@"https://discoverservice.bluesphereqa.com/api/contact"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"PUT"];
    [request setValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/xml" forHTTPHeaderField:@"Accept"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    
    
    
   [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             NSLog(@"%@",string);
         }
     }];
    
}
//http://discoverservice.bluesphereqa.com/api/contact/?url=https://CDH62CommercialwithCRM.crm.dynamics.com,name=alans@CDH62CommercialwithCRM.onmicrosoft.com,password=%22Vulo5319%22


- (IBAction)logIn;
{
    //NSData* contact = [entity dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:@"https://discoverservice.bluesphereqa.com/api/contact"];
    NSString *discoverurl = @"https://CDH62CommercialwithCRM.crm.dynamics.com";
    NSString *name = @"alans@CDH62CommercialwithCRM.onmicrosoft.com";
    NSString *password = @"Vulo5319";
    
 /*   "<CreateUserLogIn xmlns:i=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://schemas.datacontract.org/2004/07/DiscoveryServiceWebAPI.Controllers\"><name>alans@CDH62CommercialwithCRM.onmicrosoft.com</name><password>Vulo5319</password><url>https://CDH62CommercialwithCRM.crm.dynamics.com</url></CreateUserLogIn>";*/
    
    
NSString *xmlFormat = [NSString stringWithFormat:@"<CreateUserLogIn xmlns:i=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://schemas.datacontract.org/2004/07/DiscoveryServiceWebAPI.Controllers\"><name>%@</name><password>%@</password><url>%@</url></CreateUserLogIn>",name,password,discoverurl];
    
    NSData *postData = [xmlFormat dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/xml" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:postData];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    
    NSData *returnData = [[NSData alloc]init];
    returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             NSLog(@"%@",string);
         }
     }];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self updateContact];
    [self logIn];
    //[self getConnection];
    //[self updateContact];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
