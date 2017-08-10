component  output="false"
{
	
	public String function getExtensionByMime(sMime){
		retString = "png";
		switch(sMime) {
		case "image/jpeg":
			retString = "jpg";
		break;
		case "image/pjpeg":
			retString = "jpg";
		break;
		case "image/png":
			retString = "png";
		break;
		default:
			
		} //end switch
		return retString;
	}
	
}

