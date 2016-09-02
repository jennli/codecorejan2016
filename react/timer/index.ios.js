// var React = require("react-native");
// var {
//   View,
//   Text,
//   AppRegistry,
//   StyleSheet
// } = React;
//
// var Timer = React.createClass({
//   render: function(){
//     return <View>
//             <Text>My Timer App</Text>
//             </View>
//   }
// });
//
// // AppRegistry.registerComponent('timer', function(){
// //  return Timer;
// // });
//
// AppRegistry.registerComponent('timer', () => Timer);

// /**
//  * Sample React Native App
//  * https://github.com/facebook/react-native
//  */
'use strict';
import React, {
  AppRegistry,
  Component,
  StyleSheet,
  Text,
  View,
  TouchableHighlight
} from 'react-native';

// class timer extends Component {
//   render() {
//     return (
//       <View style={styles.container}>
//         <Text style={styles.welcome}>
//           Welcome to React Native!
//         </Text>
//         <Text style={styles.instructions}>
//           To get started, edit index.ios.js
//         </Text>
//         <Text style={styles.instructions}>
//           Press Cmd+R to reload,{'\n'}
//           Cmd+D or shake for dev menu
//         </Text>
//       </View>
//     );
//   }
// }

class timer extends Component {
  _onPressButton(){
    alert("Hello");
  }

  render() {
    return (
      <View style={styles.container}>
      <Text style={styles.welcome}>
      My First app
      </Text>

      <TouchableHighlight onPress={this._onPressButton}>
      <Text>Start</Text>
      </TouchableHighlight>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    // 100%
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('timer', () => timer);
