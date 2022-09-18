package TravelVietNam.service;

import TravelVietNam.request.activities.ActivitiesGameUploadBody;
import TravelVietNam.request.activities.ActivitiesUploadBody;
import TravelVietNam.response.BaseResponse;

public interface ActivitiesService {

    BaseResponse get(String slug);

    BaseResponse uploadActivities(ActivitiesUploadBody activitiesUploadBody);

    BaseResponse updateActivities(ActivitiesUploadBody activitiesUploadBody);

    BaseResponse uploadGameActivities(ActivitiesGameUploadBody activitiesGameUploadBody);

    BaseResponse updateGameActivities(ActivitiesGameUploadBody activitiesGameUploadBody);

    void deleteActivities(String activitiesCode);

    void deleteGameActivities(Integer id);

    BaseResponse getListActivities(Integer page, Integer perPage);

}
