//
//  AppDelegate.h
//  Http
//
//  Created by Static Ga on 13-5-13.
//  Copyright (c) 2013年 Static Ga. All rights reserved.
//

#import <Cocoa/Cocoa.h>
typedef enum {
    kURLPar = 0,
    kJSON,
    kXML ,
}kParType;

@interface AppDelegate : NSObject <NSApplicationDelegate,NSTableViewDelegate,NSTableViewDataSource,NSComboBoxDelegate,NSComboBoxCellDataSource>
{
    NSInteger parType;
}
@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *urlTextField;
@property (weak) IBOutlet NSComboBox *methodBox;
@property (weak) IBOutlet NSTableView *headTableView;
@property (weak) IBOutlet NSTableView *praTableView;
@property (unsafe_unretained) IBOutlet NSTextView *resultView;
@property (weak) IBOutlet NSComboBox *headValueBox;
- (IBAction)matrixMethod:(id)sender;

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *headDataArray;
@property (nonatomic, strong) NSMutableArray *headValueArray;
@property (nonatomic, strong) NSMutableDictionary *headDic;
@property (nonatomic, strong) NSMutableArray *leftBoxArray;
- (IBAction)startHttp:(id)sender;
- (IBAction)addRow:(id)sender;
- (IBAction)deleteRow:(id)sender;
- (IBAction)addHeadRow:(id)sender;
- (IBAction)removeHeadRow:(id)sender;
- (IBAction)clear:(id)sender;

@end
