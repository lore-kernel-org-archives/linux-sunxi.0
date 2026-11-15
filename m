Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739886;
	b=suxYkeVUwt2+5oZs/ba0A+kCgCAzVeG47F/bK8q3t44tzmE1aPurV9gWVjM3cKwk/TgH
	 PLMWhPXLgzy+utToIOQMhw6RoABcJtF779fDfRXGQ9esxbsK/lNZnihaAWrk7RMsBj8Ux
	 pntdsxO9+k/J7WrbCC5EOsd/4EgUsQjOJG8CBC5L5kZkdRB57Rbn9O4AAcad5dMnld4p3
	 zOqkIUyaxuyCfEn5DKBv9dNpjgdAX+NIoZaLn2zI1AiXLsKwAdcxsM+A+Qdj7Uz17CSid
	 S0MxKLzHq7q2NcLT7nKgFOsuz+mc57hcmTFKjv3RarBXL2hgmUhQa0WJg6W73OG9VWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739886;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7DTQ+ilab30T+Zv/iDCe98ocWkWdeLKP4PE9a5e/7Dw=;
	b=OmLvBirNp4URCjhfFARI2UlW2g2OQ+Drj12B0R2z+98eNxu7Ok6tTrP250ctUlOxV+2B
	 DGWI/zH/NoiPu/l87tmV4jynI6Hkj1XhWhak2xbbfit76gnBWD1xzSGZRu799rHnFnZih
	 GX6/e+GyuAx0WZc2R+ZYGxgxzsTYcTq2Yw57kWM60TfNUKlic+00YOdtRR/GxiTi15zyX
	 LHxpQs3i49FPVgZsXwOVUgIbsrkZv+HO+riZ6gauDnCJvHumF4THK/P9HXhlEsy9l0Wfi
	 czpS+TrvjmeXLUEeab6Yu584Hc7oFdx+wgYhmZDIH27+18RGVJn7qsAyctAZatFdL3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFbrhBwC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B97606A32C
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFbrhBwC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE22B1F000CE
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739885;
	bh=7DTQ+ilab30T+Zv/iDCe98ocWkWdeLKP4PE9a5e/7Dw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=JFbrhBwCSgbkxt7pujKUY9zMMDpruMpZPoGoVimkLdFTRt+YMaPEQxmHjxjG0+gSw
	 yFrzjsl8fgqFOYnsTQ7pFT8QAEeXDFeoblGeAMmxN+8jx0naXanE7y2kjubAcJqMo6
	 1Zq5KpHe1OtMJTK8SObA5BHtEA2AMwPlp/v1Gz/PChsEN3MeOWH2GaAIWBrcJvlPOe
	 +P7H7cNxSbrX0e4xodkKjkrTrKvHdMRX5a8em6RsoTuoBjUs/4VuYxu7wI1BSRR6Ld
	 wjHmPIRu9vNB4K2xxOrmE9VPnZVvb24wINjOGKAtoVCt+1O1vHmt98BZ8AFT5tWI3m
	 yEHbsxKYuD5FA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so26565971fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 02:51:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErERdCSMT157L+vGNN3jAqekc8zQ1g+vxFXVAnYfPh9X6t2Eju55YwdMQBDj49LWHX26EP/8wu3yyOqYxQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z936h8qHYqX23/Tqyh0xN7ImQ/xsWGTrypGeBv0AEbT/jigsWle
	eG4tCOxZj3xqr8uovckT9apuh53PVHsgQ1bfxnAJWr0qqMCioucc3PeFeAwVb4zExfhKuEQqf9U
	MIMY98mC7zCrgV+QdUR9eRhzdIVfvzSI=
X-Received: by 2002:a05:651c:1544:b0:3a6:70bf:622e with SMTP id
 38308e7fff4ca-3ae2b5373femr23084821fa.4.1794739884136; Sun, 15 Nov 2026
 02:51:24 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com> <20261112-h616-zero2-dt-v3-2-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-2-1cd2664230c8@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 18:51:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v65Jw5zPWG0HD75_nJQLRD7QJhHRw4Zs3fvFxyOFFUuGew@mail.gmail.com>
X-Gm-Features: AclHuK8Xtqejh0T-mPLGkGVR4M7UNRwaVG1Eqq6UzreOqahz90WQKJmVFXxqRSg
Message-ID: <CAGb2v65Jw5zPWG0HD75_nJQLRD7QJhHRw4Zs3fvFxyOFFUuGew@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] arm64: dts: allwinner: orangepi-zero2: Let the PHY
 add the RX delay
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
> The Orange Pi Zero2 describes its RTL8211F link as "rgmii", with the
> whole RX clock delay (3100 ps, the maximum the H616 EMAC syscon can
> add) inserted by the MAC. With "rgmii" the Realtek PHY driver also
> clears the PHY's own RX delay bit, so RX sampling relies on the MAC
> delay alone and sits at the edge of the window.
>
> On the board this shows up as intermittent boots with a dead receive
> path, after cold and warm resets alike: the link comes up at
> 1000/full and frames are transmitted and seen by the peer, but nothing
> is ever received and the EMAC raises no RX interrupt. All EMAC clock,
> pinmux, drive strength and syscon registers are the same on good and
> bad boots. On a bad boot, setting the PHY RX delay bit and clearing
> the syscon RX delay restores reception at once, without a link reset.
>
> Use "rgmii-rxid" (RX delay in the PHY, none in the MAC), as the Orange
> Pi Zero3 with the same PHY already does, and as the vendor BSP does.

Flagged by my review agent, and documents reviewed by me:

The Orange Pi Zero3 uses a different PHY, but the pin strapping is the
same, and has the same meaning: the PHY provides the RX delays, while
the MAC provides the TX delays.

I can fix up the commit message when applying.

> The 700 ps MAC TX delay is kept. With this change 10 of 10 cold boots
> had a working receive path.
>
> Fixes: 5a378f9f2b15 ("arm64: dts: allwinner: h616: Add OrangePi Zero 2 bo=
ard support")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index f2e3300e078a..1fdf2d3c1a87 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -18,9 +18,9 @@ &cpu0 {
>  };
>
>  &emac0 {
> -       allwinner,rx-delay-ps =3D <3100>;
>         allwinner,tx-delay-ps =3D <700>;
> -       phy-mode =3D "rgmii";
> +       /* RX delay is added by the PHY, TX delay by the EMAC */
> +       phy-mode =3D "rgmii-rxid";
>         phy-supply =3D <&reg_dcdce>;
>  };
>
>
> --
> 2.55.0
>
>
