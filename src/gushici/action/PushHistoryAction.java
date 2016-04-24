package gushici.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import gushici.domain.PushRecord;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import java.util.List;

/**
 * Created by Jason Song(wolfogre.com) on 2016/4/24.
 */
public class PushHistoryAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		Configuration configuration = new Configuration().configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();

		//Transaction transaction = session.beginTransaction();
		SQLQuery sqlQuery = session.createSQLQuery("SELECT * FROM shiciall").addEntity(PushRecord.class);
		List<PushRecord> pushRecordList = sqlQuery.list();
		//session.save();
		//transaction.commit();

		session.close();
		sessionFactory.close();

		ActionContext actionContext = ActionContext.getContext();
		actionContext.put("pushRecordList", pushRecordList);
		return SUCCESS;
	}
}
