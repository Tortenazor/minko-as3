package aerys.minko.scene.controller
{
	import aerys.minko.type.Signal;
	
	import avmplus.getQualifiedClassName;

	public class AbstractController
	{
		private var _lastTime		: Number			= 0.0;
		private var _lastTarget		: IControllerTarget	= null;
		
		private var _targetType		: Class				= null;
		
		private var _ticked			: Signal			= new Signal();
		private var _targetAdded	: Signal			= new Signal();
		private var _targetRemoved	: Signal			= new Signal();
		
		public function get ticked() : Signal
		{
			return _ticked;
		}
		
		public function get targetAdded() : Signal
		{
			return _targetAdded;
		}
		
		public function get targetRemoved() : Signal
		{
			return _targetRemoved;
		}
		
		public function AbstractController(targetType : Class = null)
		{
			_targetType = targetType;
		}
		
		private function targetAddedHandler(controller	: AbstractController,
											target		: IControllerTarget) : void
		{
			if (_targetType && !(target is _targetType))
			{
				throw new Error(
					"Controller '" + getQualifiedClassName(this)
					+ " cannot target objects from class '"
					+ getQualifiedClassName(target) + "'."
				);
			}
		}
		
		public function tick(target : IControllerTarget, time : Number) : void
		{
			var update : Boolean	= false;
			
			if (time != _lastTime)
			{
				update = updateOnTime(time);
				_lastTime = time;
			}
			
			if (target != _lastTarget || update)
			{
				updateTarget(target);
				_lastTarget = target;
			}
			
			_ticked.execute(this, target, time);
		}
		
		protected function updateOnTime(time : Number) : Boolean
		{
			// nothing
			
			return false;
		}
		
		protected function updateTarget(target : IControllerTarget) : void
		{
			// nothing
		}
	}
}