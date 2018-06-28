package com.ceying.common.util.bean;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

/**
 *
 * 提供了bean操作的一系列方法。所谓Bean就是指包含一个或多个属性，并可以用get/set方法取/存数据的类。 map也可以看成是Bean的一种。
 * 这个类提供了bean之间复制数据、取得bean的所有属性、判断bean中是否有属性等方法。
 *
 * @author chenxt
 */
public abstract class BeanUtil {

	/**
	 * 将源对象的所有属性值复制到目标对象
	 *
	 * @param to 目标拷贝对象，该对象不能为map
	 * @param from 拷贝源
	 */
	public static void copy(Object to, Object from) {
		try {
			PropertyUtils.copyProperties(to, from);
		} catch (IllegalAccessException e) {
			throw new RuntimeException("拷贝时出错，用反射机制时属性或者方法不能被访问。", e);
		} catch (InvocationTargetException e) {
			throw new RuntimeException("拷贝时出错，用反射机制调用方法时。", e);
		} catch (NoSuchMethodException e) {
			throw new RuntimeException("拷贝时出错，用反射机制调用方法时方法不存在。", e);
		}
	}

	/**
	 * <p>
	 * 将源对象的所有属性值复制到目标对象，但是忽略ignore中含有的属性
	 * </p>
	 *
	 * @param to 目标拷贝对象
	 * @param from 拷贝源
	 * @param ignore 需要忽略的属性
	 */
	public static void copy(Object to, Object from, String[] ignore) {

		List<String> list = null;
		if (ignore == null) {
			list = new ArrayList<String>();
		} else {
			list = Arrays.asList(ignore);
		}
		PropertyDescriptor[] descr = PropertyUtils.getPropertyDescriptors(to);
		for (int i = 0; i < descr.length; i++) {
			PropertyDescriptor d = descr[i];
			if (d.getWriteMethod() == null)
				continue;
			if (list.contains(d.getName()))
				continue;
			try {
				Object value = PropertyUtils.getProperty(from, d.getName());
				PropertyUtils.setProperty(to, d.getName(), value);
			} catch (Exception e) {
				throw new RuntimeException("属性名：" + d.getName() + " 在实体间拷贝时出错", e);
			}
		}
	}

	/**
	 * <p>
	 * 将源对象的所有属性值复制到目标对象，但是目标对象的属性名需去除后缀或前缀，以转换为源对象的属性名
	 * </p>
	 * @param to 目标拷贝对象
	 * @param from 拷贝源
	 * @param removestr 目标对象属性名需去除的后缀或前缀
	 * @param isend 是否去除后缀，1为去除后缀，其它去除前缀
	 * @param ignore 需要忽略的属性
	 * @author zhanghj07409
	 */
	public static void copyRemoveString(Object to, Object from, String removestr, Integer isend, String[] ignore) {
		List<String> list = null;
		if (ignore == null) {
			list = new ArrayList<String>();
		} else {
			list = Arrays.asList(ignore);
		}		
		PropertyDescriptor[] descr = PropertyUtils.getPropertyDescriptors(to);
		for (int i = 0; i < descr.length; i++) {
			PropertyDescriptor d = descr[i];
			if (d.getWriteMethod() == null)
				continue;	
			if (list.contains(d.getName()))
				continue;
			try {
				String name ="";
				if(isend==1){
					name =StringUtils.removeEnd(d.getName(), removestr);
				}else{
					name =StringUtils.removeStart(d.getName(), removestr);
				}			
				Object value = PropertyUtils.getProperty(from, name);
				if (value != null){
					PropertyUtils.setProperty(to, d.getName(), value);
				}				
			} catch (Exception e) {
				throw new RuntimeException("属性名：" + d.getName() + " 在实体间拷贝时出错", e);
			}
		}
	}

	/**
	 * <p>
	 * 将源对象的所有属性值复制到目标对象，但是源对象的属性名需添加后缀或前缀，以转换为源对象的属性名
	 * </p>
	 * @param to 目标拷贝对象
	 * @param from 拷贝源
	 * @param addstr 源对象属性名需添加的后缀或前缀
	 * @param isend 是否添加后缀，1为添加后缀，其它添加前缀
	 * @param ignore 需要忽略的属性
	 * @author zhanghj07409
	 */
	public static void copyAddString(Object to, Object from, String addstr, Integer isend, String[] ignore) {
		List<String> list = null;
		if (ignore == null) {
			list = new ArrayList<String>();
		} else {
			list = Arrays.asList(ignore);
		}	
		PropertyDescriptor[] descr = PropertyUtils.getPropertyDescriptors(to);
		for (int i = 0; i < descr.length; i++) {
			PropertyDescriptor d = descr[i];
			if (d.getWriteMethod() == null)
				continue;
			if (list.contains(d.getName()))
				continue;
			try {
				String name ="";
				if(isend==1){
					name =d.getName()+addstr;
				}else{
					name =addstr+d.getName();
				}			
				Object value = PropertyUtils.getProperty(from, name);
				if (value != null){
					PropertyUtils.setProperty(to, d.getName(), value);
				}
			} catch (Exception e) {
				throw new RuntimeException("属性名：" + d.getName() + " 在实体间拷贝时出错", e);
			}
		}
	}
	
	/**
	 * <p>
	 * 根据属性名称和属性值，将数据设定到实体对象bean中
	 * </p>
	 *
	 * @param bean 对象，可以为map
	 * @param propertyName 属性名称
	 * @param value 属性值
	 */
	public static void setDataToBean(Object bean, String propertyName, Object value) {
		try {
			PropertyUtils.setProperty(bean, propertyName, value);
		} catch (IllegalAccessException e) {
			throw new RuntimeException("没有权限访问相应属性：" + propertyName, e);
		} catch (InvocationTargetException e) {
			throw new RuntimeException("访问属性：" + propertyName + "时出错", e);
		} catch (NoSuchMethodException e) {
			throw new RuntimeException("属性：" + propertyName + "没有相应的SET方法", e);
		}
	}



	/**
	 * <p>
	 * 获取实体对象的所有属性
	 * </p>
	 *
	 * @param bean 实体对象
	 * @return Map 属性集合
	 */
	@SuppressWarnings("rawtypes")
	public static Map getProperties(Object bean) {
		return getProperties(bean, new HashSet());
	}

	/**
	 * <p>
	 * 获取实体对象的某些属性
	 * </p>
	 *
	 * @param bean 实体对象
	 * @param ignores Set 忽略的属性名集合
	 * @return Map 属性集合
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map getProperties(Object bean, Set ignores) {
		Map map = new HashMap();
		PropertyDescriptor[] descr = PropertyUtils.getPropertyDescriptors(bean);
		for (int i = 0; i < descr.length; i++) {
			PropertyDescriptor d = descr[i];
			if (d.getReadMethod() == null) // 如果当前属性没有对应的可读的方法，则跳过
				continue;
			String name = d.getName();
			if (ignores.contains(name)) // 如果为忽略处理属性，则跳过
				continue;
			map.put(name, getPropertyValueByName(bean, name));
		}
		return map;
	}

	/**
	 * 获取对象中指定属性的值
	 *
	 * @param obj
	 * @param name
	 * @return
	 */
	public static Object getPropertyValueByName(Object bean, String propertyName) {
		try {
			return PropertyUtils.getProperty(bean, propertyName);
		} catch (IllegalAccessException e) {
			throw new RuntimeException("没有权限访问相应属性：" + propertyName, e);
		} catch (InvocationTargetException e) {
			throw new RuntimeException("访问属性：" + propertyName + "时出错", e);
		} catch (NoSuchMethodException e) {
			throw new RuntimeException("属性：" + propertyName + "没有相应的GET方法", e);
		}
	}

	/**
	 * 判断属性是否在实体中。对于map，要使用isContains()方法，而不是此方法
	 *
	 * @param bean
	 * @param propertyName
	 * @return
	 */
	public static boolean isPropertyInBean(Object bean, String propertyName) {
		PropertyDescriptor[] descr = PropertyUtils.getPropertyDescriptors(bean);
		for (int i = 0; i < descr.length; i++) {
			PropertyDescriptor d = descr[i];
			if (propertyName.equals(d.getName())) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 对象属性复制工具
	 *
	 * @param to 目标拷贝对象
	 * @param from 拷贝源
	 * @param ignore 需要忽略的属性
	 * @author zhanghj07409修改,未将ignore赋值给list
	 */
	public static void copyWithoutNull(Object to, Object from, String[] ignore) {

		List<String> list = new ArrayList<String>();
		if (ignore != null) {
		   list = Arrays.asList(ignore);
		}
		PropertyDescriptor[] descr = PropertyUtils.getPropertyDescriptors(to);
		for (int i = 0; i < descr.length; i++) {
			PropertyDescriptor d = descr[i];
			if (d.getWriteMethod() == null)
				continue;
			if (list.contains(d.getName()))
				continue;
			try {
				Object value = PropertyUtils.getProperty(from, d.getName());
				if (value != null){
					PropertyUtils.setProperty(to, d.getName(), value);
				}					
			} catch (Exception e) {
				throw new RuntimeException("属性名：" + d.getName() + " 在实体间拷贝时出错", e);
			}
		}
	}



	public static Object getActualTypeValue(Object obj, String filedName, String srcValue) {
		try {
			Field field = obj.getClass().getDeclaredField(filedName);
			Class typeClass = field.getType();
			Constructor con = typeClass.getConstructor(typeClass);
			Object actualValue = con.newInstance(srcValue);
			return actualValue;
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
