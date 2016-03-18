# CXLockScreen

一个锁屏功能，简单易用。

![](https://github.com/wcxdell/CXLockScreen/blob/master/image-folder/image.gif)
## 使用说明：
### 设置锁屏密码

```objective-c
CXLockViewController *vc = [[CXLockViewController alloc] init];
vc.mode = LockModeSet;
[self.navigationController pushViewController:vc animated:YES];
```

### 解锁

```objective-c
CXLockViewController *vc = [[CXLockViewController alloc] init];
vc.mode = LockModeUnlock;
[self.navigationController pushViewController:vc animated:YES];
```


设置一下mode即可。



没有美工，还比较丑，拿去稍微改一下就可以。
提示目前写在log里，根据需要自己改就行，代码量不大，简单易懂。


主要是想练习一下贝塞尔曲线，然而并没有用到曲线。。。
