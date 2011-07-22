package aerys.minko.scene.data
{
	import flash.utils.Dictionary;

	public interface IWorldData
	{
		function setDataProvider(styleStack	: StyleStack, 
								 localData	: LocalData,
								 worldData	: Dictionary) : void
		
		function invalidate() : void;
		
		function reset() : void;
	}
}