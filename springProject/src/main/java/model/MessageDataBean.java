package model;


import com.google.gson.Gson;

public class MessageDataBean {

   
   private String message_sender;
   private String message_content;
   private String message_sendTime;
   private String message_profileImg; 
   private int class_id;
   

   public String getMessage_sender() {
      return message_sender;
   }

   public void setMessage_sender(String message_sender) {
      this.message_sender = message_sender;
   }

   public String getMessage_content() {
      return message_content;
   }

   public void setMessage_content(String message_content) {
      this.message_content = message_content;
   }

   public String getMessage_sendTime() {
      return message_sendTime;
   }

   public void setMessage_sendTime(String message_sendTime) {
      this.message_sendTime = message_sendTime;
   }

   public String getMessage_profileImg() {
      return message_profileImg;
   }

   public void setMessage_profileImg(String message_profileImg) {
      this.message_profileImg = message_profileImg;
   }

   public int getClass_id() {
      return class_id;
   }

   public void setClass_id(int class_id) {
      this.class_id = class_id;
   }

   public static MessageDataBean convertMessage(String source) {
      MessageDataBean message = new MessageDataBean();
      Gson gson = new Gson();
      message = gson.fromJson(source, MessageDataBean.class);
      return message;
   }

   @Override
   public String toString() {
      return "MessageDataBean [message_sender=" + message_sender + ", message_content=" + message_content
            + ", message_sendTime=" + message_sendTime + ", message_profileImg=" + message_profileImg
            + ", class_id=" + class_id + "]";
   }

   

   
   
   
}