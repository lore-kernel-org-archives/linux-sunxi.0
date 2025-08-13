Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF81233712
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755098856; cv=none; b=f79Tj6/W7ggAvQyA2avRl/gMbnu2GxebK3RNX+hTeYR0kN5Ahvxlaxosov7RpvlYp45LoMC57oyQ2UIPMDSAm6qDYcW+CkZIKhVdAARbBQo34rKH8aT7MdV4fiiGiELNYlLmkDe0uVbLm4fY6FqMdIskynAWhV8rl8gKvRCQO1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755098856; c=relaxed/simple;
	bh=bMtRTyNC8XaiosYhETEdD9uyGasVz/E3rm8ZJMLtO2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sauBnuJ3PDSnejhWFicMOQSYaeoqFbRoLuCmG80KkMDuAuhk8OXPtMYsj+FU0PPzm0d6iEtQt14ejO8aikyvzCZZ/y5Q8xLnh6p0933XVb7wzQQ4vnmS89hjBPcbt4RwHxeYS49LdxTasX+WNgMHtq00pXPRQzrEDPNOUwmSfP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XI/LN12l; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XI/LN12l"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-459ddada9b1so62520615e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098853; x=1755703653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPXPkObct2Bs3tFQz0c3H79KmxSoBx9liY5wCkk/izg=;
        b=XI/LN12l7kvGTXiKcW69QCDmMTnbkRnycFnti6OCvpeUdKQo6BjYdB0YiQvz2jzsVZ
         om7JZM/KIjwO09Yr7WBrIUNFSpAmLrFh74DnmijR1o2tUs4acdMVRroFFO+uKS9Fce8+
         v/JQ9Y9VQtEVkh8ghIHlTyBVP74OKiTZy1MkmOk7S6WOHBdVCkp//Z/kKVp3nG6Y/oS1
         RyKbdPeq7m0Kt+7IzwChJc/t0DtUm6ldy5fW9nuK860QguJKMK6AwV/vfF3bigBWuPRP
         gFbWo9n/DzVz38CijxK/q8WbPn5otKqK7im5B/7R0CHOksiAgRKGXBqyMq32H9ZFY2st
         jMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098853; x=1755703653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPXPkObct2Bs3tFQz0c3H79KmxSoBx9liY5wCkk/izg=;
        b=DyL26Mt49tCwD9CUVlXQIa4sune7IauZyLCuLetr/KAoQAHdjoUdypi5GQGhY7ZUZp
         mwVB5uMBQZUlyuVg7dQZYKFZeFnNofT5xM5rmQINeutIK46kQ5MD+k4atDNwMam8MCSe
         Vj6kRIokPbyP04jEDhjv7BFw7bdja2ZqkKzUXmdpIL75gosSWRdBabBn+9Ky/uF2/ukQ
         kG2uWvw/zgDA+cOl9BCXwHxki4eCtpKCw5QdGOqmaV0aV518S8kGy6vlOEYqn7G4FibJ
         w9NDLONZ+1mGOBdK+EccJjLAzefwlUQHAnCiZmhi/V9TRRRkdghQbujuq3PA14lp8q54
         MqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYAMPbJo5C7X6zR0izuNnX3IPSxBCpjItSSm8qfzg3C0ZOHJh9MiUhLTKS2nWSUgiA0FvctHFOfPP9Ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXS7IRN5td+wuz0Vt+78Fg/XHqyTZ+jMl62YfJlR75WoXMIUAl
	w4GZ0P/btolSTGb8VF39k2Ip99r760Wiyoa4pieHaj0cR3MV4r/Wr3Mi
X-Gm-Gg: ASbGncvZ6gELquVnO3JWErPsY0D16ctJCzDuKdklUTddvUh/aNB7bT8YB5X1RGNzaqR
	i2EQ34trcJzAO2F8SFg/UdHaEHk/nqfW+E1Qr4PqzxwV6DFDi66hZVibYm7tEtX+wd/APNfvamL
	VnJGB3FkOPiFa23X8HMqfMWD8MxDOuFC+7xaTWJnhpXgZ8U9LIIuBW0lg6ZHpJvbJ34MCyQakmR
	dbvPXYtk1fyxA12lu++QtREaMYFvLWftwevX4V7kCFUVtyLt6jc6efb3asf0kO25X19q2pFWjMU
	2HLxV0K6unAyusraB1E/1uR2Sgaf8ulA1t8n50XfntOtQ+hLbdnVzTDCHSQVRd2YIYoy+41I7E4
	7QMDdXgVR+bOmpweytIu3+caZjYBy+airXB9ALHEKetyPqKStbLaeblRJ+MGQFh6jnaC7lOBfvc
	V1XMikZ5ugMIb7+TDL0Q==
X-Google-Smtp-Source: AGHT+IFGLxAAuIuAWtxyOeZe/1vszbnNDC/nHj+B9y42HewYnwzUn1i2VqNgC/DnOaT+IjRwn6AcUA==
X-Received: by 2002:a5d:5f8c:0:b0:3b3:c4b1:a212 with SMTP id ffacd0b85a97d-3b917d1d646mr2962333f8f.7.1755098853098;
        Wed, 13 Aug 2025 08:27:33 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469582sm46991138f8f.52.2025.08.13.08.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:27:32 -0700 (PDT)
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
 Re: [PATCH net-next v2 08/10] arm64: dts: allwinner: t527: avaota-a1: Add
 ethernet PHY reset setting
Date: Wed, 13 Aug 2025 17:27:30 +0200
Message-ID: <1928131.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20250813145540.2577789-9-wens@kernel.org>
References:
 <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-9-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 13. avgust 2025 ob 16:55:38 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The external Ethernet PHY has a reset pin that is connected to the SoC.
> It is missing from the original submission.
>=20
> Add it to complete the description.
>=20
> Fixes: c6800f15998b ("arm64: dts: allwinner: t527: add EMAC0 to Avaota-A1=
 board")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> index b9eeb6753e9e..e7713678208d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> @@ -85,6 +85,9 @@ &mdio0 {
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




