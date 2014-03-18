package wechat.requestbean;

import wechat.BaseMessage;
import wechat.messagehandler.MessageHandler;

import java.util.Map;

/**
 * Created by wangronghua on 14-3-11.
 */
public class TextRequest extends BaseMessage {

  private String Content;
  private String MsgId;

  public String getMsgId() {
    return MsgId;
  }

  public void setMsgId(String msgId) {
    MsgId = msgId;
  }


  public String getContent() {
    return Content;
  }

  public void setContent(String content) {
    Content = content;
  }

  public BaseMessage accept(MessageHandler handler) {
    return handler.handle(this);
  }

  public void fill(Map paraMap) {
    super.fill(paraMap);
    this.setContent((String)paraMap.get("Content"));
    this.setMsgId((String)paraMap.get("MsgId"));
  }
}
