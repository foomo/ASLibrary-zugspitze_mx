/*
 * This file is part of the foomo Opensource Framework.
 *
 * The foomo Opensource Framework is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License as
 * published  by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * The foomo Opensource Framework is distributed in the hope that it will
 * be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along with
 * the foomo Opensource Framework. If not, see <http://www.gnu.org/licenses/>.
 */
package org.foomo.zugspitze.mx.core
{
	import flash.display.DisplayObject;

	import mx.core.Application;

	import org.foomo.zugspitze.core.IApplication;
	import org.foomo.zugspitze.core.Zugspitze;
	import org.foomo.zugspitze.core.ZugspitzeController;
	import org.foomo.zugspitze.core.ZugspitzeModel;
	import org.foomo.zugspitze.events.ZugspitzeEvent;

	[Event(name="zugspitzeControllerChange", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeModelChange", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeViewChange", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeViewRemove", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeComplete", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeViewAdd", type="org.foomo.zugspitze.events.ZugspitzeEvent")]

	/**
	 * Zuspitzimplementation extending Flex Application
	 *
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
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
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_COMPLETE, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_ADD, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_REMOVE, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_CHANGE, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_MODEL_CHANGE, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_CONTROLLER_CHANGE, this.zugspitzeEventHandler, false, 0, true)
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
		[Bindable(event="zugspitzeControllerChange")]
		public function get controller():ZugspitzeController
		{
			return _zugspitze.controller;
		}

		/**
		 * Returns Model instance
		 */
		[Bindable(event="zugspitzeModelChange")]
		public function get model():ZugspitzeModel
		{
			return _zugspitze.model;
		}

		/**
		 * Returns View instance
		 */
		[Bindable(event="zugspitzeViewChange")]
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