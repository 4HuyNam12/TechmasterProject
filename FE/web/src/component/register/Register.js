import React, {useState} from 'react';
import {useHistory} from 'react-router-dom';
import API from '../../lib/API';
import {Controller, useForm} from "react-hook-form";

import logo from '../../image/login/logo-travel.png';
import moment from 'moment';
import Popup from '../popup/Popup';

export default function Register({ show, handleClose }) {
    const { control, reset, handleSubmit, formState: { errors } } = useForm();
    const [isPopup, setIsPopup] = useState(false);
	const [popupMessage, setPopupMessage] = useState("");
    const requiredMessage ="Trường này không được bỏ trống *";
    const minMessage ="Hãy nhập ít nhất 3 ký tự *";
    const handleClosePopup = () => {
        let success = popupMessage;
        setIsPopup(false);
        setPopupMessage("");
        if (success === "Đăng ký tài khoản thành công!") {
            history.push('/login');
        }
    };

    const handleOpenPopup = (message) => {
        setIsPopup(true);  
        setPopupMessage(message);
    };
    let history = useHistory();
    let [gender, setGender] = useState(true);
    let onSumbit = async form => {
        let path = `/register`;
        let objReq = {
            email: form?.email,
            dob: moment(form?.dob).format("YYYYMMDD"),
            password: form?.password,
            phone: form?.phone,
            name: form?.name,
            gender: gender

        }
        console.log(objReq)
        let resp = await API.anonymousJSONPost(path, objReq);
        if (resp.ok) {
            handleOpenPopup("Đăng ký tài khoản thành công!");
            // history.push('/login')
            // setMessage("")                                                                                                                                                                                                                 
            //     reset()
        } else {
            let response = await resp.json();
            response.message ? handleOpenPopup(response.message) : handleOpenPopup("Đã xảy ra lỗi, vui lòng kiểm tra lại!")
            
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
                        <h1>Đăng Ký <br />Để Khám Phá Điều Tuyệt Vời Nhất Của Du Lịch Việt Nam</h1>
                    </div>
                    <div className="sign-with">


                        <Controller
                            control={control}
                            render={({ field: { onChange, onBlur, value } }) => (
                                <div className="item">
                                    <input
                                        onBlur={onBlur}
                                        onChange={e => onChange(e.target.value)}
                                        value={value}
                                        placeholder="Họ tên"
                                        placeholderTextColor="#888"
                                        underlineColorAndroid="transparent"
                                    />
                                </div>
                            )}
                            name="name"
                            rules={{ required: true, minLength: 3, maxLength: 50 }}
                            defaultValue=""
                        />
                        {errors.name && <span style={{ color: 'red' }}>{requiredMessage}</span>}
                        {errors.name?.type === "minLength" && <span style={{ color: 'red' }}>{minMessage}</span>}
                        <Controller
                            control={control}
                            render={({ field: { onChange, onBlur, value } }) => (
                                <div className="item">
                                    <input
                                        onBlur={onBlur}
                                        onChange={e => onChange(e.target.value)}
                                        value={value}
                                        placeholder="Email"
                                        placeholderTextColor="#888"

                                        underlineColorAndroid="transparent"
                                    />
                                </div>
                            )}
                            name="email"
                            rules={{ required: true, minLength: 3, maxLength: 50 ,pattern :/^(.+)@(\S+)$/}}
                            defaultValue=""
                        />
                        {/* {errors.email && <span style={{ color: 'red' }}>Trường này không được bỏ trống *</span>} */}
                        {errors.email?.type == "required" && <span style={{ color: 'red' }}>{requiredMessage}</span>}
                        {errors.email?.type === "minLength" && <span style={{ color: 'red' }}>{minMessage}</span>}
                        {errors.email?.type == "pattern" && <span style={{ color: 'red' }}>Email chưa đúng định dạng *</span>}
                        <Controller
                            control={control}
                            render={({ field: { onChange, onBlur, value } }) => (
                                <div className="item">
                                    <input
                                        onBlur={onBlur}
                                        onChange={e => onChange(e.target.value)}
                                        value={value}
                                        placeholder="Mật khẩu"
                                        placeholderTextColor="#888"
                                        underlineColorAndroid="transparent"
                                        type="password"
                                    />
                                </div>
                            )}
                            name="password"
                            rules={{ required: true, minLength: 1, maxLength: 50 }}
                            defaultValue=""
                        />
                        {errors.password && <span style={{ color: 'red' }}>{requiredMessage}</span>}
                        <div style={{ display: 'flex', justifyContent: 'space-around', alignItems: 'center', marginBottom: 20 }}>
                            <div style={{ display: 'flex', alignItems: 'center' }}>
                                <input
                                    type="radio" name="gender"
                                    checked={gender}
                                    onClick={() => setGender(true)}
                                    style={{ width: 15 }}
                                /><span style={{ marginLeft: 8 }}>Nam</span>
                            </div>
                            <div style={{ display: 'flex', alignItems: 'center' }}>
                                <input
                                    type="radio" name="gender"
                                    checked={!gender}
                                    onClick={() => setGender(false)}
                                    style={{ width: 15 }}
                                /><span style={{ marginLeft: 8 }}>Nữ</span>
                            </div>
                        </div>

                        <Controller
                            control={control}
                            render={({ field: { onChange, onBlur, value } }) => (
                                <div className="item">
                                    <input
                                        onBlur={onBlur}
                                        onChange={e => onChange(e.target.value)}
                                        value={value}
                                        placeholder="Ngày sinh"
                                        placeholderTextColor="#888"
                                        type="date"
                                        underlineColorAndroid="transparent"
                                        max={moment(new Date()).format("YYYY-MM-DD")}
                                    />
                                </div>
                            )}
                            name="dob"
                            rules={{ required: true, minLength: 3, maxLength: 50 }}
                            defaultValue=""
                        />
                        {errors.dob?.type == "required" && <span style={{ color: 'red' }}>Hãy chọn ngày sinh *</span>}
                        <Controller
                            control={control}
                            render={({ field: { onChange, onBlur, value } }) => (
                                <div className="item">

                                    <input
                                        onBlur={onBlur}
                                        onChange={e => onChange(e.target.value)}
                                        value={value}
                                        placeholder="Số điện thoại"
                                        placeholderTextColor="#888"

                                        underlineColorAndroid="transparent"
                                    />
                                </div>
                            )}
                            name="phone"
                            rules={{ required: true, minLength: 3, maxLength: 50, pattern: /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/ }}
                            defaultValue=""
                        />
                        {errors.phone?.type == "required" && <span style={{ color: 'red' }}>{requiredMessage}</span>}
                        {errors.phone?.type === "minLength" && <span style={{ color: 'red' }}>{minMessage}</span>}
                        {errors.phone?.type == "pattern" && <span style={{ color: 'red' }}>Số điện thoại chưa đúng định dạng *</span>}




                        <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }} className="btn__login-hover">
                            <button
                                onClick={handleSubmit(onSumbit)}
                            >Xác nhận </button>
                        </div>
                    </div>

                </div>
            </div>
        </>
    )
}