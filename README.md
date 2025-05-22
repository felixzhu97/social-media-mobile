# Instagram Clone - Flutter 社交应用

基于 Flutter 构建的 Instagram 风格社交媒体应用，包含用户发帖、浏览、点赞和评论等核心功能。

## ✨ 功能特性

- 用户注册与登录
- 发布图片/视频帖子
- 浏览关注用户的动态
- 点赞和评论功能
- 个人资料页面
- 搜索其他用户
- 本地数据缓存

## 🛠 技术栈

- **框架**: Flutter 3.x
- **状态管理**: Provider
- **网络请求**: http
- **图片加载**: cached_network_image
- **本地存储**: shared_preferences
- **UI 组件**: Material Design & Cupertino

## 🚀 安装运行

1. 确保已安装 Flutter SDK (>=2.17.0)
2. 克隆仓库:
   ```bash
   git clone https://github.com/your-repo/social-media-mobile.git
   ```
3. 安装依赖:
   ```bash
   flutter pub get
   ```
4. 运行应用:
   ```bash
   flutter run
   ```

## 📁 项目结构

```
lib/
├── main.dart          # 应用入口
├── models/            # 数据模型
│   ├── post_model.dart
│   └── user_model.dart
├── screens/           # 页面组件
│   ├── home_screen.dart
│   ├── profile_screen.dart
│   ├── search_screen.dart
│   └── add_post_screen.dart
├── services/          # 服务层
└── widgets/           # 公共组件
    └── post_card.dart
```

## 📦 主要依赖

- provider: ^6.0.3
- http: ^0.13.4
- cached_network_image: ^3.2.0
- image_picker: ^0.8.5+3
- shared_preferences: ^2.0.15
- flutter_staggered_grid_view: ^0.6.2
- font_awesome_flutter: ^10.1.0
- timeago: ^3.2.2

## 📝 许可证

MIT
