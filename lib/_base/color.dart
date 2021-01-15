import 'package:hexcolor/hexcolor.dart';

color(type) {
  switch (type) {
      case 'primary':
        return HexColor('#7267F9');
      case 'success':
        return HexColor('#19B071');
      case 'warning':
        return HexColor('#FBBC09');
      case 'danger':
        return HexColor('#FA5F5A');
      case 'dark':
        return HexColor('#353140');
      case 'white':
        return HexColor('#FFFFFF');
      case 'light':
        return HexColor('#FBFBFF');
      case 'link':
        return HexColor('#F3F2FB');
      case 'secondary':
        return HexColor('#9D9D9D');
      case 'secondary-500':
        return HexColor('#C1C1C1');
      case 'info':
        return HexColor('#BCD8FF');
      default:
        print('invalid params Color will get default "primary"');
        return HexColor('#7267F9');
    }
}
