package article;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import article.ArticleBean;

public class ArticleDAO {
   
   private Connection conn;
   private PreparedStatement pstmt = null;
   private ResultSet rs;
   
   public ArticleDAO() {
      try {
         String dbURL = "jdbc:mysql://localhost:3306/foodwatch?useUnicode=true&characterEncoding=UTF-8";
         String dbID = "root";
         String dbPassword = "0326";
         Class.forName("com.mysql.cj.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   // 게시글 작성 함수 
   public int write(ArticleBean article) {
      String SQL = "INSERT INTO ARTICLE VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1,  article.getArticleTitle());
         pstmt.setString(2,  article.getArticleContent());
         pstmt.setString(3,  article.getStoreName());
         pstmt.setString(4, article.getStoreAddress());
         pstmt.setInt(5,  article.getPrice());
         pstmt.setInt(6,  article.getNewPrice());
         pstmt.setString(7,  article.getCategory());
         pstmt.setString(8,  article.getOwnerId());
         pstmt.setInt(9, 0);
         pstmt.setString(10, article.getFileName());
         return pstmt.executeUpdate();
      } catch(Exception e) {
         e.printStackTrace();
      }
      return -1; //  데이터베이스 오류 
   }
   
   // DB에 저장된 게시글 리스트를 arrayList로 받아오는 함수
      public ArrayList<ArticleBean> getList(int pageNumber){
         String SQL = "SELECT * FROM ARTICLE WHERE articleId < ? ORDER BY articleId DESC LIMIT 15";
         ArrayList<ArticleBean> list = new ArrayList<ArticleBean>();
         try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, 15);
            rs = pstmt.executeQuery();
            while(rs.next()) {
               ArticleBean articleBean = new ArticleBean();
               articleBean.setArticleId(rs.getInt(1));
               articleBean.setArticleTitle(rs.getString(2));
               articleBean.setArticleContent(rs.getString(3));
               articleBean.setStoreName(rs.getString(4));
               articleBean.setStoreAddress(rs.getString(5));
               articleBean.setPrice(rs.getInt(6));
               articleBean.setNewPrice(rs.getInt(7));
               articleBean.setCategory(rs.getString(8));
               articleBean.setOwnerId(rs.getString(9));
               articleBean.setSold(rs.getInt(10));
               articleBean.setFileName(rs.getString(11));
               list.add(articleBean);
            }
         }catch(Exception e) {
            e.printStackTrace();
         }
         return list; // 리스트 반환
      }
   
   // DB에 저장된 해당 id의 게시글을 get하는 함수
   public ArticleBean getArticle(int articleId) {
      String SQL = "SELECT * FROM Article WHERE articleId = ?";
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1,  articleId);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            ArticleBean articleBean = new ArticleBean();
            articleBean.setArticleId(rs.getInt(1));
            articleBean.setArticleTitle(rs.getString(2));
            articleBean.setArticleContent(rs.getString(3));
            articleBean.setStoreName(rs.getString(4));
            articleBean.setStoreAddress(rs.getString(5));
            articleBean.setPrice(rs.getInt(6));
            articleBean.setNewPrice(rs.getInt(7));
            articleBean.setCategory(rs.getString(8));
            articleBean.setOwnerId(rs.getString(9));
            articleBean.setSold(rs.getInt(10));
            articleBean.setFileName(rs.getString(11));
            return articleBean;
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return null; //  해당 id의 게시글이 없을 때 null 반환
   }
   
   // 게시글 수정 함수
   public int update(ArticleBean article) {
      String SQL = "UPDATE ARTICLE SET articleTitle = ?, articleContent = ?, storeName = ?, storeAddress = ?, price = ?, newPrice = ?, category = ?, sold = ?, fileName = ? WHERE articleId = ?";
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, article.getArticleTitle());
         pstmt.setString(2, article.getArticleContent());
         pstmt.setString(3, article.getStoreName());
         pstmt.setString(4, article.getStoreAddress());
         pstmt.setInt(5, article.getPrice());
         pstmt.setInt(6, article.getNewPrice());
         pstmt.setString(7, article.getCategory());
         pstmt.setInt(8, article.getSold());
         pstmt.setString(9, article.getFileName());
         pstmt.setInt(10, article.getArticleId());
         return pstmt.executeUpdate();
      } catch(Exception e) {
         e.printStackTrace();
      }
      return -1; // 데이터베이스 오류
   }
   
   // 게시글 삭제 함수
   public int delete(int articleId) {
      String SQL = "DELETE FROM ARTICLE WHERE articleId = ?";
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, articleId);
         return pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; //  데이터베이스 오류
   }
}