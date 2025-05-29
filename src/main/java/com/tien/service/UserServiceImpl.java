package com.tien.service;

import com.tien.model.UserB7;
import com.tien.repository.UserRepository;
import com.tien.repository.UserRepositoryImpl;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository = new UserRepositoryImpl();

    @Override
    public void register(UserB7 user) {
        userRepository.save(user);
    }
}
