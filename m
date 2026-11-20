Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188911;
	b=eBHavixNWDWz7V1iH/tOIrIcoUFW6ZhozS33rnKE+sXttcowK/hA3qPsPlvpny41wct+
	 Fd4CMhTyWiQAMIBtkVZeDRpbq+TYJFLj+e9wFojAQhKRlWXewWIx+fFvMqryiqtR6u3qs
	 v2IJBSOT2W9fFBDPfAh0Whax+qiv0w/+s01MfBvqk72qs4sCImO9OgdmCUsQByxxb3eni
	 52L7whXuFFiasJU8DeWW8pmnOJoWGWxZTkWs285GIfmCceTgyrf2vW666UZlhqyH+5CKo
	 HXQNzuG+KJ6OqSkLHRhrEVrC9c21P9krdSX93O98LIG0qmzqydSbZ8704ecl0P89xrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188911;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T6IM2hwHTMA/pxCeoMK4wo9s6BDvD9P4Ko0YhtatVM4=;
	b=RKjUdj++okYuY/Ckg7q+jeFP2SPvmb62PQltecwB0XFe1N9vgn+MN4kPExfk3kyYCEiB
	 LCFrTbJWCzzOJSpAasLBnMRCWp8Xo6WgiWFvTBLICKmU8chLitkaaD9CpetdqE89+DRyR
	 e/V7ViKOjst3VSo6QL+33W9YKD5bjrW7RbPDSiYgyGngliVGhkdLkvKBFoW3pE+itcI3B
	 K5dDwUylufvWymnO4upRlJngBvBubGLJk2kTApfESEruf4LkMGhat/pVtMzkRMjqrakD8
	 2RvbVT4J11KcEkAGT0TO4SkiNADHLwKHh5vLjO5hXm3X44K2CfqUUgzO47a/QZHx3QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YNOhNb3i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DC4606A337
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YNOhNb3i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50041F000C0
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188910;
	bh=T6IM2hwHTMA/pxCeoMK4wo9s6BDvD9P4Ko0YhtatVM4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=YNOhNb3iyidl8e/8+4SlLOXJ9h4M54YkXrJcpXUHKFnIHJcVCWeuIE0J7ylUBD6/K
	 +AgTutx6MOpAW5KQqW4Vgr4E0fjGSbrxDxaNgYBuhf46CSrt5yIHjoB7EKC3+1HJ4c
	 20R9KNUSifE2ekRXxiExB6s/wQGGNEns0+hYlnSTPur2L9LCNa3d0kHtNEr7Xh+Xz8
	 vWsoghV4TpD5WTshR6o2CAD2fOjy9zqAI4biatkARX0Wh826V8tTvCWLJs3CoRGuor
	 cKT3fIsPCyqfuXWloLIwFg9iy7jp0hcN/nAwr6WSpM5uU3//ZxHEi6vUBhyBN+uCcB
	 jlncilkirXv/w==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso9043581fa.2
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 07:35:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGALcJPeRfQIUm7stbtNtiUtO40TH294GotLFG8DA/Wk6wZOP7DuBL5r7qyfTPBUgZuAE3fX0sXGU5qdQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/YbtOMCJO+LYkxJZqi/r4FBce089Z2cmvrb/Hd5Mb+rK7I+auS
	njRKOqdyB6XaAiK5HsHzQiN+XyzdIvfzqp3ieGdo0MHsHifQZ+/sRZ0rrsrC+SRlRsIUR7kDlME
	Xg/bzbN9bBSzOgr4K70f3u3lOarGp0R4=
X-Received: by 2002:a05:651c:a184:b0:3ab:1207:bd2f with SMTP id
 38308e7fff4ca-3ae7f9da258mr13361641fa.11.1795188909192; Fri, 20 Nov 2026
 07:35:09 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com> <20261120-orangepi-zero-plus2-fixes-v1-4-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-4-ecd792189f27@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:34:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Tvdcn0rZACYmNr0Ja30u_mQb8eLPNRoU=6DK85nAikg@mail.gmail.com>
X-Gm-Features: Aa3M54oam78LcsG1YLxbfKx9HEBPHDjI2SmmeFo6cqag_BBBoiZ82g26oZ6JYCQ
Message-ID: <CAGb2v64Tvdcn0rZACYmNr0Ja30u_mQb8eLPNRoU=6DK85nAikg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 MMC aliases
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
> sunxi-mmc probes asynchronously, so without aliases the microSD card,
> the SDIO WiFi and the eMMC get their mmc numbers in probe order. A boot
> script using root=3D/dev/mmcblk0p2 for the microSD card can then end up
> on the eMMC instead.

For sunxi we do not add MMC aliases. You are encouraged to use UUID or
PARTUUID for specifying root devices.

> Add aliases so that the microSD card is always mmc0 and the eMMC mmc1,
> matching the numbering U-Boot uses on this board, with the SDIO WiFi
> as mmc2.
>
> Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> change applied: the microSD card is mmcblk0 and the eMMC mmcblk1,
> booting from either. Build-tested only against current mainline.
>
> This problem was investigated, and the patch drafted, in an interactive
> session with an AI coding assistant (Claude by Anthropic). The submitter
> reviewed the change and ran the tests described above.
>
> Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.=
dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> index 892723b46..4a26863e8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> @@ -13,6 +13,9 @@
>         compatible =3D "xunlong,orangepi-zero-plus2", "allwinner,sun50i-h=
5";
>
>         aliases {
> +               mmc0 =3D &mmc0;
> +               mmc1 =3D &mmc2;
> +               mmc2 =3D &mmc1;
>                 serial0 =3D &uart0;
>         };
>
>
> --
> 2.43.0
>
>
