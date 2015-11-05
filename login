
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.firefox.internal.ProfilesIni;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;


public class Login {

	WebDriver driver;
	String baseURL = "http://localhost/STEM-TUTOR-STUDENT/";	
	String Actual_Login = "STEM|Courses";
	String Studentstring = ".//*[@id='navbar-collapse-1']/ul/li[2]/a";
	String StudentLogin = ".//*[@id='navbar-collapse-1']/ul/li[2]/ul/li[1]/a";
	String StudentRegister = ".//*[@id='navbar-collapse-1']/ul/li[2]/ul/li[2]/a";
	String StudentUN = " .//*[@name = 'username']";
	String Studentpwd = ".//*[@name = 'password']";
	String StudentSignIn = ".//*[@name='action']";
	String StuentLOGOUT = "//ul//li[5]/a";
	String StudentRegUN = "//input[@name = 'student_name']";
	String StudentRegpwd = "//input[@name = 'password']";
	String StudentRegConfirmpwd = "//input[@name = 'Confirmpassword']";
	String StudentReg_Emailid =  " .//*[@name = 'emailid']";
	String StudentReg_major = " .//*[@name = 'major']";
	String StudentReg_majoroption = "//option[@value = 'MEC']";
	String StudentReg_submit = "//button[@type = 'submit']";
	
	@BeforeTest
	public void setup()
	{
		System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")+"\\Drivers\\chromedriver.exe");
		driver =  new ChromeDriver();
		//   **** Firefox new profile *****
		/* 
		ProfilesIni profile = new ProfilesIni();
		FirefoxProfile myprofile = profile.getProfile("Testprofile");
		driver = new FirefoxDriver(myprofile);
		driver = new FirefoxDriver();
		*/
		driver.manage().deleteAllCookies();
		driver.manage().window().maximize();		
		driver.manage().timeouts().implicitlyWait(20, TimeUnit.SECONDS);
	}	
	
	@AfterTest
	public void tearDown()
	{
		driver.quit();
	}
	
	// student Login Test		
	@Test
	public void loginTest() throws InterruptedException
	{
		driver.get(baseURL);
		Thread.sleep(100);
		//Assert.assertEquals(Actual_Login, driver.getTitle());
		driver.findElement(By.xpath(Studentstring)).click();
		driver.findElement(By.xpath(StudentLogin)).click();;
		//Assert.assertEquals("Student|Login", driver.getTitle());
		driver.findElement(By.xpath(StudentUN)).sendKeys("priya.smts@gmail.com");
		driver.findElement(By.xpath(Studentpwd)).sendKeys("123");	
		driver.findElement(By.xpath(StudentSignIn)).click();
		//Assert.assertEquals("Student", driver.getTitle());
		driver.findElement(By.xpath(StuentLOGOUT)).click();
		driver.findElement(By.linkText("LOGOUT")).click();
		//Assert.assertEquals("Tutor|Login", driver.getTitle());
						
	}
	
	// Student Sign up Test 
	//@Test(dependsOnMethods = {"loginTest"})
	@Test
	public void signupTest() throws InterruptedException
	{
		driver.get(baseURL);
		Thread.sleep(100);
		driver.findElement(By.xpath(Studentstring)).click();
		driver.findElement(By.xpath(StudentRegister)).click();
		//Assert.assertEquals("Student|Register", driver.getTitle());
		driver.findElement(By.xpath(StudentRegUN)).sendKeys("test");
		driver.findElement(By.xpath(StudentRegpwd)).sendKeys("test");
		driver.findElement(By.xpath(StudentRegConfirmpwd)).sendKeys("test");
		driver.findElement(By.xpath(StudentReg_Emailid)).sendKeys("test@smts.com");
		driver.findElement(By.xpath(StudentReg_major)).click();
		driver.findElement(By.xpath(StudentReg_majoroption)).click();
		driver.findElement(By.xpath(StudentReg_submit)).click();
		System.out.println(driver.getTitle());
		
		
		
		
	}
}
