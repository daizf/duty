<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<label>性别</label>
<div class="input-control radio default-style inline-block" data-role="input-control">
    <label class="inline-block">
        <input type="radio" name="volunteer.sex" value="1" checked
          <s:if test="volunteer.sex==1">
            checked
          </s:if>
         />
        <span class="check"></span>
        男
    </label>
    <label class="inline-block">
        <input type="radio" name="volunteer.sex" value="2"
          <s:if test="volunteer.sex==2">
            checked
          </s:if>
        />
        <span class="check"></span>
        女
    </label>
</div>
<label>手机</label>
<div class="input-control text" data-role="input-control">
    <input type="text" placeholder="请输入手机" name="volunteer.cellPhone" value="${volunteer.cellPhone}" required="required"/>
    <button class="btn-clear" tabindex="-1"></button>
</div>

<label>微信</label>
<div class="input-control text" data-role="input-control">
    <input type="text" placeholder="请输入微信" name="volunteer.wechat" value="${volunteer.wechat}" required="required"/>
    <button class="btn-clear" tabindex="-1"></button>
</div>

<label>邮箱</label>
<div class="input-control text" data-role="input-control">
    <input type="text" placeholder="请输入邮箱" name="volunteer.email" value="${volunteer.email}" required="required"/>
    <button class="btn-clear" tabindex="-1"></button>
</div>