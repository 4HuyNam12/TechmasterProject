package com.vn.travel.exception;

import lombok.Getter;

@Getter
public class MissingParameterException extends GeneralException {

    public MissingParameterException() {
        super(ErrorCode.MISSING_PARAMETER);
    }
}
