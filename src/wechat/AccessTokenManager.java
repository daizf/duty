package wechat;

import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import util.ServerContext;

import java.util.Map;

/**
 * Created by wangronghua on 14-3-9.
 */
public class AccessTokenManager {
  protected final static Logger LOG = LoggerFactory.getLogger(AccessTokenManager.class);

  private static String TOKEN = "";
  private static long EXPIRE_TIMESTAMP = 0;

  public synchronized static String getToken() {
    String url = URLManager.getUrl_Accesstoken(ServerContext.getValue(Constants.APP_ID), ServerContext.getValue(Constants.APP_SECRET)) ;
    if(EXPIRE_TIMESTAMP > System.currentTimeMillis()) {
      return TOKEN;
    }
    Map resultMap = HttpClientHelper.get(url);
    if(null != resultMap.get(Constants.ERR_CODE)) {
      LOG.error("Error while getting token from server, errcode:#0;#1", String.valueOf(resultMap.get(Constants.ERR_CODE)), String.valueOf(resultMap.get(Constants.ERR_CODE)));
    } else if(null != resultMap.get(Constants.ACCESS_TOKEN)){
      TOKEN = (String)resultMap.get(Constants.ACCESS_TOKEN);
      Integer expires = (Integer)resultMap.get(Constants.EXPIRES_IN);
      if(null != expires) {
        EXPIRE_TIMESTAMP = System.currentTimeMillis() + (expires - 1000) * 1000;
      } else {
        EXPIRE_TIMESTAMP = 0;
      }
    }
    return TOKEN;
  }
}
