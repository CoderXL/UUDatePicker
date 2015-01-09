UUDatePicker
===============

![Flipboard playing multiple GIFs](https://github.com/ZhipingYang/UUDatePicker/raw/master/UUDatePikcer_Max_MinTests/datePicker.gif)

####UUDatePicker have four style to select:

    UUDateStyle_YearMonthDayHourMinute,
    UUDateStyle_YearMonthDay,
    UUDateStyle_MonthDayHourMinute,
    UUDateStyle_HourMinute

####and you need to add it's delegate method or used by block:

    - (id)initWithframe:(CGRect)frame PickerStyle:(DateStyle)uuDateStyle didSelected:(FinishBlock)finishBlock;
        
        UUDatePicker *datePicker= [[UUDatePicker alloc]initWithframe:CGRectMake(0, 0, 320, 200)
                                 PickerStyle:a[i]
                                 didSelected:^(NSString *year,
                                               NSString *month,
                                               NSString *day,
                                               NSString *hour,
                                               NSString *minute,
                                               NSString *weekDay) {
                                     //nslog
                                 }];

###UUDatePicker's delegate

    - (id)initWithframe:(CGRect)frame Delegate:(id<UUDatePickerDelegate>)delegate PickerStyle:(DateStyle)uuDateStyle;


    - (void)uuDatePicker:(UUDatePicker *)datePicker
                year:(NSString *)year
               month:(NSString *)month
                 day:(NSString *)day
                hour:(NSString *)hour
              minute:(NSString *)minute
             weekDay:(NSString *)weekDay

####if you want to choose datePikcer's range or make picker scroll to specified time, you can do like this:

    UUDatePicker *datePicker= [[UUDatePicker alloc]initWithframe:CGRectMake(0, 0, 320, 200)
                                                        Delegate:self
                                                     PickerStyle:UUDateStyle_YearMonthDayHourMinute];
    NSDate *now = [NSDate date];
    //scroll to specified time
    datePicker.ScrollToDate = now;
    //select the max limit time
    datePicker.maxLimitDate = now;
    //select the max limit time
    datePicker.minLimitDate = [now dateByAddingTimeInterval:-1110000];
    textfield.inputView = datePicker;

####anyway, the code still has many deficiencies need your participation to make it perfect. 

