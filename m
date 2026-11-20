Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188597;
	b=QqMofS9U5AE5+yOX6yk/vVfrrUpAUbV8U4IKlDD99LEkGUimEZHAmJ1xmkohYMAXfmZH
	 1UCmL6G/Tb2cNp4QY4KeLfyKd0er6undRu/4h/jYWNnRejTiBAeu48ZT+ewaYgwwPqyzg
	 cePfGW2FOvZ09yhNYCI9bjKpqbZCl41zgPUxyHiMGQrqPSuE7f3pfTK8ny4mTajzeB8H/
	 hxowLLxYV0CvSQChwIvcVITMEfzwq3IHBS0chC4TsSJnviC4JVflcLgywfBrOW7t7hOFk
	 7b+VnTlfZbwc2TQ7lYFSkzd8FNrWvN/CA8Dt2DkrugSPGKZwgkV2pCfSoo1i3wlGbYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188597;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=19EDW+MpENZ0HYbXIgRTdbQjQZnrHe7ev5VJ61uMM4E=;
	b=qquP7hXGxFENnt4o4+eWkzv4eJurpyO2bErFMWHbjuLw8raJsJ4cw+tPGym3hdadPC67
	 MFSKfvXvQILyQXAIMzz0VZu3XumSvUXJRsR0EpI72b/lcLZZuQAkzXeo3zNzRjWSTf2ln
	 YdeztjvbRNNK8gzhsXXWDrHzJfWLqlLb8r4/V2TLexe9Pntpv2w88gNDDu9GUxQa9FjaT
	 kF3n7ryT6uAFy9WtRltVY8L6oSOGo6DaxX9dEbB6Mb0hvem4LZ85+6e9qEH6ExHcz3hat
	 K0BSId+D8aUkLmpdxQfV26tctMOAGKYYaX8bOy1Ufr3yLWVPns84xZut9F4zFfDhhCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHIYRZkA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02052606A32C
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHIYRZkA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309001F000C4
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 15:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188596;
	bh=19EDW+MpENZ0HYbXIgRTdbQjQZnrHe7ev5VJ61uMM4E=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=hHIYRZkAx67ipCAxDBs8tFyWlLxuGnsB+D5K/RyKea213tkhzZvXtzZqbk+xQ06K0
	 gXCOa9/4xn7KZeRCCXEamjZCBvAh50Es1VROC55uhJA0OG0tj1PqzzvHYGEcXoqycX
	 /newShzTiJPFL8QnqNbtD0G86Jdgf0tUBtIwq6RDfsm3F9VvtVnfU7l9XfWhcMGqet
	 5vsXUim8xiYHC5crSVmTuUtmLmpbgyPI80mKLLVUZ12ikhnlxQSEU5RIS5Mqaji5rm
	 kHfEx4b3c1IsXBWNojmmvwBL6n6uO5pMdaMIm+HtN2WCDyg/paX31u0aBHV2z+4kt8
	 nF5x2qWD3c95g==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c14f7768acso752383e87.3
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 07:29:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGPFi9NQ+VjRh9TDUvqL5qMsLxODaqPwtkBq2PY1yG42/dgcqNEl6LQe+7tSjRZ6hQx8YaVt0ROEvUZjA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8M70PqIZUmCmsJRQGiZE+RA2TUbKxy7Ed5rjwWV/ywYIs2Qd1K
	ywq6qPVwK9Gwkn06LL3o+r0g18itmoxSkSzTXVDsVX5FqU33V4lM5y+cRsOnNK65rCNDE+2rU9+
	bnftagJQxTLOlddhf2J6s5akMQ225xEU=
X-Received: by 2002:a05:6512:23a0:b0:5bc:ca83:1fc0 with SMTP id
 2adb3069b0e04-5c1bc84e614mr1015619e87.60.1795188594639; Fri, 20 Nov 2026
 07:29:54 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com> <20261120-orangepi-zero-plus2-fixes-v1-2-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-2-ecd792189f27@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:29:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64xJxTD=f4dTdYda8GCgDCfBw3qVbRY_RtB6qiDH5GD2g@mail.gmail.com>
X-Gm-Features: Aa3M54pAMnUI623oR2XiNXWmuPAcYcjbHEq980eIU7p81C8epq7iuQ2A1Hg-J1s
Message-ID: <CAGb2v64xJxTD=f4dTdYda8GCgDCfBw3qVbRY_RtB6qiDH5GD2g@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 AP6212 Bluetooth
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
> UART1 is connected to the Bluetooth part of the AP6212 module, but the
> controller itself is not described, so nothing powers it up and the
> kernel never registers it.
>
> Add it as a serdev child of UART1. BT_REG_ON is connected to PA10:
> on the board, driving PA10 low makes the controller drop CTS and stop
> answering, driving it high brings it back. It uses the same RTC LPO
> clock as the WiFi part. The wake-up lines are not described because
> they could not be identified.

The pins are called BT_WAKE and BT_HOST_WAKE. The lines are labeled
BT-WAKE-AP and AP-WAKE-BT, which go to PL2 and PA20, respectively.

Please add them.

> Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> change applied: hci_bcm powers the controller, loads
> brcm/BCM43430A1.hcd, switches the UART to 1.5 Mbaud and the adapter
> works with BlueZ (scan finds nearby devices):
>
>   Bluetooth: hci0: BCM43430A1 'brcm/BCM43430A1.hcd' Patch
>   Bluetooth: hci0: BCM43438A1 26MHz AP6212A1_CL1 BT4.0 OTP-BD-0034
>
> Build-tested only against current mainline.
>
> This problem was investigated, and the patch drafted, in an interactive
> session with an AI coding assistant (Claude by Anthropic). The submitter
> reviewed the change and ran the tests described above.
>
> Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
> ---
>  .../boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts      | 11 +++++=
++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.=
dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> index 34d6c1468..5697251b9 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> @@ -128,7 +128,18 @@
>  &uart1 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> +       uart-has-rtscts;
>         status =3D "okay";
> +
> +       bluetooth {
> +               compatible =3D "brcm,bcm43438-bt";
> +               max-speed =3D <1500000>;
> +               clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> +               clock-names =3D "lpo";
> +               vbat-supply =3D <&reg_vcc3v3>;
> +               vddio-supply =3D <&reg_vcc3v3>;
> +               shutdown-gpios =3D <&pio 0 10 GPIO_ACTIVE_HIGH>; /* PA10 =
*/
> +       };
>  };
>
>  &usb_otg {
>
> --
> 2.43.0
>
>
