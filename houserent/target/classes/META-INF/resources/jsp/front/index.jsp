<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入页面头部与底部文件-->
<%@include file="../common/head.jsp"%>
<div class="image-cover hero_banner" style="background: #334aca url('/assets/img/banner-3.jpg')no-repeat;" data-overlay="1">
    <div class="container">
        <h1 class="big-header-capt mb-0">从此开始一段新的居住生活！</h1>
        <p class="text-center mb-5">输入城市或者房屋类型名称进行搜索</p>
        <div class="full_search_box nexio_search lightanic_search hero_search-radius modern">
            <div class="search_hero_wrapping">
                <form action="/house">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <div class="form-group">
                                <label>小区名称</label>
                                <div class="input-with-icon">
                                    <input type="text" id="address" name="address" class="form-control" placeholder="请在此输入小区名称">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                            <div class="form-group">
                                <label>城市名称</label>
                                <div class="input-with-icon">
                                    <select id="city" name="city" class="form-control">
                                        <option value="">不限</option>
                                        <option value="北京">北京</option>
                                        <option value="上海">上海</option>
                                        <option value="广州">广州</option>
                                        <option value="深圳">深圳</option>
                                        <option value="郑州">郑州</option>
                                        <option value="杭州">杭州</option>
                                        <option value="天津">天津</option>
                                        <option value="重庆">重庆</option>
                                        <option value="香港">香港</option>
                                        <option value="澳门">澳门</option>
                                        <option value="拉萨">拉萨</option>
                                        <option value="贵阳">贵阳</option>
                                        <option value="南宁">南宁</option>
                                        <option value="昆明">昆明</option>
                                        <option value="长春">长春</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                            <div class="form-group">
                                <label>租房类型</label>
                                <div class="input-with-icon">
                                    <select id="selectRentType" name="rentType" class="form-control">
                                        <option value="">不限</option>
                                        <option value="whole">整租</option>
                                        <option value="share">合租</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <div class="form-group">
                                <label>月租金范围</label>
                                <div class="input-with-icon">
                                    <select id="price" name="priceRange" class="form-control">
                                        <option value="">不限</option>
                                        <option value="0;999">0-1000</option>
                                        <option value="1000;1999">1999-2000</option>
                                        <option value="2000;2999">2000-3000</option>
                                        <option value="3000;4999">3000-5000</option>
                                        <option value="5000;9999">5000-10000</option>
                                        <option value="10000;19999">10000-20000</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 small-padd">
                            <div class="form-group none">
                                <button type="submit" class="btn search-btn">搜索</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<section class="gray-simple">
    <div class="container">
        <div class="row justify-content-center">
            <div class="sec-heading center">
                <h2>最新整租</h2>
                <p>给你推荐了一些最新发布的整租的房子</p>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${recentWholeHouseList}" var="c">
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="listing_thumb_wrapper">
                        <a href="/house/detail/${c.id}"><img src="${c.thumbnailUrl}" class="img-fluid mx-auto"></a>
                    </div>
                    <div class="property_caption_wrappers pb-0">
                        <div class="property_short_detail">
                            <div class="pr_type_status">
                                <h4 class="pr-property_title mb-1"><a href="/house/detail/${c.id}">${c.title}</a></h4>
                                    <div class="listing-location-name">
                                        <a href="/house/detail/${c.id}">${c.address}</a>
                                    </div>
                            </div>
                            <div class="property-real-price">
                                <a href="/house/detail/${c.id}" class="cl-blue">￥${c.monthRent}<span class="price_status">/月</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="modern_property_footer">
                        <div class="property-lists flex-1">
                            <ul>
                                <li>
                                    <span class="flatcons"><img src="/assets/img/bed.svg"></span>${c.bedroomNum}卧室
                                </li>
                                <li>
                                    <span class="flatcons"><img src="/assets/img/bath.svg"></span>${c.toiletNum}卫生间
                                </li>
                            </ul>
                        </div>
                        <div class="fp_types">
                            <a href="javascript:void(0)" onclick="submitMark(${c.id})">收藏</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <a href="/house?rentType=whole" class="btn btn-theme arrow-btn bg-2">查看更多
                    <span><i class="ti-arrow-right"></i></span>
                </a>
            </div>
        </div>
    </div>
</section>
<section class="gray-simple">
    <div class="container">
        <div class="row justify-content-center">
            <div class="sec-heading center">
                <h2>最新合租</h2>
                <p>给你推荐了一些最新发布的合租的房子</p>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${recentShareHouseList}" var="c">
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="listing_thumb_wrapper">
                        <a href="/house/detail/${c.id}"><img src="${c.thumbnailUrl}" class="img-fluid mx-auto"></a>
                    </div>
                    <div class="property_caption_wrappers pb-0">
                        <div class="property_short_detail">
                            <div class="pr_type_status">
                                <h4 class="pr-property_title mb-1"><a href="/house/detail/${c.id}">${c.title}</a></h4>
                                <div class="listing-location-name">
                                    <a href="/house/detail/${c.id}">${c.address}</a>
                                </div>
                            </div>
                            <div class="property-real-price">
                                <a href="/house/detail/${c.id}" class="cl-blue">￥${c.monthRent}<span class="price_status">/月</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="modern_property_footer">
                        <div class="property-lists flex-1">
                            <ul>
                                <li>
                                    <span class="flatcons"><img src="/assets/img/bed.svg"></span>${c.bedroomNum}卧室
                                </li>
                                <li>
                                    <span class="flatcons"><img src="/assets/img/bath.svg"></span>${c.toiletNum}卫生间
                                </li>
                            </ul>
                        </div>
                        <div class="fp_types">
                            <a href="javascript:void(0)" onclick="submitMark(${c.id})">收藏</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <a href="/house?rentType=share" class="btn btn-theme arrow-btn bg-2">查看更多
                    <span><i class="ti-arrow-right"></i></span>
                </a>
            </div>
        </div>
    </div>
</section>
<%@include file="../common/footer.jsp"%>