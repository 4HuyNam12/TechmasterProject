package com.vn.travel.repository;

import com.vn.travel.entity.account.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {

    @Query(value = "select r.name from role r where r.id = :id ", nativeQuery = true)
    String getNameById(@Param("id") Long id);
}
