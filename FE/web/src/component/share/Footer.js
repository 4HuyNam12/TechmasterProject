import React from 'react';
import '../../style/style.scss';

export default function Footer() {
    return (
        <>
            <footer>
                <div className="wrapper__footer container">
                    <div className="row">
                        <div className="col-6 col__introduce col__footer" style={{display:'flex',justifyContent:'center'}}>
                            <div className="col__wrapper" style={{paddingLeft:0}}>
                                <h3 className="title-col">Về chúng tôi:</h3>
                                <p>Du Lịch Việt Nam là một ứng dụng web được phát triển bởi học viên của Techmaster.vn  Với mục tiêu mang lại cho cộng đồng yêu du lịch Việt Nam
                                    một trang web có thể hỗ trợ việc tìm kiếm thông tin và liên hệ với các đơn vị dịch vụ dễ dàng hơn.
                        
                                </p>
                            </div>
                        </div>
                        <div className="col-6 col__contact col__footerScreen Shot 2021-08-24 at 21.44.00" style={{display:'flex',justifyContent:'center'}}>
                            <div className="col__wrapper">
                                <h3 className="title-col"> Contact Us</h3>
                                <ul className="list__contact" style={{paddingLeft:0}}>
                                    <li>Đăng Ký Trở Thành Đối Tác</li>
                                    <li>Mọi thắc mắc, góp ý liên hệ với chúng tôi qua:</li>
                                    <li>Email: Travelsuptechmaster@gmail.com</li>
                                    <li>Điện thoại: 0348970889</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div className="note">
                        Design By TechMaster.vn
                    </div>
                </div>
            </footer>
        </>
    )
}