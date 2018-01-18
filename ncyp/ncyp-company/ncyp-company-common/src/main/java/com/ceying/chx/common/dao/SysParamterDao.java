package com.ceying.chx.common.dao;


import com.ceying.chx.common.dto.SysParameterDto;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by mzq on 2017/12/21.
 */
@Repository
public interface SysParamterDao {
    List<SysParameterDto> queryAll(SysParameterDto sysParameterDto) throws Exception;

}
