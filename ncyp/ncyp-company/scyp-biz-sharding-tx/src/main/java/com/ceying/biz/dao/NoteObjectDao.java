package com.ceying.biz.dao;

import com.ceying.biz.entity.NoteObjectEntity;
import com.ceying.biz.query.NoteObjectQuery;
import com.ceying.biz.vo.NoteObjectVO;
import com.ceying.common.util.mybatis.MyMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author: mzq
 * @date: 2018/5/22
 * @description :单据对象dao
 * @version: 2.0
 */
@Repository
public interface NoteObjectDao extends MyMapper<NoteObjectEntity>{
    List<NoteObjectQuery> list(NoteObjectVO vo);
}
