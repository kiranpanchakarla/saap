package com.ap.mis.util;

import java.io.Serializable;
import java.util.Date;
import java.util.stream.IntStream;

import org.hibernate.EmptyInterceptor;
import org.hibernate.type.Type;

import com.ap.mis.entity.AuditModel;
import com.ap.mis.entity.User;

public class AuditModelInterceptor extends EmptyInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public boolean onSave(Object entity, Serializable id, Object[] state, String[] propertyNames, Type[] types) {
		// TODO Auto-generated method stub
		System.out.println("On save call at AuditModelInterceptor");
		if (entity instanceof AuditModel) {
			AuditModel auditEntity = (AuditModel) entity;

			int createdAtIndex = IntStream.range(0, propertyNames.length)
					.filter(i -> propertyNames[i].equalsIgnoreCase("createdAt")).findFirst().orElse(-1);
			int createdByIndex = IntStream.range(0, propertyNames.length)
					.filter(i -> propertyNames[i].equalsIgnoreCase("createdBy")).findFirst().orElse(-1);

			
			if (createdAtIndex != -1) {
				state[createdAtIndex] = new Date();
			}
			
			
			auditEntity.setCreatedAt(new Date());

			if (SecurityUtil.getLoggedUser() != null) {
				User user = SecurityUtil.getLoggedUser();
				auditEntity.setCreatedBy(user.getId());
				state[createdByIndex] = user.getId();
			}

		}
		return super.onSave(entity, id, state, propertyNames, types);
	}

	@Override
	public boolean onFlushDirty(Object entity, Serializable id, Object[] currentState, Object[] previousState,
			String[] propertyNames, Type[] types) {
		// TODO Auto-generated method stub
		System.out.println("On flush dirty (update) call at AuditModelInterceptor");
		if (entity instanceof AuditModel) {
			AuditModel auditEntity = (AuditModel) entity;

			int updatedAtIndex = IntStream.range(0, propertyNames.length)
					.filter(i -> propertyNames[i].equalsIgnoreCase("updatedAt")).findFirst().orElse(-1);
			int updatedByIndex = IntStream.range(0, propertyNames.length)
					.filter(i -> propertyNames[i].equalsIgnoreCase("updatedBy")).findFirst().orElse(-1);

			auditEntity.setUpdatedAt(new Date());
			if (updatedAtIndex != -1) {
				currentState[updatedAtIndex] = new Date();
			}

			if (SecurityUtil.getLoggedUser() != null) {
				User user = SecurityUtil.getLoggedUser();
				auditEntity.setUpdatedBy(user.getId());
				if (updatedByIndex != -1) {
					currentState[updatedByIndex] = user.getId();
				}
			}

		}

		return super.onFlushDirty(entity, id, currentState, previousState, propertyNames, types);
	}

}
