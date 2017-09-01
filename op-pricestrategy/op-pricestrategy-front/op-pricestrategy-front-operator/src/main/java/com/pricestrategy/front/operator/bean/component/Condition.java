package com.pricestrategy.front.operator.bean.component;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.google.common.collect.Lists;
import com.pricestrategy.front.operator.bean.enums.CommonSelect;

/**
 * Condition引用为null表示无限制<br>
 * isIncluded为true，表示包含<br>
 * isIncluded为false, 表示排除<br>
 * 包含时list为empty，表示全部或者无限制<br>
 * 排除时list为empty，表示排除全部
 *
 */
public class Condition<T> {
	/**
	 * 是否包含，true包含，false不包含
	 */
	private boolean included;
	
	// 仅供fareBasis选项使用  // 当为 ALL_TRIP_SAME时，list 无值
	private CommonSelect fareBasisType;
	
	private List<T> list;
	
	public Condition() {
		included = true;
	}

	public Condition(boolean isIncluded, List<T> list) {
		this.included = isIncluded;
		this.list = list;
	}
	
	public Condition(Condition<T> condition) {
		this.included = condition.included;
		this.list = Lists.newArrayList(condition.list);
	}
	
	public boolean isIncluded() {
		return included;
	}

	public void setIncluded(boolean isIncluded) {
		this.included = isIncluded;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}
	
	/**
	 * 判断是否包含t<br>
	 * <p>
	 * 以下逻辑均从上往下判断，上面的条件是下面条件的前置条件
	 * <ul>
	 * 	<li>t = null，返回false</li>
	 * 	<li>this.isEmpty()，返回false</li>
	 * 	<li>this.isAll()，返回true</li>
	 * 	<li>this.include = true 并且 list.contains(t)，返回true</li>
	 * 	<li>this.include = false 并且 !list.contains(t)，返回true</li>
	 * 	<li>其他返回false</li>
	 * </ul></p>
	 * @param t
	 * @return
	 */
	public boolean contains(T t) {
		if(t == null || this.isEmpty()) {
			return false;
		}
		if(included) {
			if(CollectionUtils.isEmpty(list) || list.contains(t)) {
				return true;
			}
		} else {
			if(!list.contains(t)) {
				return true;
			}
		}
		return false;
	}
	
	public boolean isAll() {
		return included && CollectionUtils.isEmpty(list);
	}
	
	public boolean isEmpty() {
		return !included && CollectionUtils.isEmpty(list);
	}
	
	/**
	 * 判断与{@link Collection}参数是否有交集
	 * <p>
	 * 以下逻辑均从上往下判断，上面的条件是下面条件的前置条件
	 * 	<ul>
	 * 		<li>c不允许为empty，否则抛出{@link IllegalArgumentException}</li>
	 *  	<li>this.isEmpty()，返回false</li>
	 *   	<li>this.isAll()，返回true </li>
	 *    	<li>this.include = true，并且this.list与c有交集，则返回true</li>
	 *     	<li>this.include = false, 并且!this.list.containsAll(c)，则返回true</li>
	 *      <li>其他均返回false</li>
	 * 	</ul>
	 * </p>
	 * @param c
	 * @return
	 */
	public boolean isIntersection(Collection<T> c) {
		if(CollectionUtils.isEmpty(c)) {
			throw new IllegalArgumentException("param[Collection<T> c] can not be empty");
		}
		if(this.isEmpty()) {
			return false;
		}
		if(included) {
			if(CollectionUtils.isEmpty(list) || !CollectionUtils.intersection(list, c).isEmpty()) {
				return true;
			}
		} else {
			if(!list.containsAll(c)) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 判断与{@link Condition}参数是否有交集
	 *  <p>
	 *  以下逻辑均从上往下判断，上面的条件是下面条件的前置条件
	 * 	<ul>
	 * 		<li>c为null，并且!this.isEmpty()，则返回true</li>
	 *  	<li>this.isEmpty()或者c.isEmpty()，返回false</li>
	 *   	<li>this.isAll()或者c.isAll()，返回true </li>
	 *    	<li>c.include = true，并且this.isIntersection(c.list)，则返回true</li>
	 *     	<li>c.include = false，并且this.isAll()，返回true</li>
	 *     	<li>c.include = false，并且this.include = true && !c.list.containsAll(this.list)，返回true</li>
	 *     	<li>c.include = false，并且this.include = false，默认返回true</li>
	 *      <li>其他均返回false</li>
	 * 	</ul>
	 * </p>
	 * @param c
	 * @return
	 */
	public boolean isIntersection(Condition<T> c) {
		if(c == null && !this.isEmpty()) {
			return true;
		}
		if(this.isEmpty() || c.isEmpty()) {
			return false;
		}
		if(this.isAll() || c.isAll()) {
			return true;
		}
		if(c.included) {
			return this.isIntersection(c.list);
		} else {
			if(this.included) {
				if(CollectionUtils.isEmpty(this.list) || !c.list.containsAll(this.list)) {
					return true;
				}
			} else { //同时排除时，返回true，不准确
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 
	 * @param c
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Condition<T> intersection(Condition<T> c) {
		if(c == null) {
			return this;
		}
		if(this.isEmpty() || c.isEmpty()) {
			return new Condition<T>(false, Collections.<T>emptyList());
		}
		if(this.isAll()) {
			return c;
		} else if(c.isAll()) {
			return this;
		} else {
			if(c.included) {
				if(this.included) {
					return new Condition<T>(true, Lists.newArrayList(CollectionUtils.intersection(c.list, this.list)));
				} else {
					List<T> list = Lists.newArrayList(CollectionUtils.subtract(c.list, this.list));
					return new Condition<T>(!list.isEmpty(), list);
				}
			} else {
				if(this.included) {
					List<T> list = Lists.newArrayList(CollectionUtils.subtract(this.list, c.list));
					return new Condition<T>(!list.isEmpty(), list);
				} else {
					return new Condition<T>(false, Lists.newArrayList(CollectionUtils.union(c.list, this.list)));
				}
			}
		}
	}
	
	/**
	 * 
	 * 根据lucence的查询规则匹配
	 * 
	 * @param c为政策的条件，this为售价的条件
	 * @return
	 */
	public boolean isMatchOrExclude(Condition<T> c) {		
		if(this.isAll()) {
			return true;
		}
		if(c == null || c.isAll()) {
			return true;
		}
		if(this.included) {
			if(c.included) {
				if(!CollectionUtils.intersection(list, c.list).isEmpty()) {
					return true;
				} else {
					return false;
				}
			} else {
				if(!c.list.containsAll(list)) {
					return true;
				} else {
					return false;
				}
			}
		} else {
			if(c.included) {
				if(!CollectionUtils.intersection(list, c.list).isEmpty()) {
					return false;
				} else {
					return true;
				}
			} else {
				if(c.list.containsAll(list)) {
					return true;
				} else {
					return false;
				}
			}
		}
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (included ? 1231 : 1237);
		result = prime * result + ((list == null) ? 0 : list.hashCode());
		return result;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Condition other = (Condition) obj;
		if (included != other.included)
			return false;
		if (list == null) {
			if (other.list != null)
				return false;
		} else if (!list.equals(other.list))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("Condition [isIncluded=%s, list=%s]", included, list);
	}

	public CommonSelect getFareBasisType() {
		return fareBasisType;
	}

	public void setFareBasisType(CommonSelect fareBasisType) {
		this.fareBasisType = fareBasisType;
	}
	
}
