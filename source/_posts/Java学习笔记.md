---
layout: post
title: "Java学习笔记"
date: 2017-2-22 21:52:09 +0800
categories: Technology
tags: Editor
image: "https://i.loli.net/2017/10/16/59e4482166117.jpg"
---

关于Java学习的笔记。

<!-- more -->

```java
Scanner in = new Scanner(System.in);
int x;
double sum=0;
int cnt=0;
cnt=in.nextInt();
if(cnt>0)
{
int [] numbers=new int [cnt];    定义数组
  for(i=0;i=cnt;i++)
{
	number[i]=in.nextInt();   对数组元素赋值
	sum+=numbers[i];
}
	double average=sum/cnt;
	for(int i=0;i< numbers.length; i++)     遍历数组
{
	if(number[i]>average)             使用数组中的元素
	{
		System.out.println(numbers[i]);
	}
  }
System.out.println(sum/cnt);
}
}  
```

定义数组变量  

```java
<类型>[]<名字>=new<类型>[元素个数];  

int[] grades  =new int[100];

double[] averages= new double[20];  
```

元素个数必须是整数
元素个数必须给出
元素个数可以是变量


* 直接初始化数组  
```java
int[] scores={87,98,54};  
```




数组变量是数组的管理者而非数组本身

数组必须创建出来然后交给数组变量来管理

数组变量之间的赋值是管理权限的赋予

数组变量之间的比较是判断是否管理同一个数组



* 投票统计
```java
写一个程序，输入数量不确定的[0,9]范围内的整数，统计每一种数字出现的次数，输入-1表示结束。  

Scanner in=new Scanner(System.in);
		int x;
		int [] numbers =new int[10];
		x=in.nextInt();
		while(x!=-1)
		{
			if(x>=0&&x<=9)
			{
				numbers[x]++;
				
			}
			x=in.nextInt();
			
		}
		for(int i=0;i<numbers.length;i++)
		{
			System.out.println(i+":"+numbers[i]);
		}  
```

* 搜索  

```java
int[] data={3,2,5,7,4,9,11,34,12,28};
		int x=in.nextInt();
		int loc=-1;
		for(int i=0;i<data.length;i++)
		{
			if(x==data[i])
			{
				loc=i;
				break;
			}
		}
		if(loc>-1)
		{
			System.out.println(x+"是第"+(loc+1)+"个");
			
		}
		else
		{
			System.out.println(x+"不在其中");
		}  
```


* 数组的例子 素数

去掉偶数后，从3到x-1，每次加2  
```java
if( x==1 || x%2 ==0 && x!=2)
		{
			isPrime =false;
		}
		else
		{
			for(int i=3;i<x;i+=2)
			{
				if(x%i ==0)
				{
					isPrime =false;
					break;
				}
			}
		}  
```




* 无须到x-1，到sqrt(x)就够了  
```java
for(int i=3;i<Math.sqrt(x);i+=2)
{
	 	if(x%i ==0)
	{
		isPrime=false;
		break;
	 	}
}
nn/2sqrt(n)

int[] primes=new int[50];
		primes[0]=2;
		int cnt=1;
		MAIN_LOOP:
		for (int x=3;cnt<50;x++)
		{
			for (int i=0;i<cnt;i++)
			{
				if (x%primes[i]==0)
				{
					continue MAIN_LOOP;
				} 
			}
			primes[cnt++]=x;
		}
		for (int k: primes)
		{
			System.out.print(k+" ");
		}
```




* 计算机的算法  
```java
boolean[] isPrime =new boolean[100];
		for (int i=0;i<isPrime.length;i++)
		{
			isPrime[i]=true;
		}
		for(int i=2;i<isPrime.length;i++)
		{
			if(isPrime[i])
			{
				for(int k=2;i*k<isPrime.length;k++)
				{
					isPrime[i*k]=false;
				}
			}
		}
		for(int i=2;i<isPrime.length ;i++)
		{
			if(isPrime[i])
			{
		System.out.print(i+" ");
			}	
			
		}
		System.out.println();  
```



* 二维数组  
```java 

int[][]  a =new int[3][5];  

```

通常理解为a是一个3行5列的矩阵


初始化  
```java
int[][] a ={
	{1,2,3,4},
	{1,2,3},
};  
```


圈叉游戏   
```java
	final int SIZE=3;
	int[][] board =new int[SIZE][SIZE];
		boolean gotResult=false;
		int numOfx=0;
		int numOfO=0;
        for (int i=0;i<board.length;i++)
		{
			for(int j=0;j<board[i].length;j++)
			{
				board[i][j]=in.nextInt();
			}
		}
		
		
		//检查行
		for (int i=0;i<SIZE;i++)
		{
			for(int j=0;j<SIZE;j++)
			{
				if(board[i][j]==1)
				{
					numOfx++;
				}
				else
				{
					numOfO++;
				}
				
			}
			if(numOfx==SIZE|| numOfO== SIZE)
			{
				gotResult=true;
				break;
			}
			else
			{
				 numOfx=0;
				 numOfO=0;
			}
		}
		
		//检查列
		if(!gotResult)
		{
			 numOfx=0;
			 numOfO=0;
			for (int j=0;j<board.length;j++)
			{
				for(int i=0;i<board[j].length;i++)
				{
					if(board[i][j]==1)
					{
						numOfx++;
					}
					else
					{
						numOfO++;
					}
				}
				if(numOfx==SIZE|| numOfO== SIZE)
				{
					gotResult=true;
					break;
				}
				else
				{
					 numOfx=0;
					 numOfO=0;
				}
			}
			
		}
		//检查对角线
		if(!gotResult)
		{
			 numOfx=0;
			 numOfO=0;
			for(int i=0;i<SIZE;i++)
			{
				if(board[i][i]==1)
				{
					numOfx++;
				}
				else
				{
					numOfO++;
				}
				if(numOfx==SIZE|| numOfO== SIZE)
				{
					gotResult=true;
				}
		}	
			}
			//检查反对角
			if(!gotResult)
			{
				 numOfx=0;
				 numOfO=0;
				for(int i=0;i<SIZE;i++)
				{
					if(board[i][SIZE-1-i]==1)
					{
						numOfx++;
					}
					else
					{
						numOfO++;
					}
					if(numOfx==SIZE|| numOfO== SIZE)
					{
						gotResult=true;
					}


​				
​			}	
​			
		}
			if(gotResult)
			{
				if(numOfx==SIZE)
				{
					System.out.println("1赢了");
				}
				else
				{
					System.out.println("0赢了");
				}
			}  
```













  











