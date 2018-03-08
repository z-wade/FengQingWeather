//
//  ForecastTest.swift
//  fengqingtianqiTests
//
//  Created by cjz on 2018/3/8.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import XCTest
@testable import fengqingtianqi

class ForecastTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testJSONParse() {
        let jsonString = """
                {
                "basic": {
                "cid": "CN101010100",
                "location": "北京",
                "parent_city": "北京",
                "admin_area": "北京",
                "cnty": "中国",
                "lat": "39.90498734",
                "lon": "116.40528870",
                "tz": "8.0"
                },
                "daily_forecast": [
                {
                "cond_code_d": "103",
                "cond_code_n": "101",
                "cond_txt_d": "晴间多云",
                "cond_txt_n": "多云",
                "date": "2017-10-26",
                "hum": "57",
                "pcpn": "0.0",
                "pop": "0",
                "pres": "1020",
                "tmp_max": "16",
                "tmp_min": "8",
                "uv_index": "3",
                "vis": "16",
                "wind_deg": "0",
                "wind_dir": "无持续风向",
                "wind_sc": "微风",
                "wind_spd": "5"
                },
                {
                "cond_code_d": "101",
                "cond_code_n": "501",
                "cond_txt_d": "多云",
                "cond_txt_n": "雾",
                "date": "2017-10-27",
                "hum": "56",
                "pcpn": "0.0",
                "pop": "0",
                "pres": "1018",
                "tmp_max": "18",
                "tmp_min": "9",
                "uv_index": "3",
                "vis": "20",
                "wind_deg": "187",
                "wind_dir": "南风",
                "wind_sc": "微风",
                "wind_spd": "6"
                },
                {
                "cond_code_d": "101",
                "cond_code_n": "101",
                "cond_txt_d": "多云",
                "cond_txt_n": "多云",
                "date": "2017-10-28",
                "hum": "26",
                "pcpn": "0.0",
                "pop": "0",
                "pres": "1029",
                "tmp_max": "17",
                "tmp_min": "5",
                "uv_index": "2",
                "vis": "20",
                "wind_deg": "2",
                "wind_dir": "北风",
                "wind_sc": "3-4",
                "wind_spd": "19"
                }
                ],
                "status": "ok",
                "update": {
                "loc": "2017-10-26 23:09",
                "utc": "2017-10-26 15:09"
                }
                }
        """
        let jsonData = jsonString.data(using: .utf8)!
        do {
            let forecastList = try JSONDecoder().decode(ForecastList.self, from: jsonData)
            assert(forecastList.locationInfo != nil, "解析ForecastList里面的location失败")
        } catch {
            assertionFailure("解析ForecastList失败")
            print(error)
        }
    }
    
}