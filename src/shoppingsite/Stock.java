package shoppingsite;

import java.util.ArrayList;
import java.util.HashMap;

public class Stock 
{
	public  int Cost;
	public String Name;
	public String ImgName;
	public String Specs;
	public static boolean isPrinted=false;
	public static HashMap<String, Integer> stock = new HashMap<>();
	public static ArrayList<Stock> stockList = new ArrayList<>();
	public static void test()
	{
		addItem("Nokia9", 47000, "Nokia9","Android v9.0 (Pie)<br>5.99 inches (15.21 cm) bezel-less display<br>20 MP Front Camera<br><br>");
		addItem("IphoneX", 11200, "IphoneX","IOS 11<br>Height: 5.65 inches (143.6 mm)<br>Width: 2.79 inches (70.9 mm)<br>12MP wide-angle and telephoto cameras<br><br>");
		addItem("GalaxyS10", 60000, "GalaxyS10","Android v9.0 (Pie)<br>6.20 x 2.92 x 0.31-inch)<br>12MP Wide-angle Camera<br><br>");
	}
	Stock(String Name, int Cost, String ImgName,String Specs)
	{
		this.Name=Name;
		this.Cost=Cost;
		this.ImgName=ImgName;
		this.Specs=Specs;
	}
	public static void addItem(String Name, int Cost, String ImgName,String Specs)
	{
		Stock item= new Stock(Name, Cost,ImgName,Specs);
		stockList.add(item);
		initialize();
	}
	public static void initialize()
	{
		for(Stock iter: stockList)
		{
			stock.put(iter.Name,iter.Cost);
		}
	}
}
