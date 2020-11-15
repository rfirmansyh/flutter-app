/* 
  class helper agar mudah manage color seperti css ehehe
 */

class Variable {
  static color(String type) {
    switch (type) {
      case 'primary':
        return '#7267F9';
      case 'success':
        return '#19B071';
      case 'warning':
        return '#FBBC09';
      case 'danger':
        return '#FA5F5A';
      case 'dark':
        return '#353140';
      case 'white':
        return '#FFFFFF';
      case 'light':
        return '#FBFBFF';
      case 'link':
        return '#F3F2FB';
      case 'secondary':
        return '#9D9D9D';
      case 'secondary-500':
        return '#C1C1C1';
      case 'info':
        return '#BCD8FF';
      default:
        print('invalid params Color will get default "primary"');
        return '#7267F9';
    }
  }
}
