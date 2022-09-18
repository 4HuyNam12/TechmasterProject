package TravelVietNam.repository.restaurant;

import TravelVietNam.entity.restaurant.Feature;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FeatureRepository extends JpaRepository<Feature, Long> {
    List<Feature> findAllByIdIn(List<Integer> ids);

    List<Feature> findAll();

}
