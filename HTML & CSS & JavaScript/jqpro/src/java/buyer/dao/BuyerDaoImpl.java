package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.buyer.vo.BuyerVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class BuyerDaoImpl implements IBuyerDao {

	private SqlMapClient client;
	private static IBuyerDao dao;
	
	public BuyerDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IBuyerDao getInstance() {
		if(dao == null) dao = new BuyerDaoImpl();
		return dao;
	}

	@Override
	public List<BuyerVO> selectByName() {
		List<BuyerVO> list = null;
		
		try {
			list = client.queryForList("buyer.selectByName");
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public BuyerVO idByDetail(String bId) {
		BuyerVO id = null;
		
		try {
			id = (BuyerVO) client.queryForObject("buyer.idByDetail", bId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
}
