package dc.human.kimbanbagi.tableJava.owner.dao;

import dc.human.kimbanbagi.tableJava.common.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("ownerDAO")
public interface OwnerDAO {
    public UserVO getOwnerInfo(String userId);
}
