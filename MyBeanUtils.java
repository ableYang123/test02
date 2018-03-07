import java.lang.reflect.Field;

import java.lang.reflect.Method;

import java.sql.ResultSet;

import java.util.ArrayList;

import java.util.List;



public class MyBeanUtils {



	public static void main(String[] args) {

		// TODO Auto-generated method stub

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })

	public static List tranObject(ResultSet rt, Class c) throws Exception{

		//保存封装对象

		List list = null;

		//如果结果集中没有记录，直接返回null

		if (rt != null) {

			//获取封装bean类型属性

			Field[] f = c.getDeclaredFields();

			list = new ArrayList();

			while (rt.next()) {

				//创建bean对象

				Object o = c.newInstance();

				//遍历bean属性，获取属性set方法

				for (int i = 0; i < f.length; i++) {

					Method m = null;

					try {

						m = c.getDeclaredMethod(

								"set"

										+ f[i].getName().substring(0, 1)

												.toUpperCase()

										+ f[i].getName().substring(1),

								new Class[] { f[i].getType() });

					} catch (NoSuchMethodException e) {

						// TODO Auto-generated catch block

						continue;

					} catch (SecurityException e) {

						// TODO Auto-generated catch block

						e.printStackTrace();

					}

					//使用set方法为bean对象注入属性

					if (m != null) {

						//通过属性名获取表记录字段，通过属性类型构造方法使用字符串构造属性对象

						m.invoke(o, f[i].getType().getConstructor(String.class)

								.newInstance(rt.getString(f[i].getName().toLowerCase())));

					}

				}

				list.add(o);

			}

		}

		return list;

	}

}
