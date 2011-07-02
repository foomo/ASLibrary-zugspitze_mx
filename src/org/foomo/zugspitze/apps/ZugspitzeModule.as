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
package org.foomo.zugspitze.apps
{
	import flash.display.DisplayObject;

	import mx.modules.Module;

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
	 * Zuspitzimplementation extending Flex Module
	 *
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class ZugspitzeModule extends mx.modules.Module implements IApplication
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * @private
		 */
		protected var _zugspitze:Zugspitze;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 * Constructor
		 */
		public function ZugspitzeModule()
		{
			super();
			this._zugspitze = new Zugspitze(this);
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_CHANGED, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_ADD, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_REMOVE, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_MODEL_CHANGED, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_CONTROLLER_CHANGED, this.zugspitzeEventHandler, false, 0, true)

		}

		//-----------------------------------------------------------------------------------------
		// ~ IZugspitzImplementation implementation
		//-----------------------------------------------------------------------------------------

		/**
		 * Define Controller Class
		 */
		public function set controllerClass(value:Class):void
		{
			this._zugspitze.controllerClass = value;
		}

		/**
		 * Define Model Class
		 */
		public function set modelClass(value:Class):void
		{
			this._zugspitze.modelClass = value;
		}

		/**
		 * Define View Class
		 */
		public function set viewClass(value:Class):void
		{
			this._zugspitze.viewClass = value;
		}

		/**
		 * Set Controller instance
		 */
		public function set controller(value:ZugspitzeController):void
		{
			this._zugspitze.controller = value;
		}

		/**
		 * Set Model instance
		 */
		public function set model(value:ZugspitzeModel):void
		{
			this._zugspitze.model = value;
		}

		/**
		 * Set View instance
		 */
		public function set view(value:DisplayObject):void
		{
			this._zugspitze.view = value;
		}

		/**
		 * Returns Implementation instance
		 */
		public function get application():IApplication
		{
			return this._zugspitze.application;
		}

		/**
		 * Returns Controller instance
		 */
		[Bindable(event="controlelrChanged")]
		public function get controller():ZugspitzeController
		{
			return this._zugspitze.controller;
		}

		/**
		 * Returns Model instance
		 */
		[Bindable(event="zugspitzeModelChanged")]
		public function get model():ZugspitzeModel
		{
			return this._zugspitze.model;
		}

		/**
		 * Returns View instance
		 */
		[Bindable(event="zugspitzeViewChanged")]
		public function get view():DisplayObject
		{
			return this._zugspitze.view;
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