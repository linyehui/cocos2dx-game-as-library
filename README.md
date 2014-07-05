把cocos2dx的Sample工程改成Static Library
===========

# 需求描述
1. 我们的产品分为大厅和游戏两大模块，大厅使用iOS或Android SDK直接开发，游戏内嵌在大厅中，但是使用cocos2dx开发；
2. 我们希望把大厅和游戏从project上分开来，省的代码缴在一起编译，看着都恶心
3. Andoird下已经实现上述需求，大厅使用SDK开发，游戏作为Library提供给大厅直接调用
4. 现在我们需要把iOS下的cocos2dx工程也改造成一个Library提供给大厅调用。

# 前提
Mac下已经配置好了cocos2dx的开发环境，Sample中的HelloCpp工程可以在Xcode下成功编译并运行
#### 开发环境
Xcode 5.0.2
Cocos2d-x 2.2.4

# 操作步骤
### 1. 把HelloCpp工程从Cocos2dx目录下复制出来
#### 问题：复制出来后会提示cocos2d.h文件找不到
##### 原因
原因是Sample工程设置的include路径是按照工程再cocos自己的目录下来设置的，把工程复制出来后路径就变了

##### 解决方案
1. 先添加一个SourceTrees变量
> Perferences->Locatons->Source Trees
添加一个COCOS2DX_HOME变量，并把path设置成本机的cocos2dx根目录
2. 修改工程Targets中的Header Search Paths
> 点击工程->Targets->HelloCpp->Build Settings->Search Paths->Header Search Paths
把值修改成这个：
```
"$(SDKROOT)/usr/include/libxml2/" "$(COCOS2DX_HOME)/cocos2dx/include" "$(COCOS2DX_HOME)/cocos2dx" "$(COCOS2DX_HOME)/cocos2dx/platform/ios" "$(COCOS2DX_HOME)/cocos2dx/kazmath/include" "$(COCOS2DX_HOME)/external/chipmunk/include/chipmunk"
```

3. Clean工程，然后再次Build，成功

### 2. iOS工程启动先进入UIView，再跳转到Cocos2d场景，并可以跳转回来
#### 先把HelloCpp工程调整成这样

发现这个文章做了我想做的事情的一部分：
[Cocos2d-x UIView和Coco2d-x场景之间的相互跳转切换](http://blog.csdn.net/crayondeng/article/details/16828555)

[如何结合使用Cocos2d和UIKit 第一部分](http://www.raywenderlich.com/zh-hans/24764/%E5%A6%82%E4%BD%95%E7%BB%93%E5%90%88%E4%BD%BF%E7%94%A8cocos2d%E5%92%8Cuikit-%E7%AC%AC%E4%B8%80%E9%83%A8%E5%88%86)

### 3. 新增HelloCpp Target：Static Library
在Library的Target中有几个点需要参考默认Target的配置：
1. 不使用ARC
> Object-C Automatic Reference Counting -----> NO
2. Search Path，直接复制默认Target的配置即可
```
"$(SDKROOT)/usr/include/libxml2/" "$(COCOS2DX_HOME)/cocos2dx/include" "$(COCOS2DX_HOME)/cocos2dx" "$(COCOS2DX_HOME)/cocos2dx/platform/ios" "$(COCOS2DX_HOME)/cocos2dx/kazmath/include" "$(COCOS2DX_HOME)/external/chipmunk/include/chipmunk"
```
3. 修改预编译宏定义 Preprocessor Macros，也是直接复制默认的Target配置就可以了
> USE_FILE32API CC_TARGET_OS_IPHONE COCOS2D_DEBUG=1
> USE_FILE32API CC_TARGET_OS_IPHONE
4. 添加对libcocos2dx.a的依赖
> Build Phases->Link Binary With Libraries

5. 新的Target配置成功后会编译出.a文件

### 4. 新增工程GamesHall用于调用library
* 把HelloCpp工程添加到GamesHall下
* 在Target中添加对libhellocpp.a的依赖
* 不添加任何代码，编译工程，可以运行
* 如果不能运行要按照错误提示进行修改，很有可能是libhellocpp.a没有编译出来，那就要检查下上面的步骤，看新增的Static Library的Target是不是配置的有问题
* 配置正确的话，GamesHall编译后可以再调试目录(Debug-iphonesimulator)下看到libhellocpp.a和libcocos2dx.a还有include目录都正确复制过来了

> /Users/linyehui/Library/Developer/Xcode/DerivedData/GamesHall-ezsoyplchjjurfeznsedhgwywbkr/Build/Products/Debug-iphonesimulator

### 5. 添加代码调用
* 添加后发现link失败，找了好多原因，最后有效的是这个：
[IOS7 (only) stdlibc++ linking issue](http://stackoverflow.com/questions/18959691/ios7-only-stdlibc-linking-issue)
* 改完stdlib后又提示zlib相关的几个函数找不到
工程依赖加上libz.dylib

### 6. 调用成功，独立成Static Library没问题

### 7. 尝试多个游戏一起加入进来
* 单个HelloCpp是OK的
* 两个一起加会编译失败但没有具体失败的项，只有Warning，很奇怪
* 两个分别成功加进去，并正确运行后，再把两个加到一起，可以运行，但是第二个游戏错乱了，还要再找下原因
* 第二个游戏不是乱了，而是显示了第一个游戏的场景；原因是：
```
注册cocos2d::CCApplication用的是一个全局静态变量，而不是注册上去的，我们有两个游戏，其实有两个这个全局变量的实现，用来处理cocos的启动跟暂停；
而且我们的runWithScene是在这个里面调用的，所以导致了，两个游戏启动的时候都调用到了同样的场景。
```

* 尝试自己runWithScene，看看能不能把两个游戏分开
CCApplication的之类全局自定义一个，然后runWitSenne拿到cocosView中来分别处理，可以做到，但是这个方案并不好，下面单独解释。

# 两个工程合在一起的问题
###结论：
> 不要把两个独立的游戏座位Library整合在一个应用内。
> 技术上可以实现，但是Cocos架构不支持，勉强自己改来用的话出现莫名其妙问题的风险很大。

### 非要实现的细节和缺陷
1. Cocos本身的设计没有考虑这种一个进程多个游戏的架构，我们使用会有架构风险
比如cocos2d::CCApplication的事件注册并不是Add上去，而是定义一个全局变量来实现，这个设计本身就没考虑多个实例同时存在
    
    ```
    // cocos2d application instance
    // 两个游戏加到一个工程的时候只能保留一个，否则会从Cocos内部直接异常退出
    // 变量名不同也没用，因为实际起作用的是父类CCApplication的成员变量
    // static CCApplication * sm_pSharedApplication;
    
    //static CocosAppDelegate s_sharedApplication;
    
    ```
    解决的办法，是多个游戏只保留一个CCApplication之类的全局变量的定义。

2. 本来应该每个游戏自己响应CCApplication事件并做出处理，现在这个点不能做了，架构上本身就有问题，和把游戏整个在一个Cocos实例下没有本质的区别，未知的问题还更多

3. Xcode对于这种多个Library依赖同一个Library的编译支持有时候会出错
会出现上面提到的：提示编译失败，但是没有列出具体失败的地方，如果这个时候把其中一个游戏工程删掉，错误的地方就能正确被提示

# 关于静态库对安装包大小的影响
以下三个包，资源都是一样的，只是库文件上有差异
### 只有大厅，不包含游戏库，.app大小235KB
![just hall](https://raw.githubusercontent.com/linyehui/cocos2dx-game-as-library/master/screenshot/just_hall.png)

### 大厅+一个cocos2dx游戏Library，.app大小3.5MB
![one game](https://raw.githubusercontent.com/linyehui/cocos2dx-game-as-library/master/screenshot/one_game.png)

### 大厅+两个cocos2dx游戏Library，.app大小3.2MB
![two games](https://raw.githubusercontent.com/linyehui/cocos2dx-game-as-library/master/screenshot/two_games.png)

科学吗？差不多是这个意思

# 其他参考文章
[iOS 静态类库项目的建立与使用](http://www.cnblogs.com/beginor/archive/2012/04/20/2459244.html)
