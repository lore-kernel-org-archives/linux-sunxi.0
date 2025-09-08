Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201F92EBDEB
	for <linux-sunxi@lists.linux.dev>; Mon,  8 Sep 2025 22:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757372272; cv=none; b=HDM4Yv3q08f7uaJDtFL9gphMlrUpUGjIFn9851sHFYQLsUOj4biHrDtYCV1MZhtw9p7h9azVuTeaRFTdt2H7sXlIJXUbXzKJN5+E3uYqu7GWS7eK3o6NNAajIs21Yo/xh5KX3VPkSQiWMzx/FNBjeRNpk/pskg4uvNy2T7ms1hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757372272; c=relaxed/simple;
	bh=1jo1Vv0Vs8hahvZP85nSL0Whq/0i4fskm9cB+6S7Sb0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DrDo4rGWFyujbrktezThUxVWZ4cybbanSMRSUlEqQ3OHAT5DvTqhOKtj611MlO/QL8cwWDnRmIOFmpVziXUtalKTruH5HsBvaT8QiE+WRpELRqLWTtnNg4CrWLuVy878r/jQk6d3TM1Lq/SUO4RsglBniQD2Zi3bFrAisSETBaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAB7E2Oa; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAB7E2Oa"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3e34dbc38easo2046417f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 08 Sep 2025 15:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757372268; x=1757977068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUvupcsRCkQfs+P8J05KpMp2C799/IJHD4VTsiVCzQU=;
        b=UAB7E2OaaFg/RIyUhz62JqBIAoMWgieL1DzXaJtvXvxtbpZ6ObbGW6jnjyhX3H+cKX
         TjvH6qfDGE7YZftfciNtPQQMLtCnmZUNteeFPLAelbDkCYFgWj2+yL0vbPPuNdvtzEXs
         hEACrnrx0ztTNGN8sJ7V2SeQBIwagih6DhQVZGSqc72xO4jk7gqi7W5O4EkKNdqSU54c
         JpHnOlmrvEwEu+QbNNYYzF2TpjasFVLCby+GTbVbM8LAnPelmN4bJh1OrEwrL70eaKzL
         48GnqmPw2Jdf5cAAtvTS/TjUkaSiAgBnyHSfmLsTKv+pDa6PyCgasfVv9AQytL61+HMI
         0n9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757372268; x=1757977068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUvupcsRCkQfs+P8J05KpMp2C799/IJHD4VTsiVCzQU=;
        b=FlAiOLRhg3lbFjMVMxCJIs47a6Ni0QnHxofZhIKZhW1M8g2a0VYmsRKVUsYSyEjMjk
         vommK5Nkx/UqCSSiJLziHwbxE5/8rSNDALoW2SKr5h8h76Oi6EuDwK7wg6XGUrc+84Ud
         jkiJvmrbax1MMifQ+JEyCAJTeP5RJYa5NkJ7RjSCY+JHpho3OVyJfY2OLZf9BFD9J6uc
         kx0fGVGACA7zBdqJwepiDrHiA/Pgnun9Ey8BAJKiQRq3wbkYLgwjRQDP08Xd3R8Y/Gu6
         OXQGRlORnQZUH002TDrgwZV/Qxbw1GKR6K3X7kBjvqO4JsH6zfZEYSfz3w56VDz6g13a
         qcyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7wEceT9q05t7reqw6oOc6IaS/gyA2syK5TOe7Evpr2Pfi+OKtjOVzXUIhFzidChmwPwzV73iwegVzxw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6c8G6CJieJ2P4dJ/myQ89FABrVAOjmTSUbNa4is5nXkUXNbU/
	k2mStXPjcS9TzKrNVY/xhfmFiQE0OhdmxQ/ZSvjxlJEczCHUA20hymw1X++6Sw==
X-Gm-Gg: ASbGncsXp1Pmv3Ct6XEBrtLIyw4KQxREwmdjJk61G2pbGElcY6+ZUayRrfMXiDzO0Ig
	EnQH/gD1DRF3pQiijM+dDO9P7JzAb9NsdxaOblJQxZzbPCR8Qe7Y8BcxHXNHIQ6/po6KGZr8qsl
	I9tISZA079L2qhMF2WuC1a9//trQ3q+/8IEv4Wx8UIHSKQTHNaxEFonCuZCYlXNUdiuLUyCBmcK
	e1eHkafPb5lky5KVC6H5SK8mdXyGaIgDRTn4QNTe/HYQrqU7UMy3mBssCVmJwsQMoVKib68rwyz
	/fdCpKRQUqDaz4cxlzSnjewFnPQTXBfJs0uBg5jMX+pLX7KXvINTdZN+UfBYDDG88+tgoSOmdwv
	DmDuKtBUcekQ71gP/yLMnAXAMoilkh1Kt5Z41e1ij9pndvVXDX4o1ukWltWS9bPmfEGuN7J42D1
	kZ/pmp2oQ/
X-Google-Smtp-Source: AGHT+IHNyN6qy4Z/EdCypF+HkDEY2JT93OD46/zVWVzUsfkBn/dv6BYtFe56OQfZXkQXUnUBziSXtw==
X-Received: by 2002:a05:6000:2f87:b0:3d9:2fa8:1009 with SMTP id ffacd0b85a97d-3e64c3acf34mr7435111f8f.45.1757372268165;
        Mon, 08 Sep 2025 15:57:48 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521ca2aesm56321f8f.26.2025.09.08.15.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 15:57:47 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: Re: [PATCH] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
Date: Tue, 09 Sep 2025 00:57:46 +0200
Message-ID: <12736197.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <5617fd78-32aa-44f4-9f9c-16349b3f8450@wp.pl>
References:
 <20250818163520.1004528-1-olek2@wp.pl> <2012341.PYKUYFuaPT@jernej-laptop>
 <5617fd78-32aa-44f4-9f9c-16349b3f8450@wp.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 9. september 2025 ob 00:11:46 Srednjeevropski poletni =C4=8Das j=
e Aleksander Jan Bajkowski napisal(a):
> Hi Jernej,
>=20
> On 9/8/25 16:45, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 18. avgust 2025 ob 18:35:13 Srednjeevropski poletni =C4=
=8Das je Aleksander Jan Bajkowski napisal(a):
> >> This patch adds support for Ethernet LEDs.
> > How did you tested this? According to linux-sunxi wiki, this board has
> > RTL8211E, while LED control is supported only with RTL8211F driver.
>=20
>=20
> For testing, I used OpenWRT snapshot with kernel 6.12. OpenWRT backported
> patches from kernel 6.16 that add LED control support. Realtek RTL8211E
> supports LED control since commit:
> 708686132ba02659267c0cebcc414348ece389a5 ("net: phy: realtek: Add=20
> support for PHY LEDs on RTL8211E")

Ah, I haven't checked the latest code. Alright.

>=20
> >
> >> Signed-off-by: Aleksander Jan Bajkowski<olek2@wp.pl>
> >> ---
> >>   .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 20 +++++++++++++++++=
++
> >>   1 file changed, 20 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts =
b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> >> index 0f29da7d51e6..7688f565ec9b 100644
> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> >> @@ -7,6 +7,7 @@
> >>  =20
> >>   #include <dt-bindings/gpio/gpio.h>
> >>   #include <dt-bindings/input/input.h>
> >> +#include <dt-bindings/leds/common.h>
> >>   #include <dt-bindings/pinctrl/sun4i-a10.h>
> >>  =20
> >>   / {
> >> @@ -132,6 +133,25 @@ &external_mdio {
> >>   	ext_rgmii_phy: ethernet-phy@1 {
> >>   		compatible =3D "ethernet-phy-ieee802.3-c22";
> >>   		reg =3D <1>;
> >> +
> >> +		leds {
> >> +			#address-cells =3D <1>;
> >> +			#size-cells =3D <0>;
> >> +
> >> +			led@0 {
> >> +				reg =3D <0>;
> >> +				color =3D <LED_COLOR_ID_GREEN>;
> >> +				function =3D LED_FUNCTION_LAN;
> >> +				linux,default-trigger =3D "netdev";
> >> +			};
> >> +
> >> +			led@1 {
> >> +				reg =3D <1>;
> >> +				color =3D <LED_COLOR_ID_AMBER>;
> >> +				function =3D LED_FUNCTION_LAN;
> >> +				linux,default-trigger =3D "netdev";
> >> +			};
> > Schematic says LED0 is "Yellow" or Amber in this DT. So LED1 should be =
green.
> >
> > Also, I'm not sure if trigger really needs to be added, since PHY netwo=
rk
> > will set it as such.
>=20
> I think there is a mistake in the schematic. Setting the trigger on LED0
> illuminates the green LED. My tests found that the netdev trigger isn't
> set by default.

Ok.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


