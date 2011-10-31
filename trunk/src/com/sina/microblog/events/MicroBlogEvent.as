package com.sina.microblog.events
{
	import flash.events.Event;

	/**
	 * 所有对新浪微博API的请求会以事件的形式返回给调用者.当API请求正常返回时，MicroBlog类会派发MicroBlogEvent事件.
	 * 
	 * <p>每个MicroBlogEvent事件都有一个result属性用于保存响应的数据。</br>
	 * API请求与事件的对应关系请参照MicroBlog类的文档。</p>
	 * 
	 * @see com.sina.microblog.MicroBlog
	 */ 
	public class MicroBlogEvent extends Event
	{
		public static const LOGIN_RESULT:String = "loginResult";
		
		public static const UPDATE_STATUS_RESULT:String = "updateStatusResult";
		
		/**
		 * 请求所返回后的结果。
		 * 返回值的具体内容请参照MicroBlog类的文档。
		 * 
		 * @see com.sina.microblog.Microblog
		 */ 
		public var result:Object;
		/**
		 * 当请求返回的结果集支持分页时，该属性标识指向下一个页面的指针。
		 * 并不是所有的MicroBlogEvent都会使用这个属性。
		 * 
		 * @see com.sina.microblog.Microblog
		 */ 
		public var nextCursor:Number;
		/**
		 * 当请求返回的结果集支持分页时，该属性标识指向上一个页面的指针。
		 * 并不是所有的MicroBlogEvent都会使用这个属性。
		 * 
		 * @see com.sina.microblog.Microblog
		 */ 
		public var previousCursor:Number;
		
		public function MicroBlogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var e:MicroBlogEvent = new MicroBlogEvent(type, bubbles, cancelable);
			e.result = result;
			e.previousCursor = previousCursor;
			e.nextCursor = nextCursor;
			return e;
		}
		
	}
}