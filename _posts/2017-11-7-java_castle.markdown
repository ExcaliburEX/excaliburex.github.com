---
layout: post
title:  "java_castle"
date:   2017-11-07 21:52:09 +0800
categories: technology
tags: learning
img: https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1510248617612&di=e15e8fd9280159cd4edf213e6955c3f0&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff31fbe096b63f624129bc8e98d44ebf81b4ca312.jpg
---
java类与对象的实例以及可扩展性


- game.java

{% highlight ruby %} 


	package castle;
	import java.util.HashMap;
	import java.util.Scanner;

	public class Game {


    private Room currentRoom;
    private HashMap<String, Handler>handlers =new HashMap<String,Handler>();
    
    public Game() 
    {
  
    	//handlers.put("go", new HandlerGo());
    	handlers.put("bye", new HandlerBye(this));
    	handlers.put("help", new HandlerHelp(this));
    	handlers.put("go", new HandlerGo(this));
    	createRooms();
    }

    private void createRooms()
    {
        Room outside, lobby, pub, study, bedroom;
      
        //	制造房间
        outside = new Room("城堡外");
          lobby = new Room("大堂");
          	pub = new Room("小酒吧");
          study = new Room("书房");
        bedroom = new Room("卧室");
        
        //	初始化房间的出口
        outside.setExit("east", lobby);
        outside.setExit("south", study);
        outside.setExit("north", pub);
          lobby.setExit("west", outside);
            pub.setExit("east", outside);
          study.setExit("north", outside);
          study.setExit("east", bedroom);
        bedroom.setExit("west",study);
          lobby.setExit("up", pub);
            pub.setExit("down", lobby);

        currentRoom = outside;  //	从城堡门外开始
    }

    private void printWelcome() {
        System.out.println();
        System.out.println("欢迎来到城堡！");
        System.out.println("这是一个超级无聊的游戏。");
        System.out.println("如果需要帮助，请输入 'help' 。");
        System.out.println();
        showPrompt();
       
    }

    // 以下为用户命令

   

    public void goRoom(String direction) 
    {
        Room nextRoom = currentRoom.getExit(direction);   
        if (nextRoom == null) {
            System.out.println("那里没有门！");
        }
        else {
            currentRoom = nextRoom;
            showPrompt();
        }
    }
    
    public void showPrompt() {
    	 System.out.println("现在你在" + currentRoom);
         System.out.print("出口有：");
         System.out.print(currentRoom.getExitDesc());
         System.out.println();
    }
    
    public void play() {
    	Scanner in = new Scanner(System.in);
    	while ( true ) {
    		String line = in.nextLine();
    		String[] words = line.split(" ");
    		Handler handler=handlers.get(words[0]);//handler的子类赋给了父类
    		String value="";
    		if(words.length>1)
    			value=words[1];
    		if(handler !=null) {
    			handler.doCmd(value);
    			if(handler.isBye())
    				break;
    		
    		}
	//    		if ( words[0].equals("help") ) {
	//    			printHelp();
	//    		} else if (words[0].equals("go") ) {
	//    			goRoom(words[1]);
	//    		} else if ( words[0].equals("bye") ) {
	//    			break;
	//    		}
	//    }
    		 
    	}
    	in.close();
    }
	
    public static void main(String[] args) {
		
		Game game = new Game(); 
		game.printWelcome();
		game.play();
        System.out.println("感谢您的光临。再见！");
       
    }
}

{% endhighlight %}

- Handler.java

{% highlight ruby %}


	package castle;
	public class Handler {

	protected Game game;
	
	public Handler(Game game) {
		this.game=game;
	}
	public void doCmd(String word) {}
	public boolean isBye() {return false;}
	}
{% endhighlight %}

- HandlerBye.java

{% highlight ruby %}


	package castle;

	public class HandlerBye extends Handler {
		public HandlerBye(Game game) {
		super(game);
	}
	@Override
	public boolean isBye() {
		// TODO Auto-generated method stub
		return true;
		
	}
	
	
}
{% endhighlight %}

- HandlerGo.java

{% highlight ruby %}
	
	package castle;

	public class HandlerGo extends Handler {
	public HandlerGo(Game game) {
		super(game);
	}
	@Override
	public void doCmd(String word) {
		game.goRoom(word);
	}

}
{% endhighlight %}

- HandlerHelp.java
{% highlight ruby %}
	
	package castle;

	public class HandlerHelp extends Handler {
	public HandlerHelp(Game game) {
		super(game);
	}
	@Override
	public void doCmd(String word) {
		System.out.println("迷路了吗？你可以做的命令有：go bye help");
        System.out.println("如：\tgo east");
	}

}
{% endhighlight %}

- Room.java

{% highlight ruby %}
	
	package castle;

	import java.util.HashMap;


	public class Room {
   	private String description;
  	 private HashMap<String,Room> exits=new HashMap<String,Room>();
 
    public Room(String description) 
    {
        this.description = description;
    }
    public void setExit(String dir,Room room) {
    	exits.put(dir, room);
    	
    }
    
    @Override
    public String toString()
    {
        return description;
    }
    
    public String getExitDesc() {
    	StringBuffer sb=new StringBuffer();
    	for(String dir:exits.keySet()) {
    		sb.append(dir);
    		sb.append(' ');		
    	}
    	return sb.toString();
    	
    }
    public Room getExit(String direction) {
    	return exits.get(direction);
    }
}
{% endhighlight %}
