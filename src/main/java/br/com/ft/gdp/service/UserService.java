package br.com.ft.gdp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import br.com.ft.gdp.exception.InvalidOperationException;
import br.com.ft.gdp.exception.ObjectNotFoundException;
import br.com.ft.gdp.models.domain.UserApplication;
import br.com.ft.gdp.repository.UserRepository;

/**
 * Classe UserService.java
 * 
 * @author <a href="mailto:viniciosarodrigues@gmail.com">Vinícios Rodrigues</a>
 * 
 * @since 15 de set de 2019
 */
@Service
public class UserService extends GenerciService<UserApplication, Long> {

    @Autowired
    private UserRepository userRepo;
    @Autowired
    BCryptPasswordEncoder bc;

    public UserApplication findByUsername(String username) {
        return userRepo.findByUsername(username).orElseThrow(() -> new ObjectNotFoundException(
                "Usuário não encontrado! Username: " + username + ", tipo " + UserApplication.class.getName()));
    }

    @Override
    public Page<UserApplication> searchEntityPage(Pageable pageRequest) {
        return null;
    }

    @Override
    public UserApplication findById(Long id) {
        return userRepo.findById(id).orElseThrow(() -> new ObjectNotFoundException(
                "Usuário não encontrado! Id: " + id + ", tipo " + UserApplication.class.getName()));
    }

    @Override
    public UserApplication update(Long id, UserApplication entity) {
        return null;
    }

    @Override
    public void delete(UserApplication entity) {
        throw new InvalidOperationException();
    }

    @Override
    public void deleteById(Long id) {
        throw new InvalidOperationException();
    }

    @Override
    public UserApplication persist(UserApplication entity) {
        return userRepo.save(entity);
    }

}
