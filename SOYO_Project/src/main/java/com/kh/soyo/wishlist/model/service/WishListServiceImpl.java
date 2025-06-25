package com.kh.soyo.wishlist.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.soyo.wishlist.model.dao.WishListDao;
import com.kh.soyo.wishlist.model.vo.Wish;

@Service
public class WishListServiceImpl implements WishListService {

    @Autowired
    private WishListDao wishListDao;

    @Override
    public int insertWish(Wish wish) {
        return wishListDao.insertWish(wish);
    }

    @Override
    public boolean isWishAlreadyExists(Wish wish) {
        return wishListDao.isWishAlreadyExists(wish) > 0;
    }

    @Override
    public int deleteWish(Wish wish) {
        return wishListDao.deleteWish(wish);
    }
}
