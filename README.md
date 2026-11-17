# 一问便签（yiwen_note）

[![Swift](https://img.shields.io/badge/Swift-5.0-F05138?logo=swift&logoColor=white)](https://www.swift.org)
[![iOS](https://img.shields.io/badge/iOS-17.0%2B-000000?logo=apple&logoColor=white)](https://developer.apple.com/ios/)
[![Xcode](https://img.shields.io/badge/Xcode-15-147EFB?logo=xcode&logoColor=white)](https://developer.apple.com/xcode/)
[![SwiftUI](https://img.shields.io/badge/UI-SwiftUI-0A84FF)](https://developer.apple.com/xcode/swiftui/)
[![Version](https://img.shields.io/badge/version-1.0-lightgrey)](yiwen_note.xcodeproj/project.pbxproj)

一问便签是一个面向 iPhone / iPad 的 SwiftUI 练习项目，目标是做一份简单的提醒事项列表。工程于 2023-10-26 用 Xcode 15 创建，目前仍是界面骨架：内存里有一条示例事项，主列表还是空的，单条编辑视图已经写好但尚未接到列表上。

<p>
  <img src="yiwen_note/Assets.xcassets/AppIcon.appiconset/DALL·E%202023-10-26%2013.06.27%20-%20Illustration%20of%20a%20minimalist%20notepad%20with%20a%20subtle%20shadow,%20having%20a%20folded%20corner%20on%20the%20top%20right%20and%20a%20stylized%20pencil%20sketching%20a%20line%20on%20it.png" alt="应用图标：折角便签与铅笔" width="128" />
</p>

仓库里唯一的图片是上面这张 1024×1024 应用图标（资源目录中的文件名保留了生成时的原文）。没有运行截图。

## 当前做到哪一步

启动后进入 `NavigationView`：一侧是标题为「提醒事项」的列表，另一侧是占位文案 `Select an Event`。列表的 `List` 与导航栏两侧工具栏都是空的，点击空白处会收起键盘。

| 模块 | 文件 | 现状 |
| --- | --- | --- |
| 入口 | `yiwen_note/yiwen_noteApp.swift` | 创建一份 `EventData`，注入环境，并摆好分栏导航 |
| 事项模型 | `yiwen_note/Model/Event.swift` | `id`、`content`、`remark`、`isComplete`（默认未完成） |
| 内存数据 | `yiwen_note/Model/EventData.swift` | 预置「跑步 / 每日五公里」，并提供 `add`、`delete`；不落盘 |
| 列表页 | `yiwen_note/View/EventList.swift` | 标题、空列表、空工具栏、点击收起键盘；未读取 `events` |
| 单条视图 | `yiwen_note/View/ItemView.swift` | 圆形复选框、内容输入框「添加」、备注输入框「备注」；未被列表引用 |
| 文案 | `en.lproj`、`zh-Hans.lproj` | 已加入工程，Swift 界面仍使用写死的字符串 |

本地化文件里现有两条：

| Key | English | 简体中文 |
| --- | --- | --- |
| `Page title` | Tips Info | 提醒事项 |
| `Item remark` | add remark | 添加备注 |

## 技术栈

| 项 | 值 |
| --- | --- |
| 语言 | Swift 5.0 |
| UI | SwiftUI（`NavigationView`、`List`、`TextField`、自定义 `ToggleStyle`） |
| 最低系统 | iOS 17.0 |
| 设备 | iPhone 与 iPad（`TARGETED_DEVICE_FAMILY = 1,2`） |
| 工程 | Xcode 15（`objectVersion` 56，兼容 Xcode 14.0 的工程格式；`CreatedOnToolsVersion` / `LastUpgradeCheck` 为 15.0） |
| 显示名 | 一问便签 |
| Bundle ID | `com.yiwen.yiwen-note` |
| 版本 | Marketing 1.0，Build 1 |
| 签名 | Automatic，Development Team `84F8R9TAQN` |
| 方向 | iPhone：竖屏、左横屏、右横屏；iPad：四个方向 |
| 依赖 | CocoaPods 1.11.2。`Podfile` 的 target 中没有任何 pod，`Pods/` 只含空 target 的支持文件 |
| 测试 | 无测试 target |

`Podfile` 里的 `platform :ios, '9.0'` 处于注释状态。真正的部署目标以 Xcode 工程里的 iOS 17.0 为准。

## 目录结构

```text
.
├── Podfile                  # CocoaPods 配置，当前无第三方库
├── Podfile.lock             # CocoaPods 1.11.2 生成，校验和与空依赖一致
├── Pods/                    # 已提交的空 Pods 工程与 xcconfig
├── yiwen_note.xcworkspace   # 请打开这个，而不是单独打开 .xcodeproj
├── yiwen_note.xcodeproj     # 应用 target：yiwen_note
└── yiwen_note/
    ├── yiwen_noteApp.swift
    ├── Model/
    │   ├── Event.swift
    │   └── EventData.swift
    ├── View/
    │   ├── EventList.swift
    │   └── ItemView.swift
    ├── Assets.xcassets/     # AppIcon、空的 AccentColor
    ├── Preview Content/
    ├── en.lproj/Localizable.strings
    └── zh-Hans.lproj/Localizable.strings
```

工程开发区域是 `en`，已知区域还有 `Base` 与 `zh-Hans`。`Info.plist` 由 Xcode 生成（`GENERATE_INFOPLIST_FILE = YES`），仓库里没有单独的 plist。`AccentColor` 色集没有填写颜色。

## 环境要求

- macOS，并安装 Xcode 15 或与 iOS 17 SDK 匹配的更新版本
- iOS 17 模拟器，或一台已登录对应开发者团队的真机
- 可选：CocoaPods 1.11.x。当前没有第三方 pod，已提交的 `Pods/` 足够打开工程

本仓库在 Linux 上不能编译。撰写本文时的检查环境是 Linux x86_64，系统里没有 `xcodebuild`、`swift` 和 `pod`。

## 安装与运行

在装有 Xcode 的 Mac 上：

```bash
git clone https://github.com/Hao-yiwen/yiwen_note.git
cd yiwen_note
open yiwen_note.xcworkspace
```

在 Xcode 里选择 target **yiwen_note**，运行目标选一台 iOS 17+ 模拟器（或已配置签名的真机），然后使用 Run。SwiftUI Preview 已开启。`EventList_Previews` 没有注入 `EventData`，直接预览该视图时会缺少环境对象。

仓库里没有提交共享的 `yiwen_note.xcscheme`（只有用户目录下的 scheme 状态，以及 Pods 的用户 scheme）。用 Xcode 打开工作区后，一般会按 target 自动出现同名 scheme。若本机已经能列出该 scheme，可以用命令行编译：

```bash
xcodebuild \
  -workspace yiwen_note.xcworkspace \
  -scheme yiwen_note \
  -destination 'generic/platform=iOS Simulator' \
  build
```

指定一台已安装的模拟器时，把 destination 换成类似 `platform=iOS Simulator,name=iPhone 15,OS=17.0` 的形式（名称和系统版本以本机 `xcrun simctl list devices` 为准）。

`pod install` 不是当前打开工程的必要步骤。若本机 CocoaPods 与已提交的 `Pods/` 不一致，再在仓库根目录执行：

```bash
pod install
```

**验证情况：** 上述命令依据 `project.pbxproj`、`Podfile` 和源码整理。当前环境没有 Xcode，没有实际执行 `open`、`xcodebuild` 或 `pod install`，也没有在模拟器里点过界面。

## 备注

- 事项只存在 `EventData.events` 这个内存数组里，进程结束后消失。示例数据是「跑步 / 每日五公里」。
- `ItemView` 用 SF Symbol `circle` / `largecircle.fill.circle` 画复选框，勾选状态绑定的是调用方传入的 `isReminderOn`，与 `Event.isComplete` 尚未连接。
- 界面可见文案目前是中文硬编码（「提醒事项」「添加」「备注」）和英文占位 `Select an Event`，没有调用 `Localizable.strings`。
- 仓库包含 `xcuserdata`（界面状态、断点）。那是当时本机 Xcode 的用户数据，克隆后可以忽略。
- 没有 `.gitignore`，`Pods/` 与用户数据一并在版本库中。
