package co.simplon.service.authentication;


import co.simplon.model.TokenPasswordRecovery;
import co.simplon.repository.TokenPasswordRecoveryRepository;
import co.simplon.service.business.GenericService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class TokenPasswordRecoveryService extends GenericService<TokenPasswordRecovery, TokenPasswordRecoveryRepository> {

    @Autowired
    public TokenPasswordRecoveryRepository tokenPasswordRecoveryRepository;

    public TokenPasswordRecovery getTokenPasswordRecovery(String token) {
        TokenPasswordRecovery userToken = tokenPasswordRecoveryRepository.findTokenByToken(token);
        return userToken;
    }

    public boolean isTokenExpired(TokenPasswordRecovery userToken) {
        long tokenControl = ((new Date().getTime() - userToken.getCreatedAt().getTime()) /(1000 * 60 * 60 * 24 ));
        if (tokenControl > 1) {
            return false;
        } else {
            return true;
        }
    }
}
