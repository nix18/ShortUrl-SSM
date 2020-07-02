package com.moecola.d.service;

import com.moecola.d.domain.Surl;


import java.util.List;

public interface IIndexService {

    public int urlIn(Surl s);

    public int surlIsExist(String s);

    public List<Surl> urlOut(String s);

    public List<String> urlInCheck(String s);
}
