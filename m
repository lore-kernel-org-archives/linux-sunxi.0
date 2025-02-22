Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C727207E1B
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740221086; cv=none; b=EoQi3Amd0+6+8EcrqKQdRTzGHF5kkMgMBin8G6dV5XdnGHwTXXBIi5OiDevhMowhwWaJ2JYZsTCHU4EH6cOmby5qfuEjv+G4beN3jBiYP1G7jxc2n/EA9qHtL2/hS90hhWvZBM/giwijOjvKlKSpaiJbAQiSqLS6h+FZ/kAgqwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740221086; c=relaxed/simple;
	bh=ZkSYuU2wPBZsc0CMDXq4Db5mtSgXumjkBjdN1jIn1FA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=egDN5cqSffwi0pmql4pahLH07akWg7mo/P7iWQ3cjSmTcKt3l5cKvyCz0XJ5Q580GBM3AxX4Iz1bY1w2PxppluzMBCXz8jGOd/Jhvr0r48pStKVsk2h1P7q3btpP5sVTBg3TMnNDytaJ6Jah3AYh1bwKSGRtn/WvQyn/9wPRABY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYeACGgn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYeACGgn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so28025665e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740221082; x=1740825882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kln87c/5kKVDMW1BPsIyv6Xt4UdEnHbw8gswLoQRLeM=;
        b=gYeACGgnTVaK9HGI/Z+/x1rIj00fF+bQQ32N7Q9TKtaxSDxDZSq1jrzQsKmt6PvdsX
         PZtkzo61ERDtpYqcOETZKTl8fnIQ+3V5T48wsHwsdWRbGkiKSeqfohIt+5AyRvZyFI3Y
         m07ZPeo3aZ3JPcw+jpRcpgVK5VUxO4xsSSKIHkRlN+jFwOWlOIx5XLAq1flQmPYlVyrJ
         CaObDToK0RtxYQ8JHUKG8jc4k5lL8sm2rrquh/USve+wJnhecuXKPBa1OB2bw2ShTack
         g5FILblgVHlvdUAOXmFJMgzWpM+SUOxSrX4+AdJHLM6DyPqlOIIu2X3aN6HOz9GJHLfo
         mCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740221082; x=1740825882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kln87c/5kKVDMW1BPsIyv6Xt4UdEnHbw8gswLoQRLeM=;
        b=WmWf8CjXHihh7wvHQ+nGnzivzJXoH6FcEcU1LY1DoiasEwzE4Yz6TMxRogL9he7AyU
         DsjFNFhjpVFHvjP00NLwVdxI82l1tR17T8v6eVHRQ+uhKmRS4jcNqyKwR1CeJmFtE8qI
         qdhRE0+krUj/s/i3WZVFhUACKyre+BrRoUzcOIYfHoaVjJPBM1wNm+M8R9oJb16Kobwz
         K/DErffAi8fi//sV7SfBlTq1wo9V3KDUxfG4ySJvQM9D8Cf81eQvBQZHIIZFMEsI0r9o
         MXuHd68zBUvjzUfg7m4zSaiAUUOeEcXwZ8JlLA43JtFlNfZAw+sqx8tyk3SGcVvDUJKa
         5cew==
X-Gm-Message-State: AOJu0YwNkOeuWzUNxUzEw4FRFIlLb4sn2NCdQRbRPbDEqTvR8BbHCujo
	4qiFT4DPJJKCCNHLwRTCa/0EARjsvxX5jobhd9mLhJck9blkpPYFhNz3trUE
X-Gm-Gg: ASbGncsnGqZMdE4RXszWOFlqfFstJvKjYcuklpqb2MdZHY/I7YIT0Hmf9s/TXfWkWim
	qDUHT49nPhPEr8d/Rx1SFg/Tv1gQry+T4eNnrnJzzP6YicZQ202r9T1Z1k0yAmTuANs/aeLZZdb
	J8CCP8E1raeIPALezidwOTU1XPk7WLpYWAW8zUaXHvjXfcyVgMjY3hfyE5uCqaGX8dDSic+9IKn
	cPPsJktEWGGaIeXD/Db1ElTza88gMd2KfQ7BEJN2x4ajCy7MCcpsfQhTMHuJ1pZ7Tzd1KY5Eyrw
	1WSPrICBci4whEoSwVaoyN4WQCiqyKQJf6fXe/F7wXuG7SJBVmZ/M/FzBlRaUAfNNZsqeE9ycTF
	lhA==
X-Google-Smtp-Source: AGHT+IGlk5s5bSykqpq59rfKC/AkOqaYQYpG5g3eNqje/wCAOIpYetAD1JWu0hEmADBRto9+cG1uvA==
X-Received: by 2002:a05:6000:401e:b0:385:fd07:8616 with SMTP id ffacd0b85a97d-38f7023e7abmr5279379f8f.0.1740221082457;
        Sat, 22 Feb 2025 02:44:42 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b036756csm43118085e9.31.2025.02.22.02.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 02:44:41 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, samuel@sholland.org, wens@csie.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject:
 Re: [PATCH 1/4] arm64: dts: allwinner: h700: Add MMC2 for Anbernic RG35XX
Date: Sat, 22 Feb 2025 11:44:39 +0100
Message-ID: <1884930.atdPhlSkOF@jernej-laptop>
In-Reply-To: <20241018160617.157083-2-macroalpha82@gmail.com>
References:
 <20241018160617.157083-1-macroalpha82@gmail.com>
 <20241018160617.157083-2-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Chris,

sorry it took so long.

Dne petek, 18. oktober 2024 ob 18:06:14 Srednjeevropski standardni =C4=8Das=
 je Chris Morgan napisal(a):
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add support for the second MMC slot on the Anbernic RG35XX series.
> The second MMC card is connected to MMC2 (WiFi if present is MMC1).
> The MMC logic is powered by cldo3 via the power domain to which
> it is connected, and also has an external 3.3v GPIO controlled
> regulator required for functionality.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 27 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-20=
24.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> index 80ccab7b5ba7..e2039fd76b3d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -18,6 +18,9 @@ / {
>  	compatible =3D "anbernic,rg35xx-2024", "allwinner,sun50i-h700";
> =20
>  	aliases {
> +		mmc0 =3D &mmc0;
> +		mmc1 =3D &mmc2;
> +		mmc2 =3D &mmc1;

Please drop those. As a rule, we don't have it in any DT, since there are m=
ore
universal to identify root partition than a relying on device order.

>  		serial0 =3D &uart0;
>  	};
> =20
> @@ -175,6 +178,15 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
>  	};
> +
> +	reg_vcc3v3_mmc2: regulator-vcc3v3-mmc2 {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-name =3D "vcc3v3-mmc2";
> +	};
>  };
> =20
>  &cpu0 {
> @@ -186,10 +198,21 @@ &ehci0 {
>  };
> =20
>  &mmc0 {
> -	vmmc-supply =3D <&reg_cldo3>;
> -	disable-wp;
> +	bus-width =3D <4>;
>  	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> +	disable-wp;
> +	no-1-8-v;

Please leave properties in same order to minimize patch size. From
what I can see, only above property is added, which is not needed anyway.

> +	vmmc-supply =3D <&reg_cldo3>;
> +	status =3D "okay";
> +};
> +
> +&mmc2 {
>  	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
> +	disable-wp;
> +	no-1-8-v;
> +	vmmc-supply =3D <&reg_vcc3v3_mmc2>;
> +	vqmmc-supply =3D <&reg_cldo3>;

Is this another SD card slot or eMMC? You configured it as it would be SD c=
ard,
but mmc2 slots are usually used for eMMC, which needs different configurati=
on.

Best regards,
Jernej

>  	status =3D "okay";
>  };
> =20
>=20




