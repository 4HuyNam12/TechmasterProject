package com.vn.travel.controller.advice;

import com.vn.travel.exception.ApiError;
import com.vn.travel.exception.ErrorCode;
import com.vn.travel.exception.GeneralException;
import com.vn.travel.exception.RestApiException;
import com.vn.travel.response.BaseResponse;
import com.vn.travel.response.ErrorResponse;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Log4j2
@AllArgsConstructor
public class ExceptionHandlerRestController {

    @ExceptionHandler({MethodArgumentNotValidException.class})
    @ResponseStatus(HttpStatus.OK)
    protected BaseResponse handleExp(MethodArgumentNotValidException e) {
        //Get all errors
        FieldError firstError = e.getBindingResult()
                .getFieldErrors().get(0);
        log.error("MethodArgumentNotValidException {} {}", firstError.getField(), firstError.getDefaultMessage());
        ErrorResponse error = ErrorResponse.builder()
                .errorCode(ErrorCode.INVALID_PARAMETER.getCode())
                .description(ErrorCode.MISSING_PARAMETER.getMessage())
                .build();

        return BaseResponse.error(error);
    }

    @ExceptionHandler({MissingServletRequestParameterException.class})
    @ResponseStatus(HttpStatus.OK)
    protected BaseResponse handleExp(MissingServletRequestParameterException e) {
        log.error(e.getMessage());
        ErrorResponse error = ErrorResponse.builder()
                .errorCode(ErrorCode.MISSING_PARAMETER.getCode())
                .description(ErrorCode.MISSING_PARAMETER.getMessage())
                .build();

        return BaseResponse.builder()
                .success(false)
                .error(error)
                .build();
    }

    @ExceptionHandler({GeneralException.class})
    @ResponseStatus(HttpStatus.OK)
    public final BaseResponse handleExp(GeneralException e) {
        e.printStackTrace();
        log.error(e.getMessage());
        ErrorResponse error = ErrorResponse.builder()
                .errorCode(e.getErrorCode().getCode())
                .description(e.getErrorCode().getMessage())
                .data(e.getData())
                .build();

        return BaseResponse.error(error);
    }
    @ExceptionHandler({RestApiException.class})
    public ResponseEntity<?> handlerException(Exception ex) {
        ApiError apiError = new ApiError(500,ex.getMessage());
        return new ResponseEntity<>(apiError, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public final BaseResponse handleAllExps(Exception e) {
        e.printStackTrace();
        log.error(e.getMessage());
        ErrorResponse error = ErrorResponse.builder()
                .errorCode(ErrorCode.UNKNOWN.getCode())
                .description(ErrorCode.UNKNOWN.getMessage())
                .build();

        return BaseResponse.error(error);
    }


}
