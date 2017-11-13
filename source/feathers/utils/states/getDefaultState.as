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
	import feathers.core.IFeathersControl;

	[Exclude]
	/**
	 *  @private
	 *  Returns the default state. For Flex 4 and later we return the base
	 *  the first defined state, otherwise (Flex 3 and earlier), we return
	 *  the base (null) state.
	 */
	public function getDefaultState(target:IMXMLStateContext):String
	{
		if(!target)
		{
			return null;
		}
		var states:Array = target.states;
		return (states.length > 0) ? states[0].name : null;
	}
}