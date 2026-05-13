Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF6039E9D4
	for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 05:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778649683; cv=none; b=j5aEybPOXzsVO6PpWsNnNLDCzQP8UMwK0z5NJfTQoHrkI3thZ2ZR/rt+ex7ZgARA85uILTublr1y1vBIzBrz/UnG+haYTE1xjnoxLgb8SLUl0E6L0hlOjgeY9YuBdmMG0CNeccCTUjppF2iSJRSdw6FMyLoTn1czZ60aLOt2YWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778649683; c=relaxed/simple;
	bh=wG39Ji+Evy4auwV08BQ91JK+X5T6r322YoiDD9mHSjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/Lc868g+KAWaGa/OFCXak+c8jXjgjvv/MZW9RwxGKhV2OS6E8bnZ2UdXjKtViYmgd7QiYp9h4q57kkin3Nv2vq4dEsGp2u6vWirnS0M4XFCgPif3c2kq/eXKrhSBKzAQtEcF86UvXw9Mw0n+MZmxq3FCfyH0KlyG+Rd1PO/tCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8CrScUm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8CrScUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCBBC2BCB7
	for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 05:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778649683;
	bh=wG39Ji+Evy4auwV08BQ91JK+X5T6r322YoiDD9mHSjA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=N8CrScUmNYnIHpxJ6lc171g+eJphe2OhWMe8MuvTj3QqqLSF1jTAEh/h4ImFWhC4i
	 zfFi0iMugiMIXpDz0c/S1sh5fN+ZTa5ybY6e3NW5BNGAHvlK5Lk3y5ZKld9eOpD/fm
	 Y5VkRKxct2VWVuxJOvv5hu3UJ8CBHOBYXXVJoeOEKGsiBUZZlIPsmO74k692V3Kok/
	 uQKVj0NVIkJ9oHQD8kZm99OPFkLyJUjUTxG5v7XIxckSQmGHNvNRATiHRmD3q5Y7Rk
	 ao7l+1YUnCgXX+BjBbUl9hyShcHKzHYd3GZ50WcDvfvXaJ380vQRrqcHiO7RVX6+u6
	 4pxIcA4yJISVQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso59286301fa.3
        for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 22:21:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+1qlq3lQkG57tA+lQ8KcrJt1bMoz3vP+BY3F7TdnnNvzpgLvfLy4OQ85Vul3chPCU+ItlEy52wA8X/dw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzavtAPqCCy+VK/qnaXPsNou5szSPveiWNEWJSEF8M6r6r+mx87
	HZKbOjDz4LOSE50fT8GsPq6EFI7ISBvbI3AUpnhsOh/G9NX8bHFgm97LyLj6Q2D3OJlHezPR3nc
	s+sI8JIqvqLeXuF+Pz/c13RtgLiFXEKE=
X-Received: by 2002:a2e:8a89:0:b0:38e:6:4f89 with SMTP id 38308e7fff4ca-3944ea49693mr2922681fa.25.1778649681511;
 Tue, 12 May 2026 22:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511221741.25888-1-andre.przywara@arm.com>
In-Reply-To: <20260511221741.25888-1-andre.przywara@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 13 May 2026 13:21:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v64u4sqwiiQcEBg-XvmJ2DLEpSj-_AWNbp14RAp-GXP7OA@mail.gmail.com>
X-Gm-Features: AVHnY4LNzDSVxvL_bMTBGmDtpC-1_N73M3ApcObKe_HI8JqQNliaOIug0_HE6VA
Message-ID: <CAGb2v64u4sqwiiQcEBg-XvmJ2DLEpSj-_AWNbp14RAp-GXP7OA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 12, 2026 at 6:18=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Cubie A5E board comes with 16MiB of SPI NOR flash.
>
> Enable the SPI0 DT node and describe the configuration.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index bfdf1728cd14b..7ad22fc85d1fd 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -344,6 +344,21 @@ &r_pio {
>         vcc-pm-supply =3D <&reg_aldo3>;
>  };
>
> +&spi0  {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&spi0_pc_pins>, <&spi0_cs0_pc_pin>,
> +                   <&spi0_hold_pc_pin>, <&spi0_wp_pc_pin>;

This whole thing needs to be an overlay. The HOLD and WP pins
conflict with eMMC usage, so it seems that Radxa only populates
one or the other.

If you look at the pictures on their official website, you'll see the
SPI NOR chip populated, but not the eMMC chip. On the linux-sunxi wiki
page, you'll see the opposite.

And you probably want to enable QSPI, like Sashiko mentioned.


ChenYu


> +       status =3D "okay";
> +
> +       flash@0 {
> +               compatible =3D "winbond,w25q128", "jedec,spi-nor";
> +               reg =3D <0>;
> +               spi-max-frequency =3D <40000000>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +       };
> +};
> +
>  &uart0 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&uart0_pb_pins>;
> --
> 2.46.4
>
