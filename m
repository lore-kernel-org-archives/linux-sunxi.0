Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188854;
	b=NCQjk2wkpxLA7UJ9wack7jIucTI6Qm2dHpOSUoXCtWywjWZn2faUf4vbQtiXD4lw747C
	 4G4EieCcZfgp8hvDOzVTa5L92jNOauNnQPL3Gk7tG8sgL+pDqyRLtSj+oFZ2Fz2FjP+HF
	 wwHmKI/XX9pN+X7HBAbai4O+hrDXE1WvxrBYIWgLRJToSUuSHWj7BXcTCF6QzEaRvo0Mq
	 sILGavJbzhyqNa37O5cPg4/Kz9F0Y7+MnpvbMBC6duZCy8kjVUJ3WIZBcyA2qS35awpiB
	 mpxDtmByINxcTEhvXjKFCETlU/6+5EJObL6b1h5xqY4yMBkGNdm0IwUZNMD/K2KOVZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188854;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jmWJeixrMEXpie6DAXTK5CBYLs8pa8Ts1AuNfFgx9pw=;
	b=WR8Fvl+8hB7OVFNAdw2Ms9AXDsa2GuOujQXwJ7mhztqEUiBlR66BwwrT6i8Lqv8yE8Jb
	 BZDAPOegFxk8OaBQUT0jlDAyGUQeVPFexMxBJnRyuKBJXYdYhaNtEBDevy8r0vS8kgrta
	 T3j9WSBWFMfKiXrncBh/4LOOc2L9FLFusbuk08rLRGkKlXMjlum1KqrlD7MdL3lDNH26h
	 Dp2oxb9B0JwBB6qYSa3U3nfEDWaJQKs7SMb5gz1943iXg+LxbrKCdFD+hB2lBaV0EiYRw
	 zKgO0G1mNcbNGI/OFVpQde5VSlNHCWSbEOKOlCXKZMka5o+Ybhz472+ITCTanEhgSQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=diq5dYJw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E31606A325
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 15:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=diq5dYJw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309811F000D8
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 15:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188854;
	bh=jmWJeixrMEXpie6DAXTK5CBYLs8pa8Ts1AuNfFgx9pw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=diq5dYJwexIEqTPONPlehD1IJUyXPFrZnvm/bNqWSZmLM2zjA4Y1R2aZtJEFdumPp
	 fTX42Kd4HRTy/GqOdEgojO2vGN50XdQQy/z9i/sBi8HiqRhcvrQz7gazoDYtGZKDzC
	 E0ps70NLaBHMpKo25cu0/+n56C8xwUtFcvviCcVBmh2oVf/gKeAy0BA0yA7MWeJoXk
	 xpZ59LBQaRDzGT4MMO5AOkFfE67L7I+jQDOSLCFu+cWbACiEp2ZMhB9omlMZWG0FyT
	 U9zsnq2WaDClLdcbaRIHTAPdFBWFtt7Hy2ools29GVj7xLS3Vej2JbArQVpJps2FOb
	 qUHVY17bERT4A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1448968e87.3
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 07:34:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG/F14l2GzfSFEV9K+43Xd8f/q7yVNYVj/pBq/iBAQfN0JdXT3EZ94g2h8kz0VzmuVxsja4i3O+xpUJ5w==@lists.linux.dev
X-Gm-Message-State: APuU4Z8uxJULO3S610PZNHUtB700eVxnaAOArDOb85r8yms7phOIYpEc
	Cbww+T/lzAT++ioVGzBEdtdvRc7IRmL6odidNfnvZV4AVypcYDSBIjrBGuQ0YiMr60RRxXpNAMD
	xSsaSa1UVegoKkADnw8uVUNW2o36sv3w=
X-Received: by 2002:a05:6512:3a83:b0:5c1:4bd3:ef75 with SMTP id
 2adb3069b0e04-5c1bc6f6a8fmr1168547e87.1.1795188852628; Fri, 20 Nov 2026
 07:34:12 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com> <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:33:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v64homW4cRqrtDVj3N29XDw3f4ZEmAok1btW+XuWd8tBbQ@mail.gmail.com>
X-Gm-Features: Aa3M54rsbUPr3cLC2JjkyHhLV0j0Q1SzwSnaTdHQp00CEqW85K3o6tde4cQxGOw
Message-ID: <CAGb2v64homW4cRqrtDVj3N29XDw3f4ZEmAok1btW+XuWd8tBbQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 LPO clock for AP6212
To: ipfarher@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:40=E2=80=AFPM Ivan Pfarher via B4 Relay
<devnull+ipfarher.gmail.com@kernel.org> wrote:
>
> From: Ivan Pfarher <ipfarher@gmail.com>
>
> The AP6212 WiFi/BT module needs a 32.768 kHz low power oscillator (LPO)
> clock, which on this board comes from the RTC clock output (osc32k-out).
> Nothing in the device tree references that clock, so it is disabled as
> unused during late boot.
>
> WiFi keeps working without it, but the Bluetooth core does not: with the
> LPO gated, the BCM43430A1 ROM answers HCI_Reset and nothing else (no
> Read Local Version, no firmware download), so the controller can never
> be brought up. Turning the clock output on by hand (RTC LOSC_OUT_GATING)
> makes the controller answer normally.
>
> Reference the clock from the WiFi power sequence, as other boards using
> the same module do (e.g. sun8i-h2-plus-bananapi-m2-zero.dts).
>
> Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> change applied: osc32k-out stays enabled and the Bluetooth controller
> answers HCI commands. Build-tested only against current mainline.
>
> This problem was investigated, and the patch drafted, in an interactive
> session with an AI coding assistant (Claude by Anthropic). The submitter
> reviewed the change and ran the tests described above.
>
> Fixes: cf8e19e1ec15 ("arm64: dts: orange-pi-zero-plus2: enable AP6212a Wi=
Fi/BT combo")
> Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
