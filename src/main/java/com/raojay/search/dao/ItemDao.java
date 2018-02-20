package com.raojay.search.dao;

import org.apache.solr.client.solrj.SolrQuery;

import com.taotao.common.pojo.SearchResult;

public interface ItemDao {

	SearchResult searchItem(SolrQuery solrQuery) throws Exception;
}
