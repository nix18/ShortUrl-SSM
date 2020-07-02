package com.moecola.d.service.impl;

import com.moecola.d.dao.IIndexDao;
import com.moecola.d.domain.Surl;
import com.moecola.d.service.IIndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndexService implements IIndexService {
    @Autowired
    private IIndexDao indexDao;
    @Override
    public int urlIn(Surl s) {
        return indexDao.urlIn(s);
    }

    @Override
    public int surlIsExist(String s) {
        return indexDao.surlIsExist(s);
    }

    @Override
    public List<Surl> urlOut(String s) {
        return indexDao.urlOut(s);
    }

    @Override
    public List<String> urlInCheck(String s) {
        return indexDao.urlInCheck(s);
    }
}
