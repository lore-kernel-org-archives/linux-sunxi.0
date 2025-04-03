Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D712512D7
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Apr 2025 17:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743701970; cv=none; b=htpO+6HOUDTRyjdxpbb0WeVQP3T20eHgC3m+A5iZBbTrdnOf3kgYgTWnGYMqseH7zX3xgzB19h67aS+pgf8leivSaTeb0HT8wUUeysqZuPB4rlsjRlQKCb7XrJ3tYTr05BtasewkCyatl+aAnWokhAd178AmjrBOXwbFQYDUz3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743701970; c=relaxed/simple;
	bh=h6lDn2oRoZVQr2eL3ETbBPAyiqVUOXRCf4qhIrmhyHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhdLonmWRGMucWhSz9xh4KQs3bNhL9vyem0pdaVGQki/HJW2gDzCDY5i3B8OOd/R8ul8LgXgaM6tNPRZkOVK08yvwhu0ZNhm/nlJfPueT02Rf1FPr5eMTVQ8DU43+vChS5AnBimYr5WpGqCv28m26epvXYxs86jf1UFHTLY5BJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwZiYgBa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwZiYgBa"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so8202945e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Apr 2025 10:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743701967; x=1744306767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNO/JA0foT2DpdUYBUk7pcZAoPgEl1mlc8h7/c2UazE=;
        b=CwZiYgBaGbN4VZftSSKLsg7tscOuK4X5pwCatBS8c4q9VwqVDtJnVCEd4xmNFk/Bte
         ptip7DzPx0GbAqRP9SdWZjonxCbXKDosG4V0ydoHB8Z06xCfvHZ4poSlrZy6z79FilPK
         Ln9thFHwHPV/Bd4s2K/rczsLXyvCMbdTfiz+m1TNfHFBDPjBgxRoSLgV1XgP91z8ZWu0
         mweOvoc0OhNeVtHh0+/8g+Byubwz72sttb7A/JD3HY5ttoVe28Sv5M9VY9Zdb+lNecpu
         Nk7PQEcCAe1rlqDDSwLeSb/4WB8FAZgXBJnPe3c/AlZ8jZHYOwAOO2u3XYfLP872JSUA
         U5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743701967; x=1744306767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNO/JA0foT2DpdUYBUk7pcZAoPgEl1mlc8h7/c2UazE=;
        b=QP8iy1VsghHghtAThYERgKEF8q3diqnDU2xcnqetEbF7wcHmwe1h+kGNdn6/6unKjK
         880itGM+pa+8T6Vz7Ykk4+pbc+X2NeBuWl0myDubCA5hsc8d9XPjEMlhf20lV99asbZ2
         FKokLKgcBg8RboQuNLPLmjCdSNcxYA8s3EE5r297WQA6d4gH5n8lkv/HXQQMUPHSq+bI
         I+bid4hOQDZDI601ATRLsB6i1Qhjd8pckQnAXtyykLl9XRQMsfu+E680rCgsO3Ssrgau
         Ne9xzZAqO1fMYieA98c1TYgEWBfH246kcgi7cZOsZ+s7/02g8aHeP4rOFSCuOHF/AWn6
         YB+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXf0WoPQ1zZ5RtlwkRgK5uYmqAN45lemSY0PntbSsMbZjiYI9lp2I/7GNEzObBtDkmfGIOpRSxqC0TkkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxjXrbIJZk/hYOugV9jGtjAQnL8abMaNCXy5GIL5G8odEIO/vL
	MyxjkctkXJIOM2nX3WLeue/Uu8OtwWg0g25QVHzZAYb0F6Fv8Tf4
X-Gm-Gg: ASbGncv8K8TYyrKXMZ0G3ni/iFv0AW/9jVcEAntAtEjz6jQOfTtJsDsebJQCQu2fK5C
	p8/s4DcJhyPVFbFwHHVpi4C1cbRvLGMm2wcV0r5YMdrQRPy0Md0YSzmpWStl2+3tspeAXD7ZWM5
	/+/o2e//s4/pP9nDnHCZwnWqMbAUbU0K/TDARaO8ZkcBSvuag9jb6rgwCdcwfVGGWnN9NsKNf8p
	0LWvJX9bB+EMkHJfNbGAJFqZ3CMtgpBjeJ2RsdyswtDp3KXCeWXVxi9qF8Ls0WNXaSl9h+M/L9F
	tQvXrvS7tWefpepnt/XBhS9kp1i2f/AE8QKwBgah9wpCHcDZ0IILD5yo3Agbyr4Vsk95bTp/X6d
	tx5CqtIN/YmqnIh8Izv7N
X-Google-Smtp-Source: AGHT+IFMIi4hovLxofIkRnajXomszFrujt7/tyePth8kw2e++hEC+Kp0OE+ILwmXrxf3oLN23kvKDw==
X-Received: by 2002:a05:6000:2907:b0:391:4999:778b with SMTP id ffacd0b85a97d-39cb35bda01mr174975f8f.28.1743701966921;
        Thu, 03 Apr 2025 10:39:26 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096923sm2385018f8f.17.2025.04.03.10.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 10:39:26 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: vkoul@kernel.org, robert.marko@sartura.hr, shao.mingyin@zte.com.cn
Cc: kishon@kernel.org, wens@csie.org, samuel@sholland.org,
 zhang.enpei@zte.com.cn, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, luka.perkov@sartura.hr,
 linux-arm-msm@vger.kernel.org, heiko@sntech.de,
 linux-rockchip@lists.infradead.org, yang.yang29@zte.com.cn,
 xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn
Subject:
 Re: [PATCH linux-next 1/5] phy: allwinner: phy-sun50i-usb3: Use
 dev_err_probe()
Date: Thu, 03 Apr 2025 19:39:24 +0200
Message-ID: <2773791.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250402194203426goMMzm9R9_yQBb7SMNGj1@zte.com.cn>
References: <20250402194203426goMMzm9R9_yQBb7SMNGj1@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 2. april 2025 ob 13:42:03 Srednjeevropski poletni =C4=8Das je sh=
ao.mingyin@zte.com.cn napisal(a):
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
>=20
> Replace the open-code with dev_err_probe() to simplify the code.
>=20
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/phy/allwinner/phy-sun50i-usb3.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun50i-usb3.c b/drivers/phy/allwin=
ner/phy-sun50i-usb3.c
> index 363f9a0df503..b03faffc160d 100644
> --- a/drivers/phy/allwinner/phy-sun50i-usb3.c
> +++ b/drivers/phy/allwinner/phy-sun50i-usb3.c
> @@ -141,11 +141,9 @@ static int sun50i_usb3_phy_probe(struct platform_dev=
ice *pdev)
>  		return -ENOMEM;
>=20
>  	phy->clk =3D devm_clk_get(dev, NULL);
> -	if (IS_ERR(phy->clk)) {
> -		if (PTR_ERR(phy->clk) !=3D -EPROBE_DEFER)
> -			dev_err(dev, "failed to get phy clock\n");
> -		return PTR_ERR(phy->clk);
> -	}
> +	if (IS_ERR(phy->clk))
> +		return dev_err_probe(dev, PTR_ERR(phy->clk),
> +				     "failed to get phy clock\n");
>=20
>  	phy->reset =3D devm_reset_control_get(dev, NULL);
>  	if (IS_ERR(phy->reset)) {
>=20




