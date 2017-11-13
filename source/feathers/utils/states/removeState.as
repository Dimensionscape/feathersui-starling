/*
Feathers SDK
Copyright 2012-2017 Bowler Hat LLC

See the NOTICE file distributed with this work for additional information
regarding copyright ownership. The author licenses this file to You under the
Apache License, Version 2.0 (the "License"); you may not use this file except in
compliance with the License.  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.
*/
package feathers.utils.states
{
	import feathers.core.IMXMLStateContext;
	import feathers.states.State;

	import mx.core.mx_internal;

	use namespace mx_internal;

	[Exclude]
	/**
	 *  @private
	 *  Remove the overrides applied by a state, and any
	 *  states it is based on.
	 */
	public function removeState(target:IMXMLStateContext, stateName:String, lastState:String):void
	{
		var state:State = getState(target, stateName);

		if (stateName == lastState)
			return;

		// Remove existing state overrides.
		// This must be done in reverse order
		if (state)
		{
			// Dispatch the "exitState" event
			state.dispatchExitState();

			var overrides:Array = state.overrides;

			for (var i:int = overrides.length; i; i--)
				overrides[i-1].remove(target);

			// Remove any basedOn deltas last
			if (state.basedOn != lastState)
				removeState(target, state.basedOn, lastState);
		}
	}
}