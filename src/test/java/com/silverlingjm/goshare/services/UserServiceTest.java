package com.silverlingjm.goshare.services;

import com.silverlingjm.goshare.models.User;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.Assert;

import java.util.List;

@SpringBootTest
public class UserServiceTest {

    @Autowired
    private UserService userService;

    @Test
    public void usersRepositoryReturnsEmptyWhenNoUsersAreCreated() {
        Iterable<User> users = userService.list();

        int count = 0;
        for (User user: users) {
            count += 1;
        }

        Assertions.assertEquals(0, count);
    }

}
