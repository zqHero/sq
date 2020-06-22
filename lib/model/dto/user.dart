/*
 * create_by: zq_hero
 * Date:  2020/6/17  10:25
 * csdn:https://heroes.blog.csdn.net
 * github:https://github.com/zqHero
 * 
 * 用户类：  User data TO Object
 */
class User {
  String token;
  String userName;
  String phoneNum;
  String avatarUrl;
  String password; //密码

  User({
    this.token,
    this.userName,
    this.phoneNum,
    this.avatarUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userName = json['userName'];
    phoneNum = json['phoneNum'];
    avatarUrl = json['avatarUrl'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['userName'] = this.userName;
    data['phoneNum'] = this.phoneNum;
    data['avatarUrl'] = this.avatarUrl;
    data['password'] = this.password;
    return data;
  }
}
