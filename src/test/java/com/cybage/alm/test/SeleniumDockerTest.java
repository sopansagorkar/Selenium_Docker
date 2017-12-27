package com.cybage.alm.test;

import java.net.MalformedURLException;
import java.net.URL;

import org.openqa.selenium.Platform;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

public class SeleniumDockerTest {

	RemoteWebDriver driver;

	@BeforeClass
	public void launchBrowser() {

		//String seleniumHubAddress = System
		//		.getProperty("host", "127.0.0.1:4444");
		// String seleniumHubPort = System.getProperty("port","4444");
		String seleniumBrowser = System.getProperty("browser", "firefox");
		String hubURL = "http://localhost:4444/wd/hub";

		if (seleniumBrowser.equalsIgnoreCase("firefox")) {
			System.out.println("LAUNCHING FIREFOX BROWSER...................");
		} else {
			System.out.println("LAUNCHING CHROME BROWSER$$$$$$$$$$$$$$$$$$$$$");
		}

		DesiredCapabilities cap = new DesiredCapabilities();
		cap.setBrowserName(seleniumBrowser);
		cap.setPlatform(Platform.ANY);

		try {
			driver = new RemoteWebDriver(new URL(hubURL), cap);

		} catch (MalformedURLException e) {
			e.printStackTrace();
		}

	}

	@Test(priority = 1)
	public void functionality1() {
		System.out.println("Hurray........Welcome Docker Selenium .....!!!!");

	}

	@Test(priority = 2)
	public void functionality2() {
		System.out.println("Heyyyyy........Welcome Docker Selenium .....!!!!");

	}

	@Test(priority = 3)
	public void functionality3() {
		System.out.println("Areeey........Welcome Docker Selenium .....!!!!");

	}

	@Test(priority = 4)
	public void functionality4() {
		System.out.println("Heeeeee........Welcome Docker Selenium .....!!!!");

	}

	@AfterClass
	public void kill() {

		driver.quit();

	}

}
