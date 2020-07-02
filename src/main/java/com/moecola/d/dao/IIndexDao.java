package com.moecola.d.dao;

import com.moecola.d.domain.Surl;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("indexDao")
public interface IIndexDao {

    @Insert("insert into surl values(#{surl},#{url})")
    public int urlIn(Surl s);

    @Select("select count(url) from surl where surlid=#{s}")
    public int surlIsExist(String s);

    @Select("select * from surl where surlid=#{s}")
    public List<Surl> urlOut(String s);

    @Select("select surlid from surl where url=#{s}")
    public List<String> urlInCheck(String s);
}
