package wechat.menu;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import util.DBUtils;
import util.ServerContext;
import wechat.access.AccessTokenManager;
import wechat.utils.Constants;
import wechat.HttpClientHelper;
import wechat.utils.URLManager;

import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;

/**
 * Created by wangronghua on 14-3-18.
 */
public class MenuUtils {
  protected final static Logger LOG = LoggerFactory.getLogger(HttpClientHelper.class);

  public static String getRedirectUrl(String url) throws UnsupportedEncodingException {
    return ServerContext.getDomainName() + "/wechat/redirect.action?url=" + URLEncoder.encode(url, "UTF-8");
  }

  public static String getOAuthUrl(String url) throws UnsupportedEncodingException {
    return URLManager.getUrl_OAuthRedirect(ServerContext.getDomainName() + url, ServerContext.getAppID());
  }

  public static boolean create(InputStream in) {
    Map resultMap = HttpClientHelper.post(URLManager.getUrl_MenuCreate(AccessTokenManager.getToken(DBUtils.getDBFlag())), in);
    if(null != resultMap && (Integer)(resultMap.get(Constants.ERR_CODE)) == 0) {
      return true;
    }
    if(null != resultMap.get(Constants.ERR_CODE)) {
      LOG.error("Error while getting token from server, errcode:{};{}", String.valueOf(resultMap.get(Constants.ERR_CODE)), String.valueOf(resultMap.get(Constants.ERR_CODE)));
    }
    return false;
  }

  public static boolean create(File file) {
    try {
      InputStream inputStream = new FileInputStream(file);
      return create(inputStream);
    } catch (FileNotFoundException e) {
      LOG.error("File not found", e);
      return false;
    }
  }

  public static boolean create(WechatMenu menu) {
    if(null != menu) {
      String jsonMenu = menu.toJson();
      try {
        return create(new ByteArrayInputStream(jsonMenu.getBytes("UTF-8")));
      } catch(UnsupportedEncodingException e){
        LOG.error(e.getMessage());
        return false;
      }
    } else {
      LOG.error("Menu object is null!");
      return false;
    }

  }
}
