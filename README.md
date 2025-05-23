# Social App - Flutter 社交应用

基于 Flutter 构建的 Instagram 风格社交媒体应用，包含用户发帖、浏览、点赞和评论等核心功能。

## 应用截图

<img src="docs/screenshot/home.jpeg" alt="home" width="500px">
<br/>
<img src="docs/screenshot/explore.PNG" alt="explore" width="500px">
<br/>
<img src="docs/screenshot/profile.PNG" alt="profile" width="500px">
<br/>
<img src="docs/screenshot/login.PNG" alt="login" width="500px">
<br/>
<img src="docs/screenshot/register.jpeg" alt="register" width="500px">

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

### 开发环境配置

1. 安装 Flutter SDK (>=3.0.0)
   ```bash
   # 下载并解压Flutter SDK
   git clone https://github.com/flutter/flutter.git -b stable
   export PATH="$PATH:`pwd`/flutter/bin"
   ```
2. 检查环境配置:
   ```bash
   flutter doctor
   ```
3. 克隆仓库:
   ```bash
   git clone https://github.com/your-repo/social-media-mobile.git
   cd social-media-mobile
   ```
4. 安装依赖:
   ```bash
   flutter pub get
   ```
5. 运行应用:
   ```bash
   flutter run
   ```

### 构建发布

- Android APK:
  ```bash
  flutter build apk --release
  ```
- iOS IPA:
  ```bash
  flutter build ipa --release
  ```
- Web:
  ```bash
  flutter build web --release
  ```

## 📁 项目结构

### 整体项目结构 (Monorepo)
```
.
├── apps/                   # 应用目录
│   ├── admin-panel/        # 管理后台应用
│   ├── api-server/         # API服务端
│   └── mobile-app/         # 移动应用
├── packages/               # 共享包
│   ├── shared-types/       # 共享类型定义
│   └── ui/                 # UI组件库
└── docs/                   # 文档资源
```

### 移动应用 (Flutter)
```
apps/mobile-app/
├── lib/                    # Dart源代码
│   ├── main.dart           # 应用入口
│   ├── models/             # 数据模型
│   ├── screens/            # 页面组件
│   ├── services/           # 服务层
│   └── widgets/            # 公共组件
├── android/                # Android平台代码
├── ios/                    # iOS平台代码
├── web/                    # Web平台代码
└── test/                   # 测试代码
```

### API服务端 (Node.js/TypeScript)
```
apps/api-server/
├── src/                    # 源代码
│   ├── controllers/        # 控制器
│   ├── middleware/         # 中间件
│   ├── models/             # 数据模型
│   ├── routes/             # 路由定义
│   ├── services/           # 服务层
│   ├── tests/              # 测试代码
│   └── types/              # 类型定义
├── scripts/                # 脚本工具
└── serverless.yml          # Serverless配置
```

### 共享包
```
packages/
├── shared-types/           # 共享类型定义
│   └── src/                # 类型定义源代码
└── ui/                     # UI组件库
    └── src/                # 组件源代码
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

## 🤝 贡献指南

欢迎贡献代码！请遵循以下步骤：

1. Fork 项目仓库
2. 创建你的分支 (`git checkout -b feature/your-feature`)
3. 提交修改 (`git commit -m 'Add some feature'`)
4. 推送到分支 (`git push origin feature/your-feature`)
5. 创建 Pull Request

## 🐛 问题反馈

如发现任何问题，请通过以下方式反馈：

- 在 GitHub Issues 中创建新问题
- 邮件联系: 1434866867@qq.com

## 📝 许可证

MIT
