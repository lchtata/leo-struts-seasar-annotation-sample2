package edu.leo.interceptor;

import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.StrutsStatics;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * Struts2����������
 */
public class EncodingInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 5950035867417836245L;

	@Override
	public String intercept(ActionInvocation pInvocation) throws Exception {
		
		System.out.println("EncodingInterceptor work start...");

//		ActionContext actionContext = pInvocation.getInvocationContext();
//		HttpServletRequest request = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
//		System.out.println("Encoding Intercept...");
//		/**
//		 * �˷������GET �� POST��������
//		 */
//		if (request.getMethod().compareToIgnoreCase("post") >= 0) {
//			try {
//				request.setCharacterEncoding("GBK");
//			} catch (UnsupportedEncodingException e) {
//				e.printStackTrace();
//			}
//		} else {
//			@SuppressWarnings("unchecked")
//			Iterator<String[]> iter = request.getParameterMap().values().iterator();
//			while (iter.hasNext()) {
//				String[] parames = iter.next();
//				for (int i = 0; i < parames.length; i++) {
//					try {
//						parames[i] = new String(parames[i].getBytes("iso8859-1"), "GBK");//�˴�GBK��ҳ�����һ��
//					} catch (UnsupportedEncodingException e) {
//						e.printStackTrace();
//					}
//				}
//			}
//		}
		return pInvocation.invoke();
	}
}
