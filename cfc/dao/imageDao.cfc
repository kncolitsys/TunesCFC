component output="false"
{
	public function getImageByImageId(imageId){
		return entityLoadByPK("image",imageId);
	}
	
	public any function getImageByImageName(imageName){
		image = ORMexecuteQuery("FROM image i WHERE i.imageName="& "'" & imageName &"'",true);
		return image;
	}
	
	public void function saveImage(image){
		x= 5;
		entitySave(image);
	}
	
}
