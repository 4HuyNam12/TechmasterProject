import React, {useState} from 'react';
import API from '../../lib/API';
import logo from '../../image/login/logo-travel.png';
import {useHistory} from 'react-router-dom'
import Popup from '../popup/Popup';

export default function ForgotPassword() {
    const [email, setEmail] = useState();
    const [message, setMessage] = useState();
    const [isPopup, setIsPopup] = useState(false);
    const [popupMessage, setPopupMessage] = useState("");


    let history = useHistory();
    const forgot = async () => {
        let path = `/forward-password?email=${email}`;
        let resp = await API.anonymousJSONPost(path);
        if (resp.ok) {
            handleOpenPopup("Vui lòng check mail")
            

        } else {
            // let response = await resp.json()
            // setMessage(response?.message)
        }
    }

    const handleClosePopup = () => {
        setIsPopup(false);
        setPopupMessage("");
        history.push('/forward-password')
    };

    const handleOpenPopup = (message) => {
        setIsPopup(true);  
        setPopupMessage(message);
    };


    return (
        <>
          <Popup isPopup={isPopup} popupMessage={popupMessage} handleClosePopup={() => handleClosePopup()}/>
            <div className="main__login">
                <div className="dark-bg"></div>
                <div className="wrapper__sign">
                    <img alt="" className="logo" src={logo} alt="" onClick={() => history.push('/login')} style={{cursor:'pointer'}}  />
                    <div className="title">
                        <h1>Vui lòng nhập lại mail</h1>
                    </div>
                    <div className="sign-with">
                        <div className="item">
                            <input
                                type="email"
                                value={email}
                                onChange={e => setEmail(e.target.value)}
                                placeholder="Email ..."
                            />
                        </div>

                        {message && <p style={{ color: 'red' }}>{message}</p>}
                        <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }} className="btn__login-hover">
                            <button onClick={() => forgot()}
                            
                            >Xác nhận</button>
                        </div>
                    </div>


                </div>
            </div>
        </>
    )
}