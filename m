Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDFD5CA6
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Sep 2022 20:01:14 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 186-20020a1c02c3000000b003b26feb5c6bso2580703wmc.5
        for <linux-sunxi@lists.linux.dev>; Thu, 08 Sep 2022 13:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bIlc6ICOGPGbihgQlUe3reSXqofwJ0TrB3eitj5hQ/k=;
        b=jK6Lxe7npRBNqeLKvNRyJLwEX5/QFzY8+cWLKdNgjx8fxiLVa2Ih1LWuxfxswpNqld
         nkBTz6M4cULCv7pKtbOpjbrSxvKjtjXPvjQhVcHr3+fdaVKeWWL8EXWygtJCl18E4dn0
         Uo4oz+QLNz8Izp3XbvPGoHuB7HLTrpJ24YXS2iL3jHtcLbU3/XZspFkG5xfgEmZ/lXqu
         w94jBP87pVQQQW6om7uOltkLOraerY+qt8Ia4NRO6J7Gc1Ys6+H7Ffy5eA41Vd7/yJtN
         L8BaBjqHePUORrKyaT1Nr/pKC2t3ZV2Z9AwCrpV7ofdsawT8aFPnbTbv0kh7SrgPaN+0
         YV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bIlc6ICOGPGbihgQlUe3reSXqofwJ0TrB3eitj5hQ/k=;
        b=CMMvT7MfcsUDikhTqkpQW4r0iTprwRzT2nyeHjsnDwGfEeR7qFz1kgoXrExbDyK3cW
         V9s6wnXbC2gUVYnnmW9IcmRJj0528hMhrMQuIDmKgKL4zw1wx9SIGcm0qWJo5UTlxOI+
         T/VfboKtx8lUZrhttDz0pdRcDbmiAOZWu80Al2pVpWZL1UDpFc47xiuxDBf+hLmNYeU4
         tMHBDv2/bWaldMwb3fHrMV+vscReIziP/0U0J8U962Qq4z1LCspSMZxhKmQIDdTiuxj9
         9i2xoDMfMJ5BTyusrwDEOX5JPBQS6/McP0T8fTs2SKX5J/OyFB42cigu/NVpThSv2FA8
         90lw==
X-Gm-Message-State: ACgBeo3poyL75tx+rfeGwmk5fobdI44pG7jetPKjiWtkqutMH8BZtLzx
	apNvHawUufgL09b10+2864k=
X-Google-Smtp-Source: AA6agR7H6MggZHHKFFnXkpyjgZEmuehSoIrUSbIsY9nGLhFxc9ctcYp6HCFAmXYUlwvPC2Ieq9WU5w==
X-Received: by 2002:a05:600c:548a:b0:3b3:1ef2:1d3f with SMTP id iv10-20020a05600c548a00b003b31ef21d3fmr3148938wmb.62.1662667272766;
        Thu, 08 Sep 2022 13:01:12 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id j4-20020adfea44000000b0022a2c600d5csm8454wrn.55.2022.09.08.13.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 13:01:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Yangtao Li <frank@allwinnertech.com>
Subject: Re: Re: [PATCH 2/3] arm64: dts: allwinner: a100: Add device node for DMA controller
Date: Thu, 08 Sep 2022 22:01:11 +0200
Message-ID: <2718036.BEx9A2HvPv@kista>
In-Reply-To: <3373468.QJadu78ljV@kista>
References: <20220830020824.62288-1-samuel@sholland.org> <20220830020824.62288-3-samuel@sholland.org> <3373468.QJadu78ljV@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 06. september 2022 ob 23:09:38 CEST je Jernej =C5=A0krabec napis=
al(a):
> Dne torek, 30. avgust 2022 ob 04:08:23 CEST je Samuel Holland napisal(a):
> > From: Yangtao Li <frank@allwinnertech.com>
> >=20
> > The A100 SoC has a DMA controller that supports 8 DMA channels
> > to and from various peripherals.
> >=20
> > Add a device node for it.
> >=20
> > Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!

Best regards,
Jernej


