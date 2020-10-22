/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anh.YellowMoon.utils;

/**
 *
 * @author DELL
 */
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import com.google.gson.Gson;
import anh.YellowMoon.dtos.GoogleUserDTO;
import org.apache.log4j.Logger;

public class GoogleUtils {
    final static Logger logger = Logger.getLogger(GoogleUtils.class.getName());
    public static String getToken(final String code) throws ClientProtocolException, IOException {
        logger.info("Get access token from Google");
        String response = Request.Post(GoogleConnect.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", GoogleConnect.GOOGLE_CLIENT_ID)
                        .add("client_secret", GoogleConnect.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", GoogleConnect.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", GoogleConnect.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        //JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        //String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        String accessToken=response.substring(21, 191);
        return accessToken;
    }

    public static GoogleUserDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        logger.info("Get google user infomation.");
        String link = GoogleConnect.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        GoogleUserDTO googleInfo = new Gson().fromJson(response, GoogleUserDTO.class);
        return googleInfo;
    }
}
