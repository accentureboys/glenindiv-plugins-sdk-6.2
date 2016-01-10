package com.liferay.glenindiv.register.portlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.xml.bind.DatatypeConverter;

public class VerifyCodeService {
	
	private int width = 150;
	private int height = 40;
	private int codeCount = 4;
	private int lineCount = 140;
	private String code = null;
	private BufferedImage buffImg = null;
	char[] codeSequence = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',        
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',        
            'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
	
	public String createCode() throws IOException {
		
		int x = 0, fontHeight = 0, codeY = 0;
		int red = 0, green = 0, blue = 0;
		
		x = width / (codeCount + 2);
		fontHeight = height -2;
		codeY = height - 4;
		
		buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D graphics = buffImg.createGraphics();
		Random random = new Random();
		graphics.setColor(Color.WHITE);
		graphics.fillRect(0, 0, width, height);
		
		Font font = new Font("Fixedsys", Font.PLAIN, fontHeight);
		graphics.setFont(font);
		
		for(int i=0; i<lineCount; i++) {
			int xs = random.nextInt(width);
			int ys = random.nextInt(height);
			int xe = xs + random.nextInt(width/8);
			int ye = ys + random.nextInt(height/8);
			red = random.nextInt(255);
			green = random.nextInt(255);
			blue = random.nextInt(255);
			graphics.setColor(new Color(red, green, blue));
			graphics.drawLine(xs, ys, xe, ye);
		}
		
		StringBuffer randomCode = new StringBuffer();
		for(int i =0; i < codeCount; i++) {
			String strRand = String .valueOf(codeSequence[random.nextInt(codeSequence.length)]);
			red = random.nextInt(255);
			green = random.nextInt(255);
			blue = random.nextInt(255);
			graphics.setColor(new Color(red, green, blue));
			graphics.drawString(strRand, (i+1) * x, codeY);
			randomCode.append(strRand);
		}
		code = randomCode.toString();
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(buffImg, "png", baos);
		
		String data = DatatypeConverter.printBase64Binary(baos.toByteArray());
		
		return "data:image/png;base64," + data;
	}
	
	public String getCode() {
		
		return code;
	}
		
}
