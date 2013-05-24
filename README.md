Http
====

a http app for mac to test http connect

# 'Http' App Info 

## Version 1.X ????/??/??

###Description:

* HTTP test Client
* used for：at least mac os10.7
* URL：eg：http://www.google.com
* Go: start test.
* Method: Get/Post 
  **note**only get and post method，others ,I will update soon.
*  Parameter Type：

				   XML：body string format： 
				   <?xml version = "1.0" encoding = "UTF-8"?><id>10002</id><name>ga</name> 
					body type：NSData
				   **note**xml version 1.0 encoding UTF-8
					Request Method：Post
				   
				   JSON:body string format：{"id":"10002","name":"ga"} 
				   body type：NSData
				   Request Method：Post
				   
				   URLPar:Parameter：url?id=10002&name=ga 
				   Request Method：Get **note**the normal method，append parameter after url.
				   
* T1 table：Add HeadField，for example,content-type、Accept,and so on...
* T2 table：Add Parameter：
				*1.if you choose ParameterType XML：
				parameter column，Required
				value column：Optional.
				eg1.0：
				parameter   value
				info
				name		ga
				then generate XML format：
				 <?xml version = "1.0" encoding = "UTF-8"?><Info><name>ga</name></Info> 
				eg1.1：
				parameter column   value column
				info		hello
				name		ga
				then generate XML format：
				 <?xml version = "1.0" encoding = "UTF-8"?><Info>hello</Info><name>ga</name> 
				*2.if you choose ParameterType JSON：
					parameter column，Required
					value column：Optional。
					eg：2.1
				parameter column   value column
				info		hello
				name		ga
				then generate Json format：
				 {"name":"ga","Info":"hello"} 
				 *3.ParameterType URLPar：No practical significance，but if you choose Get Method, it is Required.
         
* Function Button：’+‘、’-‘：add or delete row。
* R：Result TextView。It will print head fields、result、error、errorCode。

**NOTE**
* Only for ios http test,  NO Considered web develop and so on...
* Refered for Fetcher。
