[level] 是日志输出级别，共有5级：
FATAL      0  
ERROR      3  
WARN       4  
INFO       6  
DEBUG      7
--------------------------------------------------------------------------------------
Appender 为日志输出目的地，Log4j提供的appender有以下几种：
org.apache.log4j.ConsoleAppender（控制台），
org.apache.log4j.FileAppender（文件），
org.apache.log4j.DailyRollingFileAppender（每天产生一个日志文件），
org.apache.log4j.RollingFileAppender（文件大小到达指定尺寸的时候产生一个新的文件），
org.apache.log4j.WriterAppender（将日志信息以流格式发送到任意指定的地方）
--------------------------------------------------------------------------------------
Layout：日志输出格式，Log4j提供的layout有以下几种：
org.apache.log4j.HTMLLayout（以HTML表格形式布局），
org.apache.log4j.PatternLayout（可以灵活地指定布局模式），
org.apache.log4j.SimpleLayout（包含日志信息的级别和信息字符串），
org.apache.log4j.TTCCLayout（包含日志产生的时间、线程、类别等等信息）
--------------------------------------------------------------------------------------
打印参数: Log4J采用类似C语言中的printf函数的打印格式格式化日志信息，如下:
    %m   输出代码中指定的消息
　　%p   输出优先级，即DEBUG，INFO，WARN，ERROR，FATAL 
　　%r   输出自应用启动到输出该log信息耗费的毫秒数 
　　%c   输出所属的类目，通常就是所在类的全名 
　　%t   输出产生该日志事件的线程名 
　　%n   输出一个回车换行符，Windows平台为“\r\n”，Unix平台为“\n” 
　　%d   输出日志时间点的日期或时间，默认格式为ISO8601，也可以在其后指定格式，比如：%d{yyy MMM dd HH:mm:ss , SSS}，输出类似：2002年10月18日  22 ： 10 ： 28 ， 921  
　　%l   输出日志事件的发生位置，包括类目名、发生的线程，以及在代码中的行数。举例：Testlog4.main(TestLog4.java: 10 )  