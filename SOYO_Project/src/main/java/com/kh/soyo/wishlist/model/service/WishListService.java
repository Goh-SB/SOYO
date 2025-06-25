package com.kh.soyo.wishlist.model.service;

import com.kh.soyo.wishlist.model.vo.Wish;

public interface WishListService {
    int insertWish(Wish wish);
    boolean isWishAlreadyExists(Wish wish);
    int deleteWish(Wish wish);
}
