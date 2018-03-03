package com.raojay.search.service;

import com.taotao.common.pojo.SearchResult;
import com.taotao.common.pojo.SolrItem;

public interface SearchService {

	SearchResult search(String queryString, Long page, Long pageSize) throws Exception;
	SearchResult moreIikeByItem(SolrItem item)throws Exception;
}
