import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreen();
  }
}

class _MainScreen extends State {
  List<Map<String, dynamic>> _data1 = [
    {"question": "เพศ *"},
    {"question": "อายุ *"},
    {"question": "กำลังศึกษาอยู่ชั้น *"}
  ];

  String _sex = null;
  List<String> _sexList = ["ชาย", "หญิง"];

  String _ageBetween = null;
  List<String> _ageBetweenList = [
    "15-17 ปี",
    "18-20 ปี",
    "21-22 ปี",
    "มากกว่า 22 ปี"
  ];

  String _eduation = null;
  List<String> _eduationList = ["ปริญญาตรี", "มัธยมศึกษา"];

  Widget _buildQAForm(int i) {
    Widget ans = Padding(
      padding: EdgeInsets.zero,
    );
    if (i == 0) {
      ans = RadioGroup.builder(
          groupValue: _sex,
          onChanged: (value) {
            _sex = value;
            setState(() {});
          },
          items: _sexList,
          itemBuilder: (item) => RadioButtonBuilder(item));
    } else if (i == 1) {
      ans = RadioGroup.builder(
          groupValue: _ageBetween,
          onChanged: (value) {
            _ageBetween = value;
            setState(() {});
          },
          items: _ageBetweenList,
          itemBuilder: (item) => RadioButtonBuilder(item));
    } else {
      ans = RadioGroup.builder(
          groupValue: _eduation,
          onChanged: (value) {
            _eduation = value;
            setState(() {});
          },
          items: _eduationList,
          itemBuilder: (item) => RadioButtonBuilder(item));
    }
    Card c = Card(
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("${_data1[i]['question']}"), ans],
        ),
      ),
    );
    return c;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text("แบบสอบถามเพื่อการวิจัย"),
                  ),
                  Text("""
เรื่อง ปัจจัยที่มีอิทธิพลต่อความเป็นพ่อแม่ไอดอลในการกำหนดอนาคตชีวิตของวัยรุ่นเพื่อสร้างชาติ

คำชี้แจงแบบสอบถาม
แบบสอบถามชุดนี้จะแบ่งออกเป็น 2 ส่วนคือ
     ส่วนที่ 1 ข้อมูลส่วนบุคคล จำนวน 8 ข้อ
     ส่วนที่ 2 แบบสอบถามความคิดเห็นต่อปัจจัยที่มีอิทธิพลต่อความเป็นไอดอลในการกำหนดอนาคตชีวิตตนเองของวัยรุ่น โดยแบ่งออกเป็น 7 ด้าน  1. ด้านเป้าทะยานใจ 2. ด้านแรงบันดาลใจ 3. ด้านแรงจูงใจ 4. ด้านมูลเหตุจูงใจ 5. ด้านสิ่งประสงค์ล่อใจ 6. ด้านบ้านหลังที่หนึ่ง (พ่อ แม่) 7. ด้านความเป็นตัวตน 
การตอบแบบสอบถามชุดนี้จะไม่ส่งผลกระทบใด ๆ ต่อนักเรียน นักศึกษา แต่จะเป็นประโยชน์อย่างยิ่งต่อการสร้างเสริมความเข้มแข็งในการกำหนดอนาคตของตนเอง
* Required            
            """)
                ],
              ),
            ),
            _buildQAForm(0),
            _buildQAForm(1),
            _buildQAForm(2),
            Center(
                child: Column(
              children: [
                RaisedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SecondScreen())),
                  child: Text(
                    "ถัดไป",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondScreen();
  }
}

class _SecondScreen extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Wrap(children: [
            Text("3.1 มัธยมศึกษา โปรดระบุ (ชั้นปีและแผนการเรียน) *"),
            TextField(
              decoration: InputDecoration(hintText: ': ระบุชั้น'),
            ),
            Row(
              children: [
                RaisedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'กลับ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Spacer(),
                RaisedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ThirdScreen())),
                  child: Text(
                    'ถัดไป',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class ThirdScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThirdScreen();
  }
}

class _ThirdScreen extends State {
  List<String> _question = [
    "4. สถานภาพทางการเรียน *",
    "5. เกรดเฉลี่ยของท่านในภาคการศึกษาที่ผ่านมา *",
    "6. รายได้ของครอบครัวโดยประมาณต่อเดือน *",
    "7. สถานภาพของบิดามารดา *",
    "8. สถานภาพที่อยู่ปัจจุบัน *",
    "9. คุณทำงานอดิเรกในวันหยุด หรือ นอกเหนือจากเวลาเรียน หรือไม่ *"
  ];

  String _educationStatus = null;
  List<String> _educationStatusList = [
    "เรียนอย่างเดียว",
    "ทำงานไปด้วยเรียนไปด้วย"
  ];

  String _grade = null;
  List<String> _gradeList = ["ต่ำกว่า ๒.๐๐", "๒.๐๐ - ๓.๐๐", "สูงกว่า ๓.๐๐"];

  String _salary = null;
  List<String> _salaryList = [
    "น้อยกว่าหรือเท่ากับ ๕,๐๐๐ บาท",
    "๕,๐๐๑ – ๑๐,๐๐๐ บาท",
    "๑๐,๐๐๑ – ๒๐,๐๐๐ บาท",
    "มากกว่า ๒๐,๐๐๐ บาท"
  ];

  String _family = null;
  List<String> _familyList = ["อยู่ร่วมกัน", "แยกกันอยู่", "อย่าร้าง", "หม้าย"];

  int _currentStatus = -1;

  void _onSetCurrentStatus(int value){
    _currentStatus = value;
    setState(() {});
  }

  Widget _buildUI(int i) {
    Widget ans = Padding(
      padding: EdgeInsets.zero,
    );
    if (i == 0) {
      ans = RadioGroup.builder(
          groupValue: _educationStatus,
          onChanged: (value) {
            _educationStatus = value;
            setState(() {});
          },
          items: _educationStatusList,
          itemBuilder: (item) => RadioButtonBuilder(item));
    } else if (i == 1) {
      ans = RadioGroup.builder(
          groupValue: _grade,
          onChanged: (value) {
            _grade = value;
            setState(() {});
          },
          items: _gradeList,
          itemBuilder: (item) => RadioButtonBuilder(item));
    } else if (i == 2) {
      ans = RadioGroup.builder(
          groupValue: _salary,
          onChanged: (value) {
            _salary = value;
            setState(() {});
          },
          items: _salaryList,
          itemBuilder: (item) => RadioButtonBuilder(item));
    } else if (i == 3) {
      ans = RadioGroup.builder(
          groupValue: _family,
          onChanged: (value) {
            _family = value;
            setState(() {});
          },
          items: _familyList,
          itemBuilder: (item) => RadioButtonBuilder(item));
    } else if (i == 4) {
      ans = Column(
        children: [
          Row(
            children: [
              Radio(value: 0, groupValue: _currentStatus, onChanged: _onSetCurrentStatus),
              Text('อยู่กับบิดามารดา'),
            ],
          ),
          Row(
            children: [
              Radio(value: 1, groupValue: _currentStatus, onChanged: _onSetCurrentStatus),
              Text('อยู่กับญาติพี่น้อง'),
            ],
          ),
          Row(
            children: [
              Radio(value: 2, groupValue: _currentStatus, onChanged: _onSetCurrentStatus),
              Text('อยู่หอพัก / บ้านเช่า / ห้องเช่า'),
            ],
          ),
          Row(
            children: [
              Radio(value: 3, groupValue: _currentStatus, onChanged: _onSetCurrentStatus),
              Text('มีบ้านเป็นของตนเอง'),
            ],
          ),
          Row(
            children: [
              Radio(value: 4, groupValue: _currentStatus, onChanged: _onSetCurrentStatus),
              Row(
                children: [
                  Text('อื่น : '),
                  SizedBox(
                    width: 200,
                    child: TextField(),
                  )
                ],
              )
            ],
          )
        ],
      );
    }

    Card c = Card(
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("${_question[i]}"), ans],
        ),
      ),
    );
    return c;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Center(
                child: Column(
              children: [
                _buildUI(0),
                _buildUI(1),
                _buildUI(2),
                _buildUI(3),
                _buildUI(4),
                Row(
                  children: [
                    RaisedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'กลับ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'ถัดไป',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
