Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA7A23F26A
	for <linux-sunxi@lists.linux.dev>; Tue, 29 Apr 2025 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941990; cv=none; b=AWAsbPvz7x8TntzYGBP4aSYsTwVrziowZ9iEyizCVXl+iuzibQNgx/A2TszAtCohwtoBmCPdJ8t5uHfBdEtjKidnAZyha3OnJIAILoOeCUMmV6LFGr0GujdwGPj3mjpnP0eQtWaUJRNERO4PKjAEgyhP8l5j7Hq9AQ3a5R5JlFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941990; c=relaxed/simple;
	bh=qlAjtk3tN6wTgfg/HJjz3xA7Cj3B2pXR8JZVSucbYkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tolgnR5+pCQQYumng6ACnKYUGOszpHch7+QyVs7r38lCYjLzmFQ7I9hmhOGT5i5kGroInchgVex7U9tupQTY7ZPs1Nw0/UyQTu2aYa1g2GO4mshiUYzLjzWhUZjlUY6ZhWaN/xuDFaWZh7WLAIBZk4/c70f2oB+m6vsDx1uG87M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54af20849adso6252382e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 29 Apr 2025 08:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745941986; x=1746546786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+3XDw0zebRF4K8CmESLbvyPpxu1c3QADWt4g05ubeo=;
        b=vC9wH4o3eEC/ua5YBc3waaLnLNK+gkva661S6Knb7lLPoWIhct6p4Ote/yu2BHiNsm
         Nwa5L006wpHqm7S1crakPQM8SJzspiVSl/tz1UCmYXdlrg42GMjh+DLvF7m7D2a1ujLV
         14iUWrolj1xk+OeGzAX5btspl8uC6agNDL3RCKFE3nTMw43D+1dZCL3kVwmHznANz9ts
         s6CwkSd32OZf5ztvNn2HkN+C8oq7cQyrkyrilPgPVmY9Q2hdx+2eAbMNAUhFsEG+an8L
         aUSi4iww5+u0Eqefo8TP/048I/YjM9TL6UePWz4irEEMdqVUUCGvjwremReTpB2Lkw2T
         aBeg==
X-Forwarded-Encrypted: i=1; AJvYcCWBH5cQe2YTvhn9PR5n7ru7hEP4wvJlcWFs3jphoEq3oypIZ4P4mo78NY9GiwREtqtMLoH+pE1Gitqf+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxD44r5B1lsod1JZ6IG5BrcG8CP/ORQNY+CEz91ugBya379wvf
	iswSoF5qA//bdjpSuymDA18drgw13VY6iosci0PhS7Lzynph00bDrRTb2bfE
X-Gm-Gg: ASbGnctZxNIcIIutIRC9QO9sWuC90TRAgGwvdqHzyD4Fbd1U0NvlwML/QsfhCc9s1s1
	YO2BCABx5OCmG5UIIv4vOqRTy/5iPbnN5EbdbSrtKVIFNYS0KSfHC6mJA31k6GFSiDZfL4JeJWp
	zMj5wZ+/Sq3+ZSZ4x+xAx1sjqBU/SR3hC0luCCbCujE3NFzwpWPluL2IIOg+kuGM6TqpGkpkLnF
	2RIOTd6nXOuPm7kEcHv6KgKx6IxlGaFjtBzH9HNXxMErlJ0A2aSuoV6GufkIJjKHvkjpLoClyR/
	xwp3b9QYRZ/Y7WoamDEHDJ6Q61UjvphMWDvnWy4nKBUINXfpuy6zGULpM7LLOV25VUk4e8th6Q=
	=
X-Google-Smtp-Source: AGHT+IE5hX/P1T8fbG5IpwTTuzwQm7HEOp2xOr9HElGcJn3sMFLhgndEktkUy6z5dgdHIHMg0OFaRA==
X-Received: by 2002:a05:6512:1256:b0:54d:6c14:3caf with SMTP id 2adb3069b0e04-54e9e1713bfmr1273445e87.11.1745941985792;
        Tue, 29 Apr 2025 08:53:05 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccaab51sm1898094e87.204.2025.04.29.08.53.04
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:53:04 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so78600011fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 29 Apr 2025 08:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNuohnICZ2E3pH0U0Mmm/D/HcvMwXd2Xg7Wrtsseg51WwhTzVHKxrM9ZyZHfBtb1joXobzWypqB2uL6Q==@lists.linux.dev
X-Received: by 2002:a05:651c:1546:b0:30b:aaca:9b2e with SMTP id
 38308e7fff4ca-31d4321c950mr11651651fa.0.1745941984684; Tue, 29 Apr 2025
 08:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch> <4645060.LvFx2qVVIh@jernej-laptop>
 <4975791.GXAFRqVoOG@jernej-laptop> <2486dae4-c5a5-4df2-8048-87b4b2d46d54@lunn.ch>
In-Reply-To: <2486dae4-c5a5-4df2-8048-87b4b2d46d54@lunn.ch>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 29 Apr 2025 23:52:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v66dF8hMmjjJMnpVxM+092q=ZYZ+kT316roZuty6i+rcXQ@mail.gmail.com>
X-Gm-Features: ATxdqUFWPc1KkFXbaozIMU3ylesK6FEAqWczY-QB5FUll7_UlkeMPMrayMJK3Jc
Message-ID: <CAGb2v66dF8hMmjjJMnpVxM+092q=ZYZ+kT316roZuty6i+rcXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, samuel@sholland.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 11:45=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > I just to be clear, I tested various combinations, including rgmii-id, =
and it
> > didn't work, except rgmii-rxid, which matches strapping. Of course Moto=
rcomm
> > PHY driver took that into account and set registers accordingly.
>
> So we have:
>
> &emac {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&ext_rgmii_pins>;
>         phy-mode =3D "rgmii-rxid";
>         phy-handle =3D <&ext_rgmii_phy>;
>         phy-supply =3D <&reg_gmac_3v3>;
>         allwinner,rx-delay-ps =3D <0>;
>         allwinner,tx-delay-ps =3D <700>;
>         status =3D "okay";
> };
>
> and
>
> &mdio {
>         ext_rgmii_phy: ethernet-phy@1 {
>                 compatible =3D "ethernet-phy-ieee802.3-c22";
>                 reg =3D <1>;
>
>                 motorcomm,clk-out-frequency-hz =3D <125000000>;
>
>                 reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
>                 reset-assert-us =3D <15000>;
>                 reset-deassert-us =3D <100000>;
>         };
> };
>
> The RX path looks O.K. RGMII-RXID means the PHY should be adding the
> 2ns delay. The allwinner,rx-delay-ps =3D <0> should be redundant, that
> should be the driver default. And there are no properties in the PHY
> node about RX. All good.

The default action when the property is missing is to leave the hardware
settings alone. I admit this doesn't match the bindings.

> TX is the problem. The allwinner,tx-delay-ps =3D <700> causes the MAC to
> add 700ps delay, and 'rgmii-rxid' means the PHY should not add any
> delay. But 700ps is too low. It should be around 2000ps. So something
> else is adding a delay, or the 700ps is not really 700ps.

Anything is possible. As was raised in a previous reply, it's possible
instead of extending the delay range, the decreased the step size and
added more steps. The problem is we don't really know.

> You say the PHY is a YT8531C. These PHYs also accept
> rx-internal-delay-ps and tx-internal-delay-ps properties in their DT
> node.
>
> Try setting 'rgmii-id', allwinner,tx-delay-ps =3D <0>, and both
> rx-internal-delay-ps and tx-internal-delay-ps in the PHY node to 1950.
> If that does not work, try other values in the PHY node.

I don't get why we should ignore the strappings instead of using them
as reference or even truth. If the strappings worked correctly w/ the
generic PHY driver (that doesn't know how to configure the delay mode
on the PHY side), isn't it working as intended?


ChenYu
