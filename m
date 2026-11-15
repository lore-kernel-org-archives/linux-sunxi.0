Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794738894;
	b=VzV5gebPSGGFOEwb9cY6Lgpe3aMquxy/pMAMVU7jmyAwEc7toMVyQFJXEp/sCP9MA7I0
	 5pL3zcaIzLfEmTMK4yzL+Qv77hyn8v17wL/dd0ia3052YswW2ZJGtFIV3jEQWKH6JD6oh
	 Ju4iogJQ/e2UAHVWOs/iPM/QnkaV59VK6kJBujqGLl8xNvgEOHRRoWicTTYmdKDEZ3dMI
	 4+FC7jKNDyIjv1onjqcSoMm9DbkHH4Cd7LT7sB++1Xl6cr/B7GvysjhO2pMthKplFCJat
	 FnAQ2Xm7XA7hjGjs/l3DebpZZvyS7gCPJTudrdNlOzc2KV4Eo2iZdYg9vI54xfa+VJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794738894;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BPDZ7665LmGw0imJR3DrIKXNMITj+LF4ERC2NJv/3Gk=;
	b=Ys8SVICtiaLlW6ge7oX17NW7HWbKtPkGJiCncylBBpu/FrouiaM8ViJpmbwOB7YI4qI0
	 4/7gLaRt8wlTGaFiTM7ii2Ceg9ePZlyXweJFoaIfqGmgLDWxYRRQ4jQC7ZF0/F9zo7Kn2
	 heWZpEwGxdtpbu1D378lDc1EeU77on+OE0w8H2PhPcrbUz7VFVeTItv6Q9bMDhOlAjdDi
	 ycj8TpC9bO/QMO6xOzsJwq/z92u0svWKl5iZbHLRnDQygzHYqJFAE4QFIf5g95R41lqAx
	 AG/bGFgYK+3iIbo9IQIKY4J56POmSD5FRpsGVn6IQwz6yFAKFwpQbBh1l6kzmi26/OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TkXI/bUD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9F0606A323
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkXI/bUD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B1D1F000CD
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 10:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794738894;
	bh=BPDZ7665LmGw0imJR3DrIKXNMITj+LF4ERC2NJv/3Gk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=TkXI/bUDo6WbfTG+7z7cIxZxSyHdVp7OLJJk6kD17Ul01vm/GM2ZaR0WX2JFxveIv
	 ygsGaSCk+u7IfUhHrTMVuv7GhrJQ2gMsxGexvZ+RnPfZzcmxkIyVXtCqBLWb2dwNMF
	 BLalxi2EkDHDlxNtX00iufA8EsIseGiDjbDapZQkhWDuFYGLCyEG0cqozA4KPDJ5Cg
	 3Lu1HwyXKVNXXMOlHfRdmt2yhaIWmBRhaaa0q+0gT+PTFoAlVsdqO6MTtxZoqcGIPv
	 nr+aEe8pnVTUPhpytZ9V7qmufHqYIYUwEioCqMLujmO0V/5pf75qLxD5dekIsvB+qf
	 ORWmRfBHcu/4A==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ae22dcfdc3so24281401fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 02:34:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG64PxCgDu9O1grdOD07V7w89lSNGu8Ytp5L7Fx07VZUOsuh8DlJ4LMzjM56z7IRwD2WHlEcWnF+uSNag==@lists.linux.dev
X-Gm-Message-State: APuU4Z/x6KnYAb5742DRjx7tQ6gsmlPkzlrR1R0gow5iNoTtSP9PurFm
	mbH010a7POjkpmxKGmbfPdNh6dKv7uqvHnp7Gw+mo6znqxJvAM+a8AqwZh5udnRCJMdWy1c618r
	k4JrLG4iLESioQ5Qe1Cf46yGf5oKC5yE=
X-Received: by 2002:a2e:bcc6:0:b0:3ac:d178:4fab with SMTP id
 38308e7fff4ca-3ae2b4cd914mr23856181fa.15.1794738892713; Sun, 15 Nov 2026
 02:34:52 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com> <20261112-h616-zero2-dt-v3-5-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-5-1cd2664230c8@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 18:34:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v661N+=LSqXQD9zQWiFv-9CbE-2EzisgeSW2_LQvjr20KA@mail.gmail.com>
X-Gm-Features: AclHuK9-VLtQ9djmgy5KmaFMIxLSYgEBbXZ_e3jCYdzdRhHvuUSs4waIGOFphaY
Message-ID: <CAGb2v661N+=LSqXQD9zQWiFv-9CbE-2EzisgeSW2_LQvjr20KA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] arm64: dts: allwinner: orangepi-zero2: Keep
 VDD-SYS at or above 900 mV
To: aiyengar1990@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:22=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> On the Orange Pi Zero2 the AXP305 DCDCC "vdd-gpu-sys" rail feeds both
> the Mali-G31 and the SoC's VDD-SYS domain, which includes the video
> engine. Its regulator range starts at 810 mV, the lowest GPU operating
> point, so once GPU DVFS is enabled the rail drops to 810 mV whenever
> the GPU is idle. The video engine does not tolerate that: with the VE
> at 600 MHz, 4K H.265 decodes intermittently produce a few corrupted
> CTBs, without any kernel message. Only 6 of 13 runs were bit-exact at
> 810 mV, against 3 of 3 at 890 mV, 3 of 3 at 950 mV, and 3 of 3 at
> 810 mV with the VE clocked down to 432 MHz. The vendor BSP runs every
> GPU operating point at 950 mV, so it never lowers this rail.

Makes me wonder if we need to implement DVFS for the video engine...

> Raise the regulator minimum to 900 mV before GPU DVFS is enabled. The

Why 900 mV? Why not 890 mV?

> H616 GPU operating points use <target min max> triplets with a 990 mV
> maximum, so the regulator core clamps the low-frequency requests into
> [900, 990] mV and devfreq still scales the GPU clock.

For device tree commit messages we typically don't mention implementation
(OS) details. So instead you could simply say that this is still within
the allowed range of the lower GPU OPPs.


ChenYu

> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index 1fdf2d3c1a87..719d6dadf7bf 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -114,7 +114,7 @@ reg_dcdca: dcdca {
>
>                         reg_dcdcc: dcdcc {
>                                 regulator-always-on;
> -                               regulator-min-microvolt =3D <810000>;
> +                               regulator-min-microvolt =3D <900000>;
>                                 regulator-max-microvolt =3D <990000>;
>                                 regulator-name =3D "vdd-gpu-sys";
>                         };
>
> --
> 2.55.0
>
>
>
