import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  var _obscureText = true;

  //建立一个函数
  Widget _buildTopWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/baiduLogo.png'),
          Text(
            "欢迎登录百度账户",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  //账号输入框
  Widget _buildAccountWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: TextField(
        onChanged: (text) {
          _accountText = text;
          _checkUserInput();
        },
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          hintText: '请输入手机号/用户名/邮箱',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          contentPadding: EdgeInsets.only(left: 8),
        ),
      ),
    );
  }

  //密码输入框
  Widget _buildPasswordWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextField(
        onChanged: (text) {
          _passwordText = text;
          _checkUserInput();
        },
        style: TextStyle(fontSize: 18),
        obscureText: _obscureText, //输入密码变成"..."不可见定义一个_obscureText变量通过点击重新绘制节目
        decoration: InputDecoration(
            hintText: '请输入登录密码',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
            filled: true,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  //某些状态刷新需要重新绘制节目
                  _obscureText = !_obscureText;
                });
              },
              icon: Image.asset(
                  _obscureText ? 'assets/closeEye.png' : 'assets/openEye.png',
                  width: 20,
                  height: 20),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            fillColor: Color.fromARGB(255, 240, 240, 240),
            contentPadding: EdgeInsets.only(left: 8)),
      ),
    );
  }

  //定义了一个函数
  var _isEnableLogin = false;

  _getLoginButtonPressed() {
    if (!_isEnableLogin) return null;
    return () {};
  }

  var _accountText = '';
  var _passwordText = '';

  _checkUserInput() {
    if (_accountText.isEmpty || _passwordText.isEmpty) {
      _isEnableLogin = false;
    } else {
      _isEnableLogin = true;
    }
    setState(() {});
  }

  Widget _buildLoginButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width, //测量了父布局的宽度
      height: 45,
      child: RaisedButton(
        onPressed: _getLoginButtonPressed(),
        color: Colors.blue,
        disabledColor: Colors.black12,
        child: Text(
          "登 录",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  //build类构建app页面
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("百度网盘"),
        centerTitle: true, //居中属性
      ),
      body: SingleChildScrollView(
        //用于处理输入法占位置使页面可以滚动的布局
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopWidget(context),
              _buildAccountWidget(context),
              _buildPasswordWidget(context),
              _buildLoginButtonWidget(context),
            ],
          ),
        ),
      ),
    );
  }
}
