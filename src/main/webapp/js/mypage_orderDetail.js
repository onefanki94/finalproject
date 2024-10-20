function formatNumber(number) {
    return number.toLocaleString();
}

$(function(){
    const token = localStorage.getItem("token");
    console.log("order_idx : ",order_idx);
    $.ajax({
        url: '/user/getOrderDetailOk',
        type: 'POST',
        data: { order_idx:order_idx },
        headers: {
            "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
        },
        success: function(response) {
            const orderDetail = response.orderDatail;
            const orderer = response.orderer;
            displayOrderDetail(orderDetail,orderer);
        },
        error: function(error) {
            console.log('Error:', error);
        }
    });
})

function displayOrderDetail(orderDetail,orderer){
    const orderContainer = $(".order_detail_all_container");
    orderContainer.empty();

    // 주문한 상품들의 총액 계산
    const totalAmount = orderDetail.products.reduce((total, product) => {
        return total + (product.pro_price * product.order_pro_amount);
    }, 0);
    // 배송비 계산
    let fee = totalAmount >= 150000 ? 0 : 2500;

    const formattedTotalAmount = formatNumber(totalAmount) + "원";
    const formattedFee = formatNumber(fee) + "원";

    const orderHTML = `
        <div class="order_detail_all">
            <div class="order_detail_state">
              <h4 class="my_tit">주문상세내역</h4>
              <div class="order_detail_inform">
                <div>
                  <div class="tb_header">
                    <div class="tb_header_proinform">상품정보</div>
                    <div class="tb_header_fee">구매수량</div>
                    <div class="tb_header_state">진행상태</div>
                  </div>
                  <div class="my_data">
                      <p><span>주문일자  </span>${orderDetail.order_date}</p>
                      <p><span>주문번호  </span>${orderDetail.orderId}</p>
                  </div>
                  <ul class="tb_body_ul">
                    ${orderDetail.products.map(product => {
                      const formattedAmount = formatNumber(product.pro_price) + "원";
                      const packageButton = product.orderState >= 3 && product.orderState <=6
                          ? `<button class="order_package">CJ대한통운 <span>${orderDetail.trackingNum}</span></button>`
                          : '';
                      return `
                      <li>
                          <ul>
                            <li class="order_data_list_one">
                              <a href="/storeDetail/${product.pro_idx}">
                                <div class="order_data_inform">
                                  <div class="order_data_img"><img src="http://192.168.1.92:8000/${product.pro_image}" /></div>
                                  <div>
                                    <p class="order_aniTitle">${product.pro_anititle}</p>
                                    <p class="order_pro_name">${product.pro_title}</p>
                                    <ul class="order_pro_option">
                                      <li>${formattedAmount}</li>
                                    </ul>
                                  </div>
                                </div>
                              </a>
                              <div class="order_delivery_fee_data">${product.order_pro_amount}</div>
                              <div class="order_current_state_div">
                                <div>
                                  <div class="order_state_all">
                                    <p class="order_state_data">${getOrderStateText(product.orderState)}</p>
                                  </div>
                                  ${packageButton}
                                </div>
                              </div>
                            </li>
                          </ul>
                      </li>
                    `;}).join('')}
                  </ul>
                </div>
              </div>
            </div>
            <div>
              <div>
                <h4 class="my_tit">구매자정보</h4>
              </div>
              <table class="buyer_inform">
                <colgroup>
                  <col width="140" />
                  <col />
                  <col width="140" />
                  <col />
                </colgroup>
                <tbody>
                  <tr>
                    <th scope="row" class="th_style">주문자</th>
                    <td class="td_style">${orderer.username}</td>
                    <th scope="row" class="th_style">아이디</th>
                    <td class="td_style">${orderer.userid}</td>
                  </tr>
                  <tr>
                    <th scope="row" class="th_style">이메일주소</th>
                    <td class="td_style">${orderer.email}</td>
                    <th scope="row" class="th_style">휴대폰번호</th>
                    <td class="td_style">${orderer.tel}</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div>
              <h4 class="my_tit">결제정보</h4>
              <div>
                <ol class="pay_inform_ol">
                  <li class="pay_inform_li">
                    <ol>
                      <li class="li_top"><span>주문금액</span><strong>${formatNumber(orderDetail.total_price)}원</strong></li>
                      <li class="li_bottom"><span>상품금액</span><span>${formattedTotalAmount}</span></li>
                      <li class="li_bottom"><span>배송비</span><span>${formattedFee}</span></li>
                    </ol>
                  </li>
                  <li class="pay_inform_li">
                    <ol>
                      <li class="li_top"><span>할인금액</span><strong>${formatNumber(orderDetail.use_point)}원</strong></li>
                      <li class="li_bottom"><span>적립금</span><span>${formatNumber(orderDetail.use_point)}원</span></li>
                    </ol>
                  </li>
                  <li class="pay_inform_li_toss">
                    <ol>
                      <li class="li_top" style="color: var(--primary)"><strong>결제금액</strong><strong>${formatNumber(orderDetail.amount)}원</strong></li>
                      <li class="li_bottom"><span>${orderDetail.paytype}</span><span>${formatNumber(orderDetail.amount)}원</span></li>
                      <li class="li_bottom"><span style="color: #a0a0a0">결제일시 ${orderDetail.payDT}</span></li>
                    </ol>
                  </li>
                </ol>
              </div>
            </div>
            <div>
              <div>
                <h4 class="my_tit">배송지정보</h4>
              </div>
              <table class="delivery_inform">
                <colgroup>
                  <col width="140" />
                  <col />
                  <col width="140" />
                  <col />
                </colgroup>
                <tbody>
                  <tr>
                    <th scope="row" class="th_style">받는사람</th>
                    <td colspan="3" class="td_style">${orderDetail.recipient}</td>
                  </tr>
                  <tr>
                    <th scope="row" class="th_style">휴대폰번호</th>
                    <td class="td_style">${orderDetail.tel}</td>
                    <th scope="row" class="th_style">전화번호</th>
                    <td class="td_style">-</td>

                  </tr>
                  <tr>
                    <th scope="row" class="th_style">주소</th>
                    <td colspan="3" class="td_style">[${orderDetail.zipcode}] ${orderDetail.addr} ${orderDetail.addrdetail}</td>
                  </tr>
                  <tr>
                    <th scope="row" class="th_style">배송요청사항</th>
                    <td colspan="3" class="td_style">${orderDetail.request_memo}</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="receipt_btn_div">
              <button type="button">영수증 출력</button>
            </div>
        </div>
    `;
    orderContainer.append(orderHTML);
}

function getOrderStateText(orderState) {
    switch(orderState) {
        case 1:
            return "결제완료";
        case 2:
            return "상품준비중";
        case 3:
            return "배송시작";
        case 4:
            return "배송중";
        case 5:
            return "배송완료";
        case 6:
            return "구매확정";
        case 7:
            return "전체취소 완료";
        case 8:
            return "부분취소 완료";
        case 9:
            return "교환접수 완료";
        case 10:
            return "교환 처리중";
        case 11:
            return "교환 처리완료";
        case 12:
            return "환불접수 완료";
        case 13:
            return "환불 처리중";
        case 14:
            return "환불 처리완료";
        default:
            return "상태오류";
    }
}