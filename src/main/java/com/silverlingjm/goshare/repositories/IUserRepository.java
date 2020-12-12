package com.silverlingjm.goshare.repositories;

import com.silverlingjm.goshare.models.User;
import org.springframework.data.repository.CrudRepository;

public interface IUserRepository extends CrudRepository<User, Long> {
}
