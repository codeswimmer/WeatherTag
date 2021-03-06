//
//  WeatherDisplayViewController.m
//  WeatherTag
//
//  Created by Keith Ermel on 3/23/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "WeatherDisplayViewController.h"


unichar const kDegreesSymbol            = 0x00B0;
unichar const kDegreesCelsius           = 0x2103;
unichar const kDegreesFahrenheit        = 0x2109;


@interface WeatherDisplayViewController ()
// Outlets
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *barometerLabel;
@end


@implementation WeatherDisplayViewController

#pragma mark - Public API

-(void)updateTemperatureValue:(float)temperature
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.temperatureLabel.text = [self NSStringFromTemperature:temperature celsius:YES];
    });
}

-(void)updateHumidityValue:(float)humidity
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.humidityLabel.text = [self NSStringFromHumidity:humidity];
    });
}

-(void)updateBarometerValue:(int)pressure
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.barometerLabel.text = [self NSStringFromBarometer:pressure];
    });
}


#pragma mark - Internal API

-(NSString *)NSStringFromTemperature:(float)temperature celsius:(BOOL)celsius
{
    unichar degreesSymbol = (unichar)(celsius ? kDegreesCelsius : kDegreesFahrenheit);
    return [NSString stringWithFormat:@"%3.2f%C", temperature, degreesSymbol];
}

-(NSString *)NSStringFromHumidity:(float)humidity
{
    return [NSString stringWithFormat:@"%0.1f%%rH", humidity];
}

-(NSString *)NSStringFromBarometer:(int)pressure
{
    return [NSString stringWithFormat:@"%d mBar",pressure];
}


@end
