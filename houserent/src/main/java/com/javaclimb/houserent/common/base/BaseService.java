package com.javaclimb.houserent.common.base;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

/*所有Service接口的基础接口，用到了JDK8的函数式接口注解有且仅有"一个抽象！抽象！抽象方法，可以有其他的具体方法*/

//@FunctionalInterface,取消使用唯一抽象方法注解
public interface BaseService <E,ID extends Serializable>{
    /*mapper对象*/
    BaseMapper<E> getRepositorty();

    /*根据id获取对象*/
    default E get(ID id) {
        return getRepositorty().selectById(id);
    }

    /*获取所有列表*/
    default List<E> getAll() {
        return getRepositorty().selectList(null);
    }

    /*添加一条记录*/
    default E insert(E entity) {
        getRepositorty().insert(entity);
        return entity;
    }

    /*更新一条记录*/
    default E update(E entity) {
        getRepositorty().updateById(entity);
        return entity;
    }

    /*添加或者更新*/
    default E insertOrUpdate(E entity) {
        try {
            Object id = entity.getClass().getMethod("getId").invoke(entity); //无法判断是需要添加或者更新数据时，先获取id
            if (id == null ) {      //如果id不存在，那么就是向表中插入数据
                insert(entity);
            }else{                  //否则就是更新表中数据
                update(entity);
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        return entity;
    }

    /*根据主键id删除一条记录*/
    default int delete(ID id) {
        return  getRepositorty().deleteById(id);
    }

    /*批量删除*/
    default void batchDelete(List<ID> ids) {
        getRepositorty().deleteBatchIds(ids);
    }

    /*分页查询*/
//    default Page<E> findAll(Page<E> page) {
//        return (Page<E>) getRepositorty().selectPage(page,null);
//    }
//不知这里的哪里写错了，会不存在E类型的错误，重写一遍居然不报错了
    //分页查询
      default Page<E> findAll(Page<E> page) {
        return (Page<E>) getRepositorty().selectPage(page,null);
    }

    /*获取查询器*/
     QueryWrapper<E> getQueryWrapper(E e);

     /*获取带参数的查询器*/
    QueryWrapper<E> getQueryWrapper(Map<String,Object> condition);

    /*根据查询条件分页查询*/
    default Page<E> findAll(Page<E> page,E e) {
        QueryWrapper<E> queryWrapper = getQueryWrapper(e);
        return (Page<E>) getRepositorty().selectPage(page,queryWrapper);
    }

    /*根据查询条件分页查询,与上一个的区别在于第二个参数的不同 */
    default Page<E> findAll(Page<E> page,Map<String,Object> condition) {
        QueryWrapper<E> queryWrapper = getQueryWrapper(condition);
        return (Page<E>) getRepositorty().selectPage(page,queryWrapper);
    }
}
