---
title: 一文解决--matplotlib绘制极坐标热力图并插值优化
date: 2020-05-13 02:50:41
tags: 
    - matplotlib
    - python
    - 热力图
    - 极坐标
    - 插值
    - 画图
    - pandas
    - 气象图
    - 毕业论文
categories: Python
mathjax: true
image: "https://blog-1259799643.cos.ap-shanghai.myqcloud.com/2020-05-13-9.jpg"
---


图画的好看，文看的舒心。
<!-- more -->

# 0️⃣ 前言
&emsp;&emsp;又到了毕业季，学弟学妹们开始了毕设之旅，提到毕设想到了什么呢？对，没错，必备技巧就是绘制各种精美绝伦，举世无双的高清美图。这不，我刚炖了碗鲜美的极坐标热力图气象图汤。😢
&emsp;&emsp;如下：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200501214945596.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0V4Y2FsaWJ1clVsaW1pdGVk,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200501215017477.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0V4Y2FsaWJ1clVsaW1pdGVk,size_16,color_FFFFFF,t_70#pic_center)

# 1️⃣ 数据准备
&emsp;&emsp;数据可以是随机产生，或者放在`csv`文件中读。在`csv`中存储格式如下：
| pos | 0            | 30           | 60           | 90           |
|-----|--------------|--------------|--------------|--------------|
| 0   | 1\.101447148 | 1\.308827831 | 1\.526038083 | 1\.603848713 |
| 30  | 1\.101447148 | 1\.279591136 | 1\.49432297  | 1\.577829862 |
| 60  | 1\.101447148 | 1\.204513965 | 1\.435064241 | 1\.52576792  |
| 90  | 1\.101447148 | 1\.108569817 | 1\.404547306 | 1\.499676995 |
| 120 | 1\.101447148 | 1\.204513965 | 1\.435064241 | 1\.52576792  |
| 150 | 1\.101447148 | 1\.279591136 | 1\.49432297  | 1\.577829862 |
| 180 | 1\.101447148 | 1\.308827831 | 1\.526038083 | 1\.603848713 |
| 210 | 1\.101447148 | 1\.279591136 | 1\.49432297  | 1\.577829862 |
| 240 | 1\.101447148 | 1\.204513965 | 1\.435064241 | 1\.52576792  |
| 270 | 1\.101447148 | 1\.108569817 | 1\.404547306 | 1\.499676995 |
| 300 | 1\.101447148 | 1\.204513965 | 1\.435064241 | 1\.52576792  |
| 330 | 1\.101447148 | 1\.279591136 | 1\.49432297  | 1\.577829862 |
| 360 | 1\.101447148 | 1\.308827831 | 1\.526038083 | 1\.603848713 |

&emsp;&emsp;因为要绘制的是极坐标图，所以列名代表的就是弧度，而行名代表的就是半径。
csv文件下载：[data.csv](https://blog-1259799643.cos.ap-shanghai.myqcloud.com/2020-05-01-data.csv)，下载后复制成四份，分别命名为`data1.csv`，`data2.csv`，`data3.csv`，`data4.csv`。

# 2️⃣ 代码
## 2️⃣.1️⃣ 导入需要的包

```python
import numpy as np
import pandas as pd
from scipy.interpolate import interp2d # 后面需要的插值库
from matplotlib import pyplot as plt 
```
## 2️⃣.2️⃣ 从`csv`文件中读取数据

```python
data1 = pd.read_csv('data1.csv')
data2 = pd.read_csv('data2.csv')
data3 = pd.read_csv('data3.csv')
data4 = pd.read_csv('data4.csv')
data = [data1, data2, data3, data4]
pos = np.array(data['pos']/180*np.pi)
ind = np.array(data.columns[1:], dtype=np.int)
values = np.array(data[ind.astype('str')])
```

## 2️⃣.3️⃣ 随机产生数据
```python
pos = np.radians(np.linspace(0, 360, 30))
ind = np.arange(0, 90, 10)
values = np.random.random((pos.size, ind.size))
```

## 2️⃣.4️⃣ 全部代码(方便大家直接复制运行)

```python
import numpy as np
import pandas as pd
from scipy.interpolate import interp2d
from matplotlib import pyplot as plt

data1 = pd.read_csv('data1.csv')
data2 = pd.read_csv('data2.csv')
data3 = pd.read_csv('data3.csv')
data4 = pd.read_csv('data4.csv')
data = [data1, data2, data3, data4]


def plot_weather_heatmap(dataList, title):
    plt.figure(figsize=(25, 25))
    for i in range(len(dataList)):
        data = dataList[i]
        '''
        方法一：从csv文件中读取数据
        '''

        # pos = np.array(data['pos']/180*np.pi)
        # ind = np.array(data.columns[1:], dtype=np.int)
        # values = np.array(data[ind.astype('str')])
        
        '''
        方法二：随机产生数据
        '''
        pos = np.radians(np.linspace(0, 360, 30))
        ind = np.arange(0, 90, 10)
        values = np.random.random((pos.size, ind.size))

        #计算插值函数
        func = interp2d(pos, ind, values.T, kind='cubic')
        tnew = np.linspace(0, 2*np.pi, 200)  # theta
        #绘图数据点
        rnew = np.linspace(0, 90, 100)  # r
        vnew = func(tnew, rnew)
        tnew, rnew = np.meshgrid(tnew, rnew)
        ax = plt.subplot(2, 2, i+1, projection='polar')
        plt.pcolor(tnew, rnew, vnew, cmap='jet')
        plt.grid(c='black')
        plt.colorbar()
        ax.set_theta_zero_location("N")
        ax.set_theta_direction(-1)
        plt.title(title[i], fontsize=20)
        #设置坐标标签标注和字体大小
        plt.xlabel(' ', fontsize=15)
        plt.ylabel(' ', fontsize=15)
        
        #设置坐标刻度字体大小
        plt.xticks(fontsize=15, rotation=90)
        plt.yticks(fontsize=15)
        # cb.set_label("Pixel reflectance")


title = ['Spring', 'Summer', 'Autumn', 'Winter']
plot_weather_heatmap(data, title)
plt.savefig("pic.png", dpi=300)
plt.show()

```

# 3️⃣ `cmap`参数，为了更好看
&emsp;&emsp;关于下面这句中的`jet`参数是指定图的色域，可以更换。

```python
plt.pcolor(tnew, rnew, vnew, cmap='jet')
```
可选值如下

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190426151922462.png#pic_center)

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190426151939114.png#pic_center)

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190426152005342.png#pic_center)

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190426152025451.png#pic_center)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190426152041444.png#pic_center)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190426152112952.png#pic_center)
