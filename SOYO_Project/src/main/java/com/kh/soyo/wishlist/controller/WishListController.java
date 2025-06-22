package com.kh.soyo.wishlist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.kh.soyo.wishlist.model.service.WishListService;
import com.kh.soyo.wishlist.model.vo.Wish;
import com.kh.soyo.member.model.vo.Member;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/wishlist")
public class WishListController {

    @Autowired
    private WishListService wishListService;

    @PostMapping("/insert")
    public String insertWish(@RequestBody Wish wish, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "notLogin";
        }

        wish.setMemberId(loginUser.getMemberId());

        // 중복 확인
        if (wishListService.isWishAlreadyExists(wish)) {
            return "duplicated";
        }

        int result = wishListService.insertWish(wish);
        return result > 0 ? "success" : "fail";
    }
}
