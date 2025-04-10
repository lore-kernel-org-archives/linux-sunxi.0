Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CEA20468B
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 07:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269076; cv=none; b=DFpfYwVpXCrsk9lmeaVaIP9a+Yz9OBjQaZu0KMS3VLpiJchJWUlWci+iVScvd8uMeXGr4/Pg8eshibdKFWB7N06936VnOgVKTw+lAUttCJGxVaP24xCGmlAyx83+rgtLyb/82pvDJ3Yhe1But3FDzR0DIpXJAnEMxUV9myI8SlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269076; c=relaxed/simple;
	bh=QWFTn8e6Tw9PB6UdhP/vuJANK8d0LAKdYBvRrEcb7Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h8k0KvAjkCGkRXObi2fRY8xNeRedItAuJfQaArKoYwsdaFnRvEa2Bti/gZWPHAFRXyIsjsQb1rmEFqAtVW2iC3FcHHsmnw9LkDTtEXRRVMQUVIMd2GxNKiTNxHuc7VBzQQ0Y5gmBitIMYjSnbvD4lKlUeWW1FwVsOl6BCowvLYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwaiwelY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwaiwelY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso207219f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 00:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744269073; x=1744873873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gm40axamLUXAYbK4VgJ5ujHVXyS2R37tibfMnUuA7+0=;
        b=FwaiwelYhXm/p6a6HImZMtias2tXpIZQDwE/pLBCxp/SvfB3oZSUTN6BAzP9oRPu3Y
         2aHyLLeiegjtjO1CdpcmLW8vlXZgnSQt6evIlgdORQyU45XmRF3mhI2ERYYf/s8gaynZ
         EQJKKoxhbQMM5xDu9WwRGkX0JI52VnCKhH22Mu4POKNwjk2vIuRNvCYZK9V94zzV2bb1
         i521R+08ITMlh4dDuiHUYZtA3oFTg7qkjdIC/UgXaIEZzyt6DGaRcL5biZPG+OeQzOGz
         cla+CE/+G16C3R65O3fd01s/wOL4Az5ClapFgMTorN0PN1korWnPFstGCfHPX80Tea5W
         rJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269073; x=1744873873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gm40axamLUXAYbK4VgJ5ujHVXyS2R37tibfMnUuA7+0=;
        b=igov1h1/HSXDY6ueKharxnAh/kWKnFbqbqWxnULo20/5zRzglzfwRlZsR1Q1ZGjR3Q
         eypxANVdM3mGzPnXJFm7aJv1qYbkYVJIOPTtvoRPLbjKz4UJHHVoIoRlXd8xHRkS0+Yk
         Q2IJA1MBYg3rvRRgBi7H2cezM7222pVa6uRi1naaU4JT6WNwkmNWbyZjW25WA8cr0Lq1
         o0rBh/KssYXPMIspVoee9U32J2l5NeOyBwhZE//9RsRTmiu2nBl5+XO5zwT+SlSMDoEU
         uLSkgzmoguqLDxES9HQJ4srzaopXnZpo+dbxQ1QOwCrvx3N9qDb0bYaRb9XfPTuQ9a00
         P+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVh7ucCfwRDtqCLwITb3u8X2TFX1OSBU+AR3SeF/NRS0wqiuMn5rLMi/vH9mjwlCnvTCrjKUMRtkvE5CA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrYM3A5Y5lztDlAkffX6gQhHQw30sFizb6IdGJ5r3k9y+/kfZu
	vxSF4tYWDbn7Sx42/kP4jv8oDCshbtk4Ay34KuyZ3kp8prqUC51K
X-Gm-Gg: ASbGnctfG0h7pMegPRw/CMY+rLmDslBdkgHl1wPpCOOFK5ddq4EQ0nHLaMs2TJfebRp
	7u7aekTVpQSeXUq4guvT8SSbizwBTq5Tm7rlrU64pIIYi0GXa+GyDTpGiZeou8KYaDhZ+d5MeUZ
	U/7UOnYoDiqCr6hQ9wfgXJpBSANSgFyIoGulM30yuLyDUZeX3KPml02TqTmGmI2lrb3kz9SFoxg
	jyym48ksl1LfWKMmGN/ib70EWcrV2aBWUHUgjtg86RygS6Jc2bVpUh3L1Jp5MsTfI2gtFIOsFAI
	jBzVJlU9cDjaOaTgMl2JqHb23oESScq9yjKfRlySBk7QFkG36iXhBvGE7BkGwqe7qiWQXGoGNCB
	E6hTOM223eRgDv4CSgz4D93fCy3I=
X-Google-Smtp-Source: AGHT+IHrN6rHPw+GJiETlW6P3yjUvx/uHLNEZzXOmGW7XWou72sPe9TxazQFSE/xBl1lgbKeF+AbCA==
X-Received: by 2002:a05:6000:1ac5:b0:39c:1f19:f0c3 with SMTP id ffacd0b85a97d-39d8f4e2467mr1081126f8f.46.1744269073137;
        Thu, 10 Apr 2025 00:11:13 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0cebsm3863059f8f.61.2025.04.10.00.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:11:12 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Olliver Schinagl <oliver@schinagl.nl>, Iain Paton <ipaton0@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Paul Kocialkowski <contact@paulk.fr>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Ian Campbell <ijc@hellion.org.uk>,
 Adam Sampson <ats@offog.org>, Zoltan Herpai <wigyori@uid0.hu>,
 Siarhei Siamashka <siarhei.siamashka@gmail.com>,
 VishnuPatekar <vishnupatekar0510@gmail.com>,
 Rask Ingemann Lambertsen <rask@formelder.dk>,
 Aleksei Mamlin <mamlinav@gmail.com>, Peter Korsgaard <peter@korsgaard.com>,
 Michal Suchanek <hramrach@gmail.com>, Icenowy Zheng <icenowy@aosc.xyz>,
 Stefan Roese <sr@denx.de>, Phil Han <pengphei@sina.com>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Jonas Smedegaard <dr@jones.dk>, Jaehoon Chung <jh80.chung@samsung.com>,
 Heiko Schocher <hs@denx.de>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 3/8] phy: sun4i-usb: Control supplies via the regulator uclass
Date: Thu, 10 Apr 2025 09:11:11 +0200
Message-ID: <2983258.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20250409002036.12212-4-andre.przywara@arm.com>
References:
 <20250409002036.12212-1-andre.przywara@arm.com>
 <20250409002036.12212-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 9. april 2025 ob 02:20:31 Srednjeevropski poletni =C4=8Das je An=
dre Przywara napisal(a):
> From: Samuel Holland <samuel@sholland.org>
>=20
> The device tree binding for the PHY provides VBUS supplies as regulator
> references. Now that all boards have the appropriate regulator uclass
> drivers enabled, the PHY driver can switch to using them. This replaces
> direct GPIO usage, which in some cases needed a special DM-incompatible
> "virtual" GPIO from the PMIC.
>=20
> The following boards provided a value for CONFIG_USB0_VBUS_PIN, but are
> missing the "usb0_vbus-supply" property in their device tree. None of
> them have the MUSB controller enabled in host or OTG mode, so they
> should see no impact:
>  - Ainol_AW1_defconfig / sun7i-a20-ainol-aw1
>  - Ampe_A76_defconfig / sun5i-a13-ampe-a76
>  - CHIP_pro_defconfig / sun5i-gr8-chip-pro
>  - Cubieboard4_defconfig / sun9i-a80-cubieboard4
>  - Merrii_A80_Optimus_defconfig / sun9i-a80-optimus
>  - Sunchip_CX-A99_defconfig / sun9i-a80-cx-a99
>  - Yones_Toptech_BD1078_defconfig / sun7i-a20-yones-toptech-bd1078
>  - Yones_Toptech_BS1078_V2_defconfig /
>    sun6i-a31s-yones-toptech-bs1078-v2
>  - iNet_3F_defconfig / sun4i-a10-inet-3f
>  - iNet_3W_defconfig / sun4i-a10-inet-3w
>  - iNet_86VS_defconfig / sun5i-a13-inet-86vs
>  - iNet_D978_rev2_defconfig / sun8i-a33-inet-d978-rev2
>  - icnova-a20-swac_defconfig / sun7i-a20-icnova-swac
>  - sun8i_a23_evb_defconfig / sun8i-a23-evb
>=20
> Similarly, the following boards set CONFIG_USB1_VBUS_PIN, but do not
> have "usb1_vbus-supply" in their device tree. Neither of them have USB
> enabled at all, so again there should be no impact:
>  - Cubieboard4_defconfig / sun9i-a80-cubieboard4 (also for USB3)
>  - sun8i_a23_evb_defconfig / sun8i-a23-evb
>=20
> The following boards use a different pin for USB1 VBUS between their
> defconfig and their device tree. Depending on which is correct, they
> may be broken:
>  - Linksprite_pcDuino3_Nano_defconfig (PH11) /
>    sun7i-a20-pcduino3-nano (PD2)
>  - icnova-a20-swac_defconfig (PG10) / sun7i-a20-icnova-swac (PH6)
>=20
> Finally, this board has conflicting pins given for its USB2 VBUS:
>  - Lamobo_R1_defconfig (PH3) / sun7i-a20-lamobo-r1 (PH12)
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> [Andre: use regulator_set_enable_if_allowed()]
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


