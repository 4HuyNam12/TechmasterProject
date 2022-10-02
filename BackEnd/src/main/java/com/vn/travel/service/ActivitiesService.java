package com.vn.travel.service;

import com.vn.travel.request.activities.ActivitiesGameUploadBody;
import com.vn.travel.request.activities.ActivitiesUploadBody;
import com.vn.travel.response.BaseResponse;

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
