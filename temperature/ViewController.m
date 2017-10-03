//
//  ViewController.m
//  temperature
//
//  Created by user on 9/27/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *sgmtControl;
@property (weak, nonatomic) IBOutlet UISlider *sliderSize;
@property (weak, nonatomic) IBOutlet UILabel *lblTemp;
@property (getter=getoldMetric,setter=setoldMetric:) int oldMetric;


@property (weak, nonatomic) IBOutlet UILabel *lblPassiveTemp;
@property (weak, nonatomic) IBOutlet UILabel *lblPassiveTemp2;

@property (weak, nonatomic) IBOutlet UILabel *lblNumTemp;
@property (weak, nonatomic) IBOutlet UILabel *lblNumTemp1;

@property (weak, nonatomic) IBOutlet UIButton *btnCalculate;







@end

@implementation ViewController
int nTemp = 0;
int nTemp1 = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.lblTemp setText:[NSString stringWithFormat:@"%d",(int)self.sliderSize.value]];
    [self.lblNumTemp setText:[NSString stringWithFormat:@"%d", nTemp]];
    [self.lblNumTemp1 setText:[NSString stringWithFormat:@"%d", nTemp1]];
    
    [self setoldMetric:2];
    
    
    self.lblPassiveTemp.text = @"Celcius to Farenheit";
    self.lblPassiveTemp2.text = @"Celcius to Kelvin";
    
    self.lblNumTemp.text = @"32";
    self.lblNumTemp1.text = @"273";

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderChange:(id)sender {
 [self.lblTemp setText:[NSString stringWithFormat:@"%d",(int)self.sliderSize.value]];

    
    
}

- (IBAction)sgmtChange:(id)sender {
   
    
    [self CalculateTemperature];
}

- (IBAction)btnCalculate:(id)sender {
   
     [self.lblNumTemp setText:[NSString stringWithFormat:@"%d", nTemp ]];
     [self.lblNumTemp1 setText:[NSString stringWithFormat:@"%d", nTemp1 ]];
    

}
              
              
    -(void) CalculateTemperature{
    int actualMetric =self.sgmtControl.selectedSegmentIndex;
    int actualValue = self.sliderSize.value;
    int old = [self getoldMetric];
    int newValue = 0;
    int newvalue2 = 0;
    int newvalue3 = 0;
    

    switch (actualMetric) {
        case 0: //fahrenheit
            
            //set boundaris from 32 - 132
            self.sliderSize.minimumValue = 32;
            self.sliderSize.maximumValue = 132;
            self.lblPassiveTemp.text = @"Farenheit to Celcius";
            self.lblPassiveTemp2.text = @"Farenheit to Kelvin";
            if( old == 1) // kelvin to(32) Farenheit
            {
                newValue =  actualValue - 241;
                newvalue2 = actualValue - 273;
                newvalue3 = actualValue;
           
                
   
                
            }
            else //  celcius to(0) Fahrenheit
            {
                newValue =  actualValue + 32;
                newvalue2 = actualValue;
                newvalue3 = actualValue + 273;
       
                
                
            }
        break;
            
        case 1: //kelvin
            self.sliderSize.minimumValue = 273;
            self.sliderSize.maximumValue = 373;
            self.lblPassiveTemp.text = @"Kevin to Celcius";
            self.lblPassiveTemp2.text = @"Kelvin to Farenheit";
            if( old == 0) //kelvin to(32) fahrenheit
            {
                newValue  = 241 + actualValue;
                newvalue2 = actualValue - 32;
                newvalue3 = actualValue;
                
            }
            else //Kelvin to(0) celcius
            {
                newValue  =  273 + actualValue;
                newvalue2 =   actualValue;
                newvalue3 =  32 + actualValue;

            }
            break;
            
        case 2: //celcius
            self.sliderSize.minimumValue = 0;
            self.sliderSize.maximumValue = 100;
            self.lblPassiveTemp.text = @"Celcius to Farenheit";
            self.lblPassiveTemp2.text = @"Celcius to Kelvin";
            if( old == 1) //Celcius to(0) kelvin
            {
                newValue = actualValue - 273;
                newvalue2 = actualValue - 241;
                newvalue3 = actualValue;
             
       
            }
            else // Celcius to() faranheit
            {
                
                newValue = actualValue - 32;
                newvalue2 = actualValue;
                newvalue3 = actualValue + 241;
         
             
            }
         
            break;
            
            
        default:
            break;
          
      
    }
        nTemp  = newvalue2;
        nTemp1 = newvalue3;
    [self.lblTemp setText:[NSString stringWithFormat:@"%d", newValue]];
 
    self.sliderSize.value = newValue;
       
    
 
    [self setoldMetric:actualMetric];
    
    
    
 
        
}





@end
