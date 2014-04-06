package bl.mongobus;

import bl.beans.Bean;
import bl.beans.ServicePlaceBean;
import bl.common.BeanContext;
import bl.common.BusinessResult;
import bl.exceptions.MiServerException;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import dao.MongoDBConnectionFactory;
import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Key;
import org.mongodb.morphia.query.Query;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class ServicePlaceBusiness extends MongoCommonBusiness<BeanContext, ServicePlaceBean> {
    private static Logger LOG = LoggerFactory.getLogger(ServicePlaceBusiness.class);

    public ServicePlaceBusiness() {
        this.clazz = ServicePlaceBean.class;
    }

    @Override
    public BusinessResult createLeaf(BeanContext genLeafBean) {
        ServicePlaceBean sp = (ServicePlaceBean) genLeafBean;
        Datastore dc = MongoDBConnectionFactory.getDatastore(this.dbName);
        Query<ServicePlaceBean> query = dc.createQuery(this.clazz);
        query.or(
                query.criteria("name").equal(sp.getName()),
                query.criteria("code").equal(sp.getCode())
        ).and(query.criteria("isDeleted").equal(false));
        List<ServicePlaceBean> exists = query.asList();
        if (exists.size() > 0) {
            throw new MiServerException.Conflicted("已经存在的服务地点名称或者编码");
        }
        return super.createLeaf(genLeafBean);
    }

    @Override
    public BusinessResult updateLeaf(BeanContext origBean, BeanContext newBean) {
        ServicePlaceBean sp = (ServicePlaceBean) newBean;
        Datastore dc = MongoDBConnectionFactory.getDatastore(this.dbName);
        Query<ServicePlaceBean> query = dc.createQuery(this.clazz);
        query.or(
                query.criteria("name").equal(sp.getName()),
                query.criteria("code").equal(sp.getCode())
        ).and(query.criteria("isDeleted").equal(false));
        List<ServicePlaceBean> exists = query.asList();
        if (exists.size() >1 || (exists.size() ==1 && !exists.get(0).getId().equals(sp.getId()))) {
            throw new MiServerException.Conflicted("已经存在的服务地点名称或者编码");
        }
        return super.updateLeaf(origBean, newBean);
    }
}
