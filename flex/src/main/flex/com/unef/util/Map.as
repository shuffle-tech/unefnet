package com.unef.util {
	
	import flash.events.EventDispatcher;
	
	import mx.binding.utils.BindingUtils;
	import mx.collections.ArrayCollection;
	import mx.events.PropertyChangeEvent;
	
	/**
	 * Classe que implementa um Map. Semelhante ao Map do Java.
	 */
	public class Map extends EventDispatcher {
		private var keys:ArrayCollection;
		
		private var values:ArrayCollection;
		
		private var _length:int = 0;
		
		private var _empty:Boolean = true;
		
		public function Map() {
			this.keys = new ArrayCollection();
			this.values = new ArrayCollection();
			BindingUtils.bindSetter(setLength, values, "length");
		}
		
		[Bindable(event="propertyChange")]
		public function get length():int {
			return this._length;
		}
		
		private function setLength(newLength:int):void {
			var _oldLength:int = this._length;
			this._length = newLength;
			
			if (_oldLength != this._length) {
				dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "length", _oldLength, this._length));
				
				if (this._length > 0) {
					this.setEmpty(false);
				} else {
					this.setEmpty(true);
				}
			}
		}
		
		private function setEmpty(newEmpty:Boolean):void {
			var _oldEmpty:Boolean = this._empty;
			this._empty = newEmpty;
			
			if (_oldEmpty != this._empty) {
				dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "empty", _oldEmpty, this._empty));
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get empty():Boolean {
			return this._empty;
		}
		
		public function clear():void {
			this.keys.removeAll();
			this.values.removeAll();
		}
		
		public function containsKey(k:Object):Boolean {
			return this.keys.contains(k);
		}
		
		public function containsValue(v:*):Boolean {
			return this.values.contains(v);
		}
		
		public function isEmpty():Boolean {
			return this.keys.length == 0;
		}
		
		public function remove(k:Object):Object {
			var ret:Object = null;
			var pos:int = this.keys.getItemIndex(k);
			
			if (pos != -1) {
				this.keys.removeItemAt(pos);
				ret = this.values.removeItemAt(pos);
			}
			return ret;
		}
		
		public function getValue(k:Object):* {
			var ret:Object = null;
			var pos:int = this.keys.getItemIndex(k);
			
			if (pos != -1) {
				ret = this.values.getItemAt(pos);
			}
			return ret;
		}
		
		public function getKeysArray():Array {
			return this.keys.toArray();
		}
		
		public function getValuesArray():Array {
			return this.values.toArray();
		}
		
		public function getMapArray():Array {
			var ret:Array = new Array(this.keys.length);
			
			for (var i:int = 0; i < this.keys.length; i++) {
				ret[i] = [this.keys.getItemAt(i), this.values.getItemAt(i)];
			}
			return ret;
		}
		
		public function size():int {
			return this.keys.length;
		}
		
		public function put(k:Object, v:*):void {
			var pos:int = this.keys.getItemIndex(k);
			
			if (pos == -1) {
				this.keys.addItem(k);
				this.values.addItem(v);
			} else {
				this.values.setItemAt(v, pos);
			}
		}
		
		/**
		 * Retorna um array onde o indice eh String
		 */
		public function getMapFlex():Array {
			var ret:Array = new Array();
			
			for (var i:int = 0; i < this.keys.length; i++) {
				if (!this.keys[i] is String) {
					throw new TypeError("Only Strings can be used as keys of a Map.");
				}
				ret[this.keys[i]] = this.values[i];
			}
			return ret;
		}
		
		/**
		 * Retorna um array onde o indice eh String
		 */
		public function getMapObject():Object {
			var ret:Object = new Object();
			
			for (var i:int = 0; i < this.keys.length; i++) {
				if (!this.keys[i] is String) {
					throw new TypeError("Only Strings can be used as keys of a Map.");
				}
				ret[this.keys[i]] = this.values[i];
			}
			return ret;
		}
	}
}
