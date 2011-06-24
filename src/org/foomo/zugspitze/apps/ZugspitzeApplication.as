package org.foomo.zugspitze.apps
{
	import flash.display.DisplayObject;

	import mx.core.Application;

	import org.foomo.zugspitze.core.Zugspitze;
	import org.foomo.zugspitze.core.ZugspitzeController;
	import org.foomo.zugspitze.core.ZugspitzeModel;
	import org.foomo.zugspitze.events.ZugspitzeEvent;

	[Event(name="zugspitzeControllerChanged", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeModelChanged", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeViewChanged", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeViewRemove", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeViewAdd", type="org.foomo.zugspitze.events.ZugspitzeEvent")]

	/**
	 * Zuspitzimplementation extending Flex Application
	 */
	public class ZugspitzeApplication extends Application implements IApplication
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * @private
		 */
		protected static var _zugspitze:Zugspitze;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 * Constructor
		 */
		public function ZugspitzeApplication():void
		{
			super();
			_zugspitze = new Zugspitze(this);
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_CHANGED, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_ADD, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_REMOVE, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_MODEL_CHANGED, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_CONTROLLER_CHANGED, this.zugspitzeEventHandler, false, 0, true)
		}

		//-----------------------------------------------------------------------------------------
		// ~ IApplication implementation
		//-----------------------------------------------------------------------------------------

		/**
		 * Define Controller Class
		 */
		public function set controllerClass(value:Class):void
		{
			_zugspitze.controllerClass = value;
		}

		/**
		 * Define Model Class
		 */
		public function set modelClass(value:Class):void
		{
			_zugspitze.modelClass = value;
		}

		/**
		 * Define View Class
		 */
		public function set viewClass(value:Class):void
		{
			_zugspitze.viewClass = value;
		}

		/**
		 * Set Controller instance
		 */
		public function set controller(value:ZugspitzeController):void
		{
			_zugspitze.controller = value;
		}

		/**
		 * Set Model instance
		 */
		public function set model(value:ZugspitzeModel):void
		{
			_zugspitze.model = value;
		}

		/**
		 * Set View instance
		 */
		public function set view(value:DisplayObject):void
		{
			_zugspitze.view = value;
		}

		/**
		 * Returns Implementation instance
		 */
		public function get application():IApplication
		{
			return _zugspitze.application;
		}

		/**
		 * Returns Controller instance
		 */
		[Bindable(event="zugspitzeControllerChanged")]
		public function get controller():ZugspitzeController
		{
			return _zugspitze.controller;
		}

		/**
		 * Returns Model instance
		 */
		[Bindable(event="zugspitzeModelChanged")]
		public function get model():ZugspitzeModel
		{
			return _zugspitze.model;
		}

		/**
		 * Returns View instance
		 */
		[Bindable(event="zugspitzeViewChanged")]
		public function get view():DisplayObject
		{
			return _zugspitze.view;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Private Eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 * @private
		 */
		private function zugspitzeEventHandler(event:ZugspitzeEvent):void
		{
			this.dispatchEvent(event);
		}
	}
}