Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3B530BBA4
	for <linux-sunxi@lists.linux.dev>; Mon,  8 Sep 2025 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757339107; cv=none; b=oPPZDsE1UA54UB5CcSIJnIQD57hCiWlUSbQJhIgeHZvegjJN48kyTnubcl2jZIHrojmYhzd7KASyKg2wKvtsHl4vI97Kab8bmD96ZyKwPDskxdHbUYbLK2YKj/oDVdpoBCEIlSwwGMHWm6Ykrad6XN7wSsSBPXwYcihnQAiCTUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757339107; c=relaxed/simple;
	bh=6Exa49x2tTun8/GdPZIClkbq/hZZCYAZWPs6tflMRhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qhrmnD1+ozBrSw88N/WVUaR1/qFntyBnk8n/dOABmft85QfT/R/6UfIi4IqSFyRzSMC+Uu8Ivl7SzBgadlNtEQm55wjL7+hC1NC9DbcaiKtGeXdfdV3osIW3nOH69mOttH7FSM0NwOQfKC3+uFyxdtPiaZq+D/tZIRJAn/LnXKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ix0GGYGb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ix0GGYGb"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3e3aafe06a7so1922672f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 08 Sep 2025 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757339104; x=1757943904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa2FDEzfrHnj9/Bgif488Zx3zsoWnSpMm3bjoJ5kMkM=;
        b=ix0GGYGbRWvDQ9ri8FOfRm9UGsZFaHYkYqquCPnv9iqMhxnepR4IMwVKz8xgX8/Dvc
         VgmhGh58AjmC/wyPXx79DXLkuBJzqFFTlEouJm8XLYVfB14ssZLZE0VJREdcrunb8kGm
         Ps1InAMg1lpzX5VQn0Z+nGEJbGeyJaCSaECxfVx+5HVxYT7h163JHhrEb8yDUV75hUiJ
         igHhPdbRF2Kfhp7WEXNkRhgK3UXCKKqT0GqXe9XFi1blLU+mi46ZWfT9xy8MZg405JHH
         qcdozXsBPQaivJxgqxaO+JO3RzsIq4muVgoU3T2Ve/TlurugAgSICygf/EHi6Objf+Pn
         GO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757339104; x=1757943904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qa2FDEzfrHnj9/Bgif488Zx3zsoWnSpMm3bjoJ5kMkM=;
        b=MwFVLvZiml2aOdN6Mdhpas+9ihbXDarEugtki0d8AeoOsOhiUl2Id5jS/87tqkLcW0
         tABLH+IxhxxodDHe3IO1N4sVPT3mSI2MziHqQElVlLyHCiwxuWygVVdmmYkSJbI5cFW3
         xWToij+BnJyDHmAtJ/xdOhU6g6GVlQXvQsznAIUHznk7occp92WEoVoVFpJczkJJoKwu
         rDKPTjZzt1FjDU7AU5pPKmUbnxquVG3o1cmTiXKFTHBE3LJv/w1e0b9lQaTFWiPj01qZ
         mekzXKet1apJYrnVjxSrgHTGZMdb8Txu1tMBsYrYGYJGntm3SQzCDfLEzSoPovYLo6L0
         5b8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWp/yAk/P4/kw9kA9HPswYVyKjPAuYN/jEAdjZgWhA82jfybtVicdw2PpaucijFqwKjv3M36INm/OSF2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXm3aaNSQjFkWXjxO3aWq8ywFRIUkJjC/bFFm4wrQKEHCacG2/
	q3I9tS1SPa0zJ7OIktp6t4+JGP/6qlLH8UBupiFemgGZv2uTymDbOQtT
X-Gm-Gg: ASbGncsSaI7pJMPnPm8K+l2R1LmCi6BTpRlRPqkzrtWHnOEY8NmpKbviHhiw48eibbJ
	WL2LCAnXsmZJeYX8aHBmCwU6OFCbgg6svTmQjBImR91m6RndhhCDwwDh0IFmzlM9DE6mhMAm2lf
	o3COTqbOUL8gzvF7/UbDliDvbNvtj08BakmyygKAUBiQylQHEMlwYRTtnjgM/lhJXIzMWKAp2PL
	/rhVJ2ZSWxatRNTt05zsXh1GyGRuf7qwCfYDv46/riSJc6TmQmDJHzpuTY3JSun5pQMaEV8Z+rB
	ny1/IElUgHzMLX1W66eyfqahOPybW2C4SbD1Tla4LJtyzm0iMsN29V9gjjh3p/65UDCYy3Ze94R
	onDbyC8FBxKM16+Baiq/s7rcVVgLD5b+oRUw+i5i/efN+pHwB9NevmG0Nb31E9LMFCFBOWli1X5
	RtKhJJv0SetkjNzrIaXyE=
X-Google-Smtp-Source: AGHT+IF/bu6N4b17VGa4d32p6sVB8f7trrLvKQqSA5MvaDaYKtxhuslb1edIkbNaktRAD6ubBUZRfw==
X-Received: by 2002:a05:6000:389:b0:3e6:fd4a:940d with SMTP id ffacd0b85a97d-3e6fd4a9c30mr6459105f8f.12.1757339104123;
        Mon, 08 Sep 2025 06:45:04 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dcfc3e11esm96635905e9.0.2025.09.08.06.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:45:03 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject:
 Re: [PATCH net-next v3 06/10] arm64: dts: allwinner: a527: cubie-a5e: Add
 ethernet PHY reset setting
Date: Mon, 08 Sep 2025 15:45:01 +0200
Message-ID: <2795513.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250906041333.642483-7-wens@kernel.org>
References:
 <20250906041333.642483-1-wens@kernel.org>
 <20250906041333.642483-7-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 6. september 2025 ob 06:13:29 Srednjeevropski poletni =C4=8Das =
je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The external Ethernet PHY has a reset pin that is connected to the SoC.
> It is missing from the original submission.
>=20
> Add it to complete the description.
>=20
> Fixes: acca163f3f51 ("arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E=
 board")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index 70d439bc845c..d4cee2222104 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -94,6 +94,9 @@ &mdio0 {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
>  		reg =3D <1>;
> +		reset-gpios =3D <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
> +		reset-assert-us =3D <10000>;
> +		reset-deassert-us =3D <150000>;
>  	};
>  };
> =20
>=20




