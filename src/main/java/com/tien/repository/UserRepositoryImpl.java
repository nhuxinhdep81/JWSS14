package com.tien.repository;

import com.tien.model.UserB7;
import com.tien.repository.UserRepository;
import com.tien.config.ConnectionDB;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.Connection;

@Repository
public class UserRepositoryImpl implements UserRepository {

    @Override
    public void save(UserB7 user) {
        String sql = "{CALL save_user_b7(?, ?, ?)}";
        try (Connection conn = ConnectionDB.openConnection();
             CallableStatement cs = conn.prepareCall(sql)) {

            cs.setString(1, user.getUsername());
            cs.setString(2, user.getPassword());
            cs.setString(3, user.getEmail());

            cs.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
