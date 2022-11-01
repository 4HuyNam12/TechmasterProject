import React, { useState } from 'react';
import { useHistory } from 'react-router-dom';
import API from '../../lib/API';

import logo from '../../image/login/logo-travelSupport.png';
import Popup from '../popup/Popup';

export default function ResetPassword() {
    let history = useHistory()

    const [isPopup, setIsPopup] = useState(false);
    const [popupMessage, setPopupMessage] = useState("");

    const handleClosePopup = () => {
        setIsPopup(false);
        setPopupMessage("");
        history.push('/login');
    };

    const handleOpenPopup = (message) => {
        setIsPopup(true);
        setPopupMessage(message);
    };
    const [account, setAccount] = useState({
        token: null,
        password: null
    });
    let [message, setMessage] = useState();
    const handleAccount = (e) => {
        let { name, value } = e.target;
        setAccount({
            ...account,
            [name]: value
        })
    }
    let reset = async () => {
        let path = '/reset-password';
        let resp = await API.anonymousJSONPost(path, account);
        if (resp.ok) {
            handleOpenPopup("Ban da doi mat khau thanh cong!")
        } else {
            let response = await resp.json();
            setMessage(response?.message)
        }
    }
    return (
        <>
        
<Popup isPopup={isPopup} popupMessage={popupMessage} handleClosePopup={() => handleClosePopup()}/>
            <div className="main__login">
                <div className="dark-bg"></div>
                <div className="wrapper__sign">
                    <img alt="" className="logo" src={logo} alt="" onClick={() => history.push('/login')} style={{ cursor: 'pointer' }} />
                    <div className="title">
                        <h1>Đăng Nhập <br />Để Khám Phá Điều Tuyệt Vời Nhất Của Du Lịch Việt Nam</h1>
                    </div>
                    <div className="sign-with">
                        <div className="item">
                            <input
                                value={account?.token}
                                name="token"
                                onChange={e => handleAccount(e)}
                                placeholder="Nhập mã"
                            />
                        </div>
                        <div className="item">
                            <input
                                type="password" className="form-control" placeholder="Password" name="password" required
                                onChange={e => handleAccount(e)}

                            />
                        </div>
                        {message && <p style={{ color: 'red' }}>{message}</p>}
                        <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }} className="btn__login-hover">
                            <button onClick={() => reset()}

                            >Xác nhận </button>
                        </div>
                    </div>

                </div>
            </div>
        </>
    )
}