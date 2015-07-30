/**
* ...
* @author Default
* @version 0.2
*/

package string {

	import flash.xml.XMLNode;
	import flash.xml.XMLNodeType;

	public class Utils {
		
		public function Utils() {
			
		}
		
		static public function get_colour( col:String ) : Number
		{
			if( col.substr(0,2) == '0x' )
				return Number(col);
				
			if( col.substr(0,1) == '#' )
				return Number( '0x'+col.substr(1,col.length) );
				
			if( col.length==6 )
				return Number( '0x'+col );
				
			// not recognised as a valid colour, so?
			return Number( col );
				
		}
		
		static public function htmlspecialchars( str:String ) : String
		{
			return XML( new XMLNode( XMLNodeType.TEXT_NODE, str ) ).toXMLString().replace(/"/g, "&quot;").replace(/'/g, "&apos;");
		}
		
	}
	
}
