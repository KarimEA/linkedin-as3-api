package com.fidku 
{
	import com.linkedin.LinkedInMobile;
	import com.linkedin.resources.People;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.media.StageWebView;
	
	/**
	 * LinkedIn API + AS3 Example
	 * @author Patricio Cornejo
	 * @link http://fidku.com
	 */
	public class LinkedInExample extends Sprite 
	{
		static private const apiKey:String = "";
		static private const secretKey:String = "";
		static private const scopes:Array = ["r_fullprofile", "r_network", "rw_nus", "rw_groups"];
		static private const redirect_uri:String = "";
		
		private var swv:StageWebView;
		
		public function LinkedInExample():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			button.scaleX = button.scaleY = (stage.fullScreenWidth * (229 / 480)) / 229
			button.x = stage.fullScreenWidth * .5;
			button.y = stage.fullScreenHeight * .5;
			button.addEventListener(MouseEvent.CLICK, clickButton);
		}
		
		private function clickButton(e:MouseEvent):void
		{
			trace("clickButton");
			LinkedInMobile.authorize(auReady, getSWV(), apiKey, secretKey, redirect_uri, scopes);
		}
		
		private function auReady(response:Object):void 
		{
			if (response.success) {
				//trace(LinkedIn.accessToken, LinkedIn.expiresIn);
				
				var fields:Array = ["skills:(id)"];
				People.byId(getReady, "~", fields);
				//var fields:Array = ["id", "first-name", "last-name", "positions:(title)"];
				//People.connections(conReady, "~", fields);
				
				//var obj:Object = new Object();
				//obj["keywords"] = "Patricio";
				//People.search(searchReady, obj);
				
				//var updObject:Object = new Object();
				//updObject.scope = 'self';
				//People.networkUpdates(updReady, updObject);
				
			} else {
				trace("ERROR");
				trace(response.errorCode, response.errorMessage);
			}
		}
		
		private function updReady(response:Object):void 
		{
			trace(JSON.stringify(response));
		}
		
		private function searchReady(response:Object):void 
		{
			trace(JSON.stringify(response));
		}
		
		private function conReady(response:Object):void 
		{
			trace(JSON.stringify(response));
		}
		
		private function getReady(response:Object):void 
		{
			trace(JSON.stringify(response));
		}
		
		private function getSWV():StageWebView
		{
			if (!swv) {
				swv = new StageWebView();
				swv.stage = this.stage;
				swv.viewPort = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
			}
			
			return swv;
		}
	}

}