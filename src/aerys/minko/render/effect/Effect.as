package aerys.minko.render.effect
{
	import aerys.minko.ns.minko_render;
	import aerys.minko.render.shader.ShaderTemplate;
	import aerys.minko.type.data.DataBinding;

	public class Effect
	{
		use namespace minko_render;
		
		minko_render var _passes	: Vector.<ShaderTemplate>	= null;
		
		public function get numPasses() : uint
		{
			return _passes.length;
		}
		
		public function Effect(...passes)
		{
			initialize(passes);
		}
		
		private function initialize(passes : Array) : void
		{
			while (passes[0] is Array)
				passes = passes[0];
			
			_passes = Vector.<ShaderTemplate>(passes);
		}
		
		public function getPass(index : uint = 0) : ShaderTemplate
		{
			return _passes[index];
		}
		
		public function fork(data : DataBinding) : void
		{
			trace("fork");
		}
	}
}