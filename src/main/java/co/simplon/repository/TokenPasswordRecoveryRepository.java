package co.simplon.repository;


import co.simplon.model.TokenPasswordRecovery;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.security.core.token.Token;

public interface TokenPasswordRecoveryRepository  extends JpaRepository<TokenPasswordRecovery, Integer> {

    @Query("select t from TokenPasswordRecovery t where t.token=?1")
    public TokenPasswordRecovery findTokenByToken(String token);
}
