package com.silverlingjm.goshare.repositories;

import com.silverlingjm.goshare.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("pgUser")
public interface IUserRepository extends CrudRepository<User, Long> {
}
