Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35D538B7D4
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775538; cv=pass; b=JE9EIs1RiUeKGiPKF1OPKfdQdjMsecp6PEFq4gBNtLdkhHlpMZBKQzmtc1LsOEH2wM4Rt3QzsnONYTUgtTejW6M8A6YmJzmkdsXL5Ehx4Yn9htkMdMcZIbB7tFmwPv4xoklZ/Nd9xzET3NSzZvIwRsR6IQjdccLXSa8QBjTleXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775538; c=relaxed/simple;
	bh=pVJ/u9SrHtpIYcpsDllTKqpayBtCBNOqrDA3wdvqLR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZtsogAo2dTnpnTxvM5+LaJbSUjN3kC7RvmcksJdT3x+yscsNIJO0Q/4VlILIABlAsQM576xu2dbiri41HfJbvwLVqdvWnc4l8Z5t2bivMVxxV1HqYv6pupja8RYU3AKhH1p+d+VUuX587dxCZNc7dXbOmgVDeBKqmARqbb4rAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKmda6lI; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKmda6lI"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-977bc1cfc6fso889552241.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:45:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785775535; cv=none;
        d=google.com; s=arc-20260327;
        b=B/Nu7C5AvuUvwYbEQjgKdC2x41wnK/fbwSkFjZr9VET7YD+s259e0XhiXYOKDSg7Fi
         ARYBuGAcZz5+b3gp+EQcVHGrC5iQqeAeh9jYolSjZ0v4em4ooEfFnKNreH8MVKoNYF4m
         lzDyiWpLKIHI/nSeAZVaw+m3ardQaB2nzoLTrEHUw0ub/QwcsYDHUv2zDh9kwdEQsU2x
         b0T9ZguVyW5qq3xSUFLDI3qBg0epvR7w7Rz3vLPRFjwGXwAD19A1CMUA7yWRHcM4cg/6
         X38/xcoUxEk8pemJQvdLadR+1x/YGFzF0AvJjeJcDzDhF1NhXIIqZ2UqyLEwAyOtAc4f
         QxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=niqvePJlDSQd28Qyc7y5gE/vwAYMmaOcsvRZCG9PwY8=;
        fh=dcwOP2HX33dW4l8q0571felKOAV4GNbkDAzAA4/r6tk=;
        b=FoFNaA/NOrI/w0kGWovI5+Udgd4N4TmW6L0mooSBt4MbkP9xjFBAkduU7j33feNATY
         rV6CKT+HWddv1OOwV3u4npXPcWBTGVFrt2MyB/rvI1dg5Kj31RIHCmW6poR+AsnNq7p2
         usm/Noe34o3AzBjPrBTMVjRnE2GAWUKu7fN2DSyvEF59JoT/YxhY9CV+4QatAf1XDVig
         qvoinO1HgSsMGsyOnCZqsW+WirDaS+Lw5n09zrECBbVqmAn+9qA1RtYXsl45jRJmfwrI
         yoLbI2K7pbxLkWpj3q8Uwz9adR0sjOP/xk2pI2tYI28zKD7O26tmanvKkHwdfk+PFGVb
         JWMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785775535; x=1786380335; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=niqvePJlDSQd28Qyc7y5gE/vwAYMmaOcsvRZCG9PwY8=;
        b=fKmda6lImSp0FCSy1CHg9tk8w1tieUXduSW7uRKmi6vNWKbMJPkg0li8BBydJxV8+Q
         D8WBWNOYV+mKI1/9aqfYF9JPcjIqkkGNzWsQq7NjZCPMDQ18bvniHkA+WFhMyZYclpSi
         VEeUbHu0yqJf6Z/5UWK7ndgiMvV76oRmSqCPCJJOpNtu0TP9UwrM1pf2JA6ouErcV0Hx
         CCmLwqzFJD6qAwZl6S/vGhCcB51QcpO1nOG9CsBn6ZCeX/fK0AQBys2YNqr/ku213sCM
         2Tfb/rSXYNwE8PMaNgQVj4BP90FViYDcTed1QH9x8tV3iVW7uBulpBxvDWhwH9hJH6Ed
         SmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785775535; x=1786380335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niqvePJlDSQd28Qyc7y5gE/vwAYMmaOcsvRZCG9PwY8=;
        b=Wb+wInow7cRmdCcc9c55/MBubvvM6tqK8IGgduPOrRRYPYOTl5OCpfsxaevTTfM1eE
         0dgOpto+1DT5MdO94CjcRQIExj/Yoa0YJ67FjXLzpCqEp6kBslCJhNJbfna1/zk5L7Kh
         ANWHIU7bv6TfsTnF0Ebh7+gsGCFPnkTpZyjvhvIrMCK0rL0fY5OyAcfq5VKG4GEhUCCx
         tj0ETTpvsjZcjx9y5nCqaW+qpTwRXLVgWanZt888/PaPRma6uxxAuO/H71x6TjrjkCHK
         NsdtJgmNynAzAofQdKXSEs+t82kpbryI6HTNIK8AqLc/0o+Wb4hGn37J7rzVtcdeq4ZB
         ck4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqA8i29TSL708l2g7vsQTJSTRr8DQxg7bfIMzT1/ewom1ysVDtykkw/uzAUsZAkMB8xIbmR2hvoGtWS1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlMnPLyThXxHw+AU95+5xEy82Fjjv1Ct2MzRLLwlRffCAHRzlE
	VBj74eqXPGolAVMEWpQ10PNdrtjYDzujXqSdH1vEikZqXJNjaI8qvbS6wvYO0+ESGfNHF6z/z6x
	KL5X+/F1wucx2mxvqQkw/iA55omomY0o=
X-Gm-Gg: AR+sD13GY9V4qYTd1DMMdXZd8TKIG7kTleOvuZ5gHp0oVTRcm5FRnL2EC/LYUOYkqrV
	FdhqnBMFQjKl6p4yXDYdqdP6qcl11mNLVeq3HDO8laTkrUIx5pN5hDOIaL3Jjs122+U9cifEbEK
	/t/+m1b6ZvPk4yB89myJSO/B6yKWQdJghmSv5DUJX7H3t79N8En+OwZ2XGpJIn031Psycey+WAg
	O4C7372l3Djglkv8oZWuwbyTrKK/HkAfEVwPpCmn4MOXZvy77H+LaOjZYfx1ufBvhouYGsVPMnN
	P7wkXeUuoO4dmOc/FWgeFBl8FMNQgECdPVo4Lk9qIxmmz359Xu3GPIC/OPU+70AMnPocveUmsdL
	OI+pJVtlPSN/RBnBGLCFDwIZZJTv4pG2bYzSMYMgCUlJJ98Uw95jjRO+PvIJCuzSH7hDH9vFCa7
	qBAbMNtyODODplWTUsZ2Pm6dwt5b5xKFFjfp99
X-Received: by 2002:a05:6102:5e82:b0:73a:128c:4e3d with SMTP id
 ada2fe7eead31-75b22b6375cmr7983333137.8.1785775535469; Mon, 03 Aug 2026
 09:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com> <2c0210b3-2c68-41f1-aa33-3f1693454849@lunn.ch>
In-Reply-To: <2c0210b3-2c68-41f1-aa33-3f1693454849@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 10:45:23 -0600
X-Gm-Features: AUfX_myHhqSCOlS18NU3-rnIJB_yJDCs5Z0LNUdIv6o7tNasY8YkhUjPJd2Ilvs
Message-ID: <CADvTj4pfNFVGrQV86T7X+nZQYUamxEYLLWuxVXk=av0da_XocQ@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:18=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +            ethernet-phy-control {
> > +                compatible =3D "x-powers,ac200-ephy-ctl";
> > +                nvmem-cells =3D <&ephy_calibration>;
> > +                nvmem-cell-names =3D "calibration";
> > +                phy-mode =3D "rmii";
> > +            };
>
> What do you mean by an ethernet PHY control?
>
> I assume this is not an actual Ethernet PHY, but some control logic
> around it? Where is the ethernet PHY itself?

Correct, this is not the Ethernet PHY itself. It is the package-specific
sideband control block that must be configured before the normal Clause 22
PHY registers become usable. For AC200, this control block is accessed
through the parent AC200 I2C regmap. For AC300, the equivalent control bloc=
k
is accessed through a separate non-PHY Clause 22 address.

The actual Ethernet PHY is a separate device on the MAC's MDIO bus. The
shared PHY driver for that device is added in patch 16:

https://lore.kernel.org/linux-sunxi/20260802-submit-acx00-of-dynamic-v1-v1-=
16-0a53cd9e21cc@gmail.com/

The later board DTS patches instantiate it as an ethernet-phy node beneath
the MAC's MDIO bus and reference the appropriate sideband control provider.

>
>        Andrew
