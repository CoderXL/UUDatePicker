//
//  ViewController.m
//  UUDatePikcer_Max_Min
//
//  Created by shake on 14-10-30.
//  Copyright (c) 2014年 uyiuyao. All rights reserved.
//

#import "ViewController.h"
#import "UUDatePicker.h"

#define WIDTH   [[UIScreen mainScreen].bounds.size.width
#define HEIGHT  [[UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UUDatePickerDelegate>
{
    __weak IBOutlet UITextField *YMDHM;
    __weak IBOutlet UITextField *YMD;
    __weak IBOutlet UITextField *MDHM;
    __weak IBOutlet UITextField *HM;
    
    __weak IBOutlet UITextField *Max;
    __weak IBOutlet UITextField *Min;
    __weak IBOutlet UITextField *SpecifiedTime;
}
@end

@implementation ViewController

/*
 UUDateStyle_YearMonthDayHourMinute = 0,
 UUDateStyle_YearMonthDay,
 UUDateStyle_MonthDayHourMinute,
 UUDateStyle_HourMinute
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate *now = [NSDate date];
    //block
    NSArray *txfAry = @[YMDHM,YMD,MDHM,HM,Max,Min];
    int a[6] = {0,1,2,3,0,0};
    for (int i=0; i<txfAry.count; i++) {
        
        UITextField *field = txfAry[i];
        
        UUDatePicker *datePicker
        = [[UUDatePicker alloc]initWithframe:CGRectMake(0, 0, 320, 200)
                                 PickerStyle:a[i]
                                 didSelected:^(NSString *year,
                                               NSString *month,
                                               NSString *day,
                                               NSString *hour,
                                               NSString *minute,
                                               NSString *weekDay) {
                                     switch (i) {
                                         case 0:
                                             field.text = [NSString stringWithFormat:@"%@-%@-%@ %@:%@",year,month,day,hour,minute];
                                             break;
                                         case 1:
                                             field.text = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
                                             break;
                                         case 2:
                                             field.text = [NSString stringWithFormat:@"%@-%@ %@:%@",month,day,hour,minute];
                                             break;
                                         case 3:
                                             field.text = [NSString stringWithFormat:@"%@:%@",hour,minute];
                                             break;
                                         case 4:
                                             field.text = [NSString stringWithFormat:@"%@-%@-%@ %@:%@",year,month,day,hour,minute];
                                             break;
                                         case 5:
                                             field.text = [NSString stringWithFormat:@"%@-%@-%@ %@:%@",year,month,day,hour,minute];
                                             break;
                                        default:
                                             break;
                                     }
                                 }];
        if (field == Max) {
            datePicker.maxLimitDate = [now dateByAddingTimeInterval:2222];
        }
        else if (field == Min){
            datePicker.minLimitDate = [[NSDate date]dateByAddingTimeInterval:-2222];
        }
        field.inputView = datePicker;
    }
    
    
    //delegate
    UUDatePicker *datePicker= [[UUDatePicker alloc]initWithframe:CGRectMake(0, 0, 320, 200)
                                                        Delegate:self
                                                     PickerStyle:UUDateStyle_YearMonthDayHourMinute];
    datePicker.ScrollToDate = now;
    datePicker.maxLimitDate = now;
    datePicker.minLimitDate = [now dateByAddingTimeInterval:-111111111];
    SpecifiedTime.inputView = datePicker;
    
}

#pragma mark - UUDatePicker's delegate
- (void)uuDatePicker:(UUDatePicker *)datePicker
                year:(NSString *)year
               month:(NSString *)month
                 day:(NSString *)day
                hour:(NSString *)hour
              minute:(NSString *)minute
             weekDay:(NSString *)weekDay
{
    SpecifiedTime.text = [NSString stringWithFormat:@"%@-%@-%@ %@:%@",year,month,day,hour,minute];
}

//hide keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
