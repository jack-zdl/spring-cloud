package Test;

import org.apache.log4j.Logger;
import org.hibernate.validator.constraints.NotEmpty;

import org.slf4j.LoggerFactory;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.Map;
/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/8 16:02<br>
 * <br>
 */

public class DataAuthValidator {
    private static final Logger log = (Logger) LoggerFactory.getLogger(DataAuthValidator.class);

    public static class DataAuthContractParams {
        @NotEmpty(message = "书名不能为空")
        private String businessName;
        @NotNull(message = "ISBN号不能为空")
        private String dataProvider;
        @NotEmpty
        private String personalDataName;
        @NotEmpty
        private String dataDemander;

        public String getBusinessName() {
            return businessName;
        }

        public void setBusinessName(String businessName) {
            this.businessName = businessName;
        }

        public String getDataProvider() {
            return dataProvider;
        }

        public void setDataProvider(String dataProvider) {
            this.dataProvider = dataProvider;
        }

        public String getPersonalDataName() {
            return personalDataName;
        }

        public void setPersonalDataName(String personalDataName) {
            this.personalDataName = personalDataName;
        }

        public String getDataDemander() {
            return dataDemander;
        }

        public void setDataDemander(String dataDemander) {
            this.dataDemander = dataDemander;
        }

    }




}
