package com.vn.travel.model;

import lombok.*;

import java.io.Serializable;
import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ResponseDTO<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	private Long recordsTotal;
	private Long recordsFiltered;
	private List<T> data;
}
