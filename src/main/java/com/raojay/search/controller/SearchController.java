package com.raojay.search.controller;

import com.raojay.search.service.SearchService;
import com.taotao.common.pojo.Layui;
import com.taotao.common.pojo.SolrItem;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taotao.common.pojo.SearchResult;
import com.taotao.common.pojo.TaotaoResult;
import com.taotao.common.utils.ExceptionUtil;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;

	@RequestMapping("/q")
	@ResponseBody
	public Layui search(@RequestParam("kw")String queryString, @RequestParam(defaultValue="1")Long page, @RequestParam(defaultValue="30")Long limit)
	{
		System.out.println("进入了search方法");
		if (StringUtils.isBlank(queryString))
		{
			//return TaotaoResult.build(400, "查询条件不能为空");
			return Layui.data((long)0, null);
		}
		try
		{
			//解决get乱码问题
			queryString = new String(queryString.getBytes("iso8859-1"), "utf-8");
			SearchResult searchResult = searchService.search(queryString, page, limit);
			return Layui.data(searchResult.getTotal(), searchResult.getItemList());
			//return TaotaoResult.ok(searchResult);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			//return TaotaoResult.build(500, ExceptionUtil.getStackTrace(e));
			return Layui.data((long)0, null);
		}

	}

	@RequestMapping("moreIikeByItem")
	public Layui  moreIikeByItem(SolrItem item) throws Exception{
		//解决get乱码问题
		//queryString = new String(queryString.getBytes("iso8859-1"), "utf-8");
		//SearchResult searchResult = searchService.search(queryString, page, limit);
		item=new SolrItem();
		item.setJobId(2248);
//		item.setJobName("算法工程师");
//		item.setEducation(1);
//		item.setWorkcity("北京");
//		item.setWelfare("年终奖金");
//		item.setSpecification("岗位职责：1、利用机器学习技术，改进头条的推荐、广告系统，优化用户的阅读体验；2、分析基础数据，挖掘用户兴趣、文章价值，增强推荐、广告系统的预测能力；3、分析用户商业意图，挖掘流量潜在商业价值，提升流量变现；4、研究计算机视觉算法，给用户提供更多更酷炫的功能。任职要求：1、3年以上的推荐系统、rank相关工作经验；2、强悍的编码能力，精通spark优先，精通c、c++、python语言优先；3、扎实的数据结构和算法功底；4、熟悉常用的推荐算法，能熟练解决常见的分类和回归问题；5、熟练使用以下任何一个开源工具者优先：xgboost、tensorflow、keras、theano、caffe；6、具备优秀的逻辑思维能力，对解决挑战性问题充满热情，善于解决问题和分析问题；7、具备良好的团队合作精神，较强的沟通能力和学习能力。工作地址：福建省福州市国家863专业软件孵化器510查看职位地图");
		SearchResult searchResult = searchService.moreIikeByItem(item);
		return Layui.data(searchResult.getTotal(), searchResult.getItemList());
		//return TaotaoResult.ok(searchResult);
	}
}
