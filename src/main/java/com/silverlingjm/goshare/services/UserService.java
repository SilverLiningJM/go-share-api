package com.silverlingjm.goshare.services;

import com.silverlingjm.goshare.models.User;
import com.silverlingjm.goshare.repositories.IUserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private IUserRepository userRepository;

    public User save(User user) {
        logger.info("Attempting to add new user");
        User newUser = this.userRepository.save(user);
        logger.info("New user successfully added with id: " + newUser.getId());
        return newUser;
    }

    public Optional<User> findById(Long id) {
        logger.info("attempting to fetch user " + id);
        Optional<User> user = this.userRepository.findById(id);
        user.ifPresentOrElse(
                u -> logger.info("User is present in system"),
                () -> logger.error("User " + id + " does not exist"));
        return user;
    }

    public Iterable<User> finaAll() {
        logger.info("attempting to fetch all users");
        return userRepository.findAll();
    }

    public boolean deleteById(Long id) {
        try {
            logger.info("Attempting to delete user with id: " + id);
            this.userRepository.deleteById(id);
            logger.info("Successfully deleted user with id: " + id);
            return true;
        } catch(Exception e) {
            logger.error("unable to delete user with id: " + id + ". Error: " + e.getMessage());
        }
        return false;
    }

    public boolean updateById(Long id, User user) {
        try {
            user.setId(id);
            logger.info("updating user " + id);
            this.userRepository.save(user);
            logger.info("Successfully updated user " + id);
            return true;
        } catch(Exception e) {
            logger.error("Error updating user " + id + ": " + e.getMessage());
        }
        return false;
    }

}
