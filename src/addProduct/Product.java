package addProduct;

import java.math.BigDecimal;

public class Product {
	private int id;
	private String name;
	private BigDecimal price;
	private byte[] imageData;

	public Product(int id, String name, BigDecimal price, byte[] imageData) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.imageData = imageData;
	}

	// getters and setters
}
