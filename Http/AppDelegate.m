//
//  AppDelegate.m
//  Http
//
//  Created by Static Ga on 13-5-13.
//  Copyright (c) 2013年 Static Ga. All rights reserved.
//

#import "AppDelegate.h"
#import "JSONKit.h"

#define kPraTableViewLeftHeadTitle @"parameter"
#define kPraTableViewRightHeadTitle @"value"

#define kHeadTableViewLeftHeadTitle @"HeadName"
#define kHeadTableViewRightHeadTitle @"HeadValue"

#define kHeadNameBox @"headNameBox"
#define kHeadValueBox @"headValueBox"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:)
                                                 name:NSControlTextDidChangeNotification object:nil];
    
    
    self.dataArray = [[NSMutableArray alloc] init];
    self.headDataArray = [[NSMutableArray alloc] init];
    
    self.headValueArray = [[NSMutableArray alloc] init];
    
    
    self.headDic = [[NSMutableDictionary alloc] init];
    
    NSMutableArray *tmpHeadValueArray = [[NSMutableArray alloc] init];
    NSString *headName = @"Content-type";
    
    NSString *headValue = @"application/octet-stream";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"application/x-www-form-urlencoded";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"application/xml";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"multipart/form-data";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"text/html";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"text/plain";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"text/xml";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"application/json";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"application/javascript";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"application/soap+xml";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"application/xhtml+xml";
    [tmpHeadValueArray addObject:headValue];
    [self.headDic setObject:tmpHeadValueArray forKey:headName];
    
    headName = @"Host";
    tmpHeadValueArray = [[NSMutableArray alloc] init];
    [self.headDic setObject:tmpHeadValueArray forKey:headName];
    
    headName = @"Accept";
    tmpHeadValueArray = [[NSMutableArray alloc] init];
    headValue = @"*/*";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"text/plain";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"text/html";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"text/plain, text/html";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"application/xml";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"application/json";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"application/javascript";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"application/soap+xml";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"application/xhtml+xml";
    [tmpHeadValueArray addObject:headValue];
    [self.headDic setObject:tmpHeadValueArray forKey:headName];
    
    headName = @"Accept-Language ";
    tmpHeadValueArray = [[NSMutableArray alloc] init];
    headValue = @"*";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"en";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"es";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"de";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"fr";
    [self.headDic setObject:tmpHeadValueArray forKey:headName];
    
    headName = @"Accept-Encoding ";
    tmpHeadValueArray = [[NSMutableArray alloc] init];
    headValue = @"gzip, deflate";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"gzip";
    [tmpHeadValueArray addObject:headValue];
    headValue = @"deflate";
    [self.headDic setObject:tmpHeadValueArray forKey:headName];
    
    headName = @"Content-Length";
    tmpHeadValueArray = [[NSMutableArray alloc] init];
    [self.headDic setObject:tmpHeadValueArray forKey:headName];
    
    self.leftBoxArray = [[NSMutableArray alloc] init];
    
    [self.praTableView setDoubleAction:@selector(doubleClick:)];
}

- (void)doubleClick:(id)sender
{
}

#pragma mark - comBox dataSource

- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox {
    NSInteger itemcount = 0;
    itemcount = self.leftBoxArray.count;
    return itemcount;
}

- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index {
    
    id obj = nil;
    if (self.leftBoxArray.count > 0)
        obj = [self.leftBoxArray objectAtIndex:index];
    return obj;
    
}
#pragma mark -
#pragma mark - tableView delegate & dataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    NSUInteger rowCount = 0;
    if (tableView == self.praTableView) {
        if (self.dataArray)
            rowCount = self.dataArray.count;
    }else {
        if (self.headDataArray)
            rowCount = self.headDataArray.count;
    }
    return rowCount;
}

- (void)tableView:(NSTableView *)aTableView
   setObjectValue:(id)anObject
   forTableColumn:(NSTableColumn *)aTableColumn
              row:(NSInteger)rowIndex {
    NSString *identifier = aTableColumn.identifier;
    if (aTableView == self.praTableView) {
        NSMutableDictionary *dic = [self.dataArray objectAtIndex:rowIndex];
        [dic setObject:anObject forKey:identifier];
        [self.praTableView reloadData];
    }else {
        NSLog(@"an obje %@",anObject);
    }
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *identifier = tableColumn.identifier;
    NSString *returnValue = nil;
    if (tableView == self.praTableView) {
        NSMutableDictionary *dic = [self.dataArray objectAtIndex:row];
        if (identifier) {
            if ([identifier isEqualToString:kPraTableViewLeftHeadTitle]) {
                returnValue = [dic objectForKey:kPraTableViewLeftHeadTitle];
            }else {
                returnValue = [dic objectForKey:kPraTableViewRightHeadTitle];
            }
        }
    }else {
        
    }
    return returnValue;
    
}

- (BOOL)textShouldBeginEditing:(NSText *)textObject {
    NSLog(@"text--1");
    return YES;
}
- (BOOL)textShouldEndEditing:(NSText *)textObject {
    NSLog(@"text--2");
    return YES;
}
- (void)textDidBeginEditing:(NSNotification *)notification {
    NSLog(@"text--3");
    
}
- (void)textDidEndEditing:(NSNotification *)notification {
    NSLog(@"text--4");
}
- (void)textDidChange:(NSNotification *)notification {
    NSTableView *tableView = notification.object;
    if (tableView == self.praTableView) {
        NSString *obj = [[[notification userInfo] objectForKey:@"NSFieldEditor"] string];
        NSInteger editedColumn = self.praTableView.editedColumn;
        NSInteger editedRow = self.praTableView.editedRow;
        NSMutableDictionary *dic = [self.dataArray objectAtIndex:editedRow];
        NSString *key = nil;
        switch (editedColumn) {
            case 0:
            {
                key = kPraTableViewLeftHeadTitle;
            }
                break;
            case 1:
            {
                key = kPraTableViewRightHeadTitle;
            }
                break;
            default:
                break;
        }
        [dic setObject:obj forKey:key];
        
    }
}
#pragma mark -
#pragma makr - httpMethods

- (void)sendGetHttp {
    NSString *showStr = nil;
    if (kURLPar != parType) {
        showStr =
        @"--------------------------------Attention Please--------------------------------------\nPlease check out the 'Parameter Type' for get method...\nFor this app, it does not implement 'GET' method for 'XML/JSON.\nYou only can set the parameter in the URL,such as http://108.test.net?userid=***&name=***'";
        [self.resultView setString:showStr];
        return;
    }
    
    NSMutableData *postBody = [NSMutableData data];
    
    //json内容
    //参数一定需要
    NSUInteger i = 0;
    NSUInteger count = self.dataArray.count;
    for (i = 0; i < count; ++i) {
        NSMutableDictionary *dic = [self.dataArray objectAtIndex:i];
        NSString *par = [dic objectForKey:kPraTableViewLeftHeadTitle];
        NSString *value = [dic objectForKey:kPraTableViewRightHeadTitle];
        if (par && ![par isEqualToString:@""]) {
            if (0 == i) {
                [postBody appendData:[[NSString stringWithFormat:@"?"] dataUsingEncoding:NSUTF8StringEncoding]];
            }
        }
        if (par && ![par isEqualToString:@""] && value && ![value isEqualToString:@""] ) {
            if (count - 1 == i) {
                [postBody appendData:[[NSString stringWithFormat:@"%@=%@",par,value] dataUsingEncoding:NSUTF8StringEncoding]];
            }else {
                [postBody appendData:[[NSString stringWithFormat:@"%@=%@&",par,value] dataUsingEncoding:NSUTF8StringEncoding]];
            }
        }
    }
    NSString *bodyString = [[NSString alloc] initWithData:postBody encoding:NSUTF8StringEncoding];
    NSMutableString *urlStr = [NSMutableString stringWithFormat:@"%@%@",self.urlTextField.stringValue,bodyString];
    NSURL* url = [NSURL URLWithString:urlStr];
    NSLog(@"url str %@ url %@ bo %@ text %@" ,urlStr,url,bodyString,self.urlTextField.stringValue);
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    //头
    for (NSMutableDictionary *dic in self.headDataArray) {
        NSString *par = [dic objectForKey:kHeadTableViewLeftHeadTitle];
        NSString *value = [dic objectForKey:kHeadTableViewRightHeadTitle];
        NSLog(@"value %@",value);
        if (par && ![par isEqualToString:@""] && value && ![value isEqualToString:@""]) {
            [request addValue:value forHTTPHeaderField:par];
        }
    }
    
    
    NSHTTPURLResponse *response;
    NSError *error = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response error:&error];
    NSString* strRet = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    showStr = [NSString stringWithFormat:@" -------------------------------- 1. Generat URL--------------------------------------\n %@ \n\n   -------------------------------- 2. Http Result--------------------------------------\n %@ \n\n  -------------------------------- 3. Error Code--------------------------------------\n errorCode = %li \n\n -------------------------------- 4. Error Info--------------------------------------\n errorInfo = %@ \n\n",url, strRet, (long)error.code,error];
    [self.resultView setString:showStr];}

/*
 
 http://4.istarjay.sinaapp.com/login.php data <?xml version = "1.0" encoding = "UTF-8"?><Info><userAccount>7C:D1:C3:73:E5:D0</userAccount></Info>
 **/

- (void)sendPostHttp {
    NSString *showStr = nil;
    if (kURLPar == parType) {
        showStr =
        @"--------------------------------Attention Please--------------------------------------\nPlease select your Parameter Type for Post method...\nFor this app, it only support 'XML/JSON' for 'Post' Method";
        [self.resultView setString:showStr];
        return;
    }
    
    
    NSString *urlStr = self.urlTextField.stringValue;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlStr]];
    [request setHTTPMethod:@"POST"];
    
    //头
    for (NSMutableDictionary *dic in self.headDataArray) {
        NSString *par = [dic objectForKey:kHeadTableViewLeftHeadTitle];
        NSString *value = [dic objectForKey:kHeadTableViewRightHeadTitle];
        if (par && ![par isEqualToString:@""] && value && ![value isEqualToString:@""]) {
            [request addValue:value forHTTPHeaderField:par];
        }
    }
    NSMutableData *postBody = [NSMutableData data];
    NSString *parString = nil;
    if (kJSON == parType) {
        //json内容
        //参数一定需要
        NSMutableDictionary *jsonDic = [NSMutableDictionary dictionary];
        NSUInteger i = 0;
        NSUInteger count = self.dataArray.count;
        for (i = 0; i < count; ++i) {
            NSMutableDictionary *dic = [self.dataArray objectAtIndex:i];
            NSString *par = [dic objectForKey:kPraTableViewLeftHeadTitle];
            NSString *value = [dic objectForKey:kPraTableViewRightHeadTitle];
            if (par && ![par isEqualToString:@""] && value && ![value isEqualToString:@""] ) {
                [jsonDic setObject:value forKey:par];
            }
        }
        parString = [jsonDic JSONString];
        postBody = [NSData dataWithData:[jsonDic JSONData]];
    }else if (kXML == parType){
        [postBody appendData:[[NSString stringWithFormat:@"<?xml version = \"1.0\" encoding = \"UTF-8\"?>"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //xml内容
        NSMutableArray *elementArray = [NSMutableArray array];
        //参数一定需要
        for (NSMutableDictionary *dic in self.dataArray) {
            NSString *par = [dic objectForKey:kPraTableViewLeftHeadTitle];
            NSString *value = [dic objectForKey:kPraTableViewRightHeadTitle];
            if (par && ![par isEqualToString:@""]) {
                if (value && ![value isEqualToString:@""]) {
                    [postBody appendData:[[NSString stringWithFormat:@"<%@>%@</%@>",par,value,par] dataUsingEncoding:NSUTF8StringEncoding]];
                }else {
                    [postBody appendData:[[NSString stringWithFormat:@"<%@>",par] dataUsingEncoding:NSUTF8StringEncoding]];
                    [elementArray addObject:par];
                }
            }
        }
        int count = (int)elementArray.count;
        for (int i = count - 1; i > -1; i--) {
            NSString *ele = [elementArray objectAtIndex:i];
            [postBody appendData:[[NSString stringWithFormat:@"</%@>",ele] dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
#if 0
    NSXMLElement *root = [NSXMLElement elementWithName:@"Info"];
    [root addAttribute:[NSXMLNode attributeWithName:@"version" stringValue:@"1.0"]];
    
    //    NSXMLDocument *xmlDoc = [[NSXMLDocument alloc] initWithRootElement:root];
    NSXMLDocument *xmlDoc = [[NSXMLDocument alloc] init];
    [xmlDoc setVersion:@"1.0"];
    [xmlDoc setCharacterEncoding:@"UTF-8"];
    //    [xmlDoc setRootElement:root];
    NSXMLNode *cdataNode = [self generateCDataNode:@"PK"];
    NSXMLElement *urlNode = [NSXMLElement elementWithName:@"Setting"];
    [urlNode addAttribute:[NSXMLNode attributeWithName:@"name" stringValue:@"gaga"]];
    [urlNode addAttribute:[NSXMLNode attributeWithName:@"type" stringValue:@"login"]];
    [urlNode addChild:cdataNode];
    
    [xmlDoc addChild:urlNode];
    NSString  *xmlString = [xmlDoc XMLString];
    NSLog(@" xmlString %@",xmlString);
#endif
    NSString *bodyString = [[NSString alloc] initWithData:postBody encoding:NSUTF8StringEncoding];
    [request setHTTPBody:postBody];
    NSHTTPURLResponse *response;
    NSError *error = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response error:&error];
    NSString* strRet = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"AllHeadField %@",request.allHTTPHeaderFields);
    NSDictionary *headFields = request.allHTTPHeaderFields;
    showStr = [NSString stringWithFormat:@" -------------------------------- 1. POST Body String --------------------------------------\n %@ \n\n -------------------------------- 2. POST Body Data--------------------------------------\n %@ \n\n-------------------------------- 3. Head Fields--------------------------------------\n %@ \n\n  -------------------------------- 4. Http Result--------------------------------------\n %@ \n\n  -------------------------------- 5. Error Code--------------------------------------\n errorCode = %li \n\n -------------------------------- 5. Error Info--------------------------------------\n errorInfo = %@ \n\n",bodyString, postBody,headFields,strRet, (long)error.code,error];
    
    [self.resultView setString:showStr];
}

- (NSXMLNode *)generateCDataNode:(NSString *)value {
    NSXMLNode *cdataNode = [[NSXMLNode alloc] initWithKind:NSXMLTextKind options:NSXMLNodeIsCDATA];
    [cdataNode setStringValue:value];
    return cdataNode;
}
#pragma mark -
#pragma makr - Action
- (IBAction)startHttp:(id)sender {
    NSString *method = self.methodBox.objectValueOfSelectedItem;
    NSLog(@"method %@",method);
    if (method && ![method isEqualToString:@""]) {
        if ([method isEqualToString:@"GET"]) {
            [self sendGetHttp];
        }else {
            [self sendPostHttp];
        }
    }else {
        [self sendGetHttp];
    }
}

- (IBAction)addRow:(id)sender {
    NSMutableDictionary *dic =[[NSMutableDictionary alloc] init];
    [self.dataArray addObject:dic];
    [self.praTableView reloadData];
}

- (IBAction)deleteRow:(id)sender {
    NSUInteger selectedRow = [self.praTableView selectedRow];
    NSLog(@"selectedRow %ld",selectedRow);
    if (selectedRow < self.dataArray.count) {
        [self.dataArray removeObjectAtIndex:selectedRow];
        [self.praTableView reloadData];
    }
}

- (IBAction)addHeadRow:(id)sender {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [self.headDataArray addObject:dic];
    [self.headTableView reloadData];
}

- (IBAction)removeHeadRow:(id)sender {
    NSUInteger selectedRow = [self.headTableView selectedRow];
    if (selectedRow < self.headDataArray.count) {
        [self.headDataArray removeObjectAtIndex:selectedRow];
        [self.headTableView reloadData];
    }
}

- (IBAction)clear:(id)sender {
    [self.resultView setString:@""];
}


- (IBAction)matrixMethod:(id)sender {
    NSMatrix *rix = sender;
    parType = rix.selectedRow;
}


- (void)comboBoxSelectionDidChange:(NSNotification *)notification {
    NSComboBox *box = notification.object;
    if (box) {
        NSUInteger row = [self.headTableView rowForView:box.superview];
        NSString *boxIdentifier = box.identifier;
        NSUInteger dataCount = self.headDataArray.count;
        if (row < dataCount) {
            NSMutableDictionary *dic = [self.headDataArray objectAtIndex:row];;
            NSString *method = nil;
            if ([boxIdentifier isEqualToString:kHeadTableViewLeftHeadTitle]) {
                method = box.objectValueOfSelectedItem;
                if (method) {
                    [dic setObject:method forKey:kHeadTableViewLeftHeadTitle];
                }
                
                NSString *headKey = [dic objectForKey:kHeadTableViewLeftHeadTitle];
                if (headKey && ![headKey isEqualToString:@""]) {
                    [self.leftBoxArray removeAllObjects];
                    NSMutableArray *array = [self.headDic objectForKey:headKey];
                    if (array && array.count > 0)
                        [self.leftBoxArray addObjectsFromArray:array];
                }
                
            }else if ([boxIdentifier isEqualToString:kHeadTableViewRightHeadTitle]) {
                method = [self comboBox:box
              objectValueForItemAtIndex:[box indexOfSelectedItem]];
                if (method)
                    [dic setObject:method forKey:kHeadTableViewRightHeadTitle];
            }
        }
    }
}

@end
