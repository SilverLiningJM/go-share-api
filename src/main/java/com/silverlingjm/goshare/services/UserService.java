package com.silverlingjm.goshare.services;

import com.silverlingjm.goshare.models.User;
import com.silverlingjm.goshare.repositories.IUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private IUserRepository userRepository;

    public Iterable<User> list() {
        return userRepository.findAll();
    }
}
