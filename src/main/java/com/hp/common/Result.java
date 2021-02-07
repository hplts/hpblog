package com.hp.common;

import lombok.Data;

/**
 * @Auther: Administrator
 * @Date: 2021-02-01
 * @Description: 异步统一返回的结果封装
 *
 * 是否成功，可用code表示（如200表示成功，400表示异常）
 * 结果消息
 * 结果数据
 *
 */
@Data
public class Result {
    private String code;
    private String msg = "";
    private Object data = "";
    public static Result success(Object data) {
        return success("200","操作成功",data);
    }
    public static Result success(String code,String message, Object data) {
        Result m = new Result();
        m.setCode(code);
        m.setData(data);
        m.setMsg(message);
        return m;
    }
    public static Result fail(String message) {
        return fail("500","操作失败",message);
    }
    public static Result fail(String code,String message, Object data) {
        Result m = new Result();
        m.setCode(code);
        m.setData(data);
        m.setMsg(message);
        return m;
    }
}
