package com.vn.travel.common;

import lombok.*;

import java.util.Map;

@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
@Builder
public class SQLQueryParam {
    private String sql;
    private Map<String, Object> params;
}
