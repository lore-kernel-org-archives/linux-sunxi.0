Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A84338384
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Mar 2024 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710932234; cv=none; b=lx4hi+Nc7tG44nCDWJirBWrZbd+XaOg7mYOiI79l7h60eQwlzP6QZrpwxDQKGLK2qjUwpgVVjQvbR0Itybqc8u1QCxt9SoOsKHELL9VTPbY+ivsirW7R2Kpys/9fNG0Bl+FT8jiX9bUiG45MOkH5LuxH7nO2fH2Tpediy/cKW6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710932234; c=relaxed/simple;
	bh=HwFo0+PIWPVFBEBd20yVK7SJwuUJmtieV96VhyaC6u0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fhuuhRs2YeAjACM1a0H8PnPmsqHiOBCLyJ6q8hJ1h1+eVFgfZUCh5l7F54IWkT/o38LNTOi3cODiTEgWYRr3UTE+LBEtHiQligEhMxf+CuPkQrJPHP4uWJgoODbxTSlSE5IdjOb8TFEUahOalFYC3y1ZhDloPVZnrWxoWPqDLNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E2881007;
	Wed, 20 Mar 2024 03:57:46 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16DB63F762;
	Wed, 20 Mar 2024 03:57:09 -0700 (PDT)
Date: Wed, 20 Mar 2024 10:57:04 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Pavel =?UTF-8?B?TMO2Ymw=?= <pavel@loebl.cz>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/3] ARM: dts: sunxi: remove duplicated entries in
 makefile
Message-ID: <20240320105704.25612cff@donnerap.manchester.arm.com>
In-Reply-To: <20240320061027.4078852-1-pavel@loebl.cz>
References: <20240320001152.4077150-1-pavel@loebl.cz>
	<20240320061027.4078852-1-pavel@loebl.cz>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Mar 2024 07:10:19 +0100
Pavel L=C3=B6bl <pavel@loebl.cz> wrote:

Hi,

> During introduction of DTS vendor subdirectories in 724ba6751532, sun8i
> section of the makefile got duplicated. Clean that up.
>=20
> Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories=
")
>=20
> Signed-off-by: Pavel L=C3=B6bl <pavel@loebl.cz>

Looks good, that indeed removes the "bad" copy, with the newline mishap
and the missing sun8i-v3s-anbernic-rg-nano.dtb line.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
>  arch/arm/boot/dts/allwinner/Makefile | 62 ----------------------------
>  1 file changed, 62 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index 2d26c3397f14..2a4162657a2c 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -260,68 +260,6 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-v3s-licheepi-zero.dtb \
>  	sun8i-v3s-licheepi-zero-dock.dtb \
>  	sun8i-v40-bananapi-m2-berry.dtb
> -dtb-$(CONFIG_MACH_SUN8I) +=3D \
> -	sun8i-a23-evb.dtb \
> -	sun8i-a23-gt90h-v4.dtb \
> -	sun8i-a23-inet86dz.dtb \
> -	sun8i-a23-ippo-q8h-v5.dtb \
> -	sun8i-a23-ippo-q8h-v1.2.dtb \
> -	sun8i-a23-polaroid-mid2407pxe03.dtb \
> -	sun8i-a23-polaroid-mid2809pxe04.dtb \
> -	sun8i-a23-q8-tablet.dtb \
> -	sun8i-a33-et-q8-v1.6.dtb \
> -	sun8i-a33-ga10h-v1.1.dtb \
> -	sun8i-a33-inet-d978-rev2.dtb \
> -	sun8i-a33-ippo-q8h-v1.2.dtb \
> -	sun8i-a33-olinuxino.dtb \
> -	sun8i-a33-q8-tablet.dtb \
> -	sun8i-a33-sinlinx-sina33.dtb \
> -	sun8i-a83t-allwinner-h8homlet-v2.dtb \
> -	sun8i-a83t-bananapi-m3.dtb \
> -	sun8i-a83t-cubietruck-plus.dtb \
> -	sun8i-a83t-tbs-a711.dtb \
> -	sun8i-h2-plus-bananapi-m2-zero.dtb \
> -	sun8i-h2-plus-libretech-all-h3-cc.dtb \
> -	sun8i-h2-plus-orangepi-r1.dtb \
> -	sun8i-h2-plus-orangepi-zero.dtb \
> -	sun8i-h3-bananapi-m2-plus.dtb \
> -	sun8i-h3-bananapi-m2-plus-v1.2.dtb \
> -	sun8i-h3-beelink-x2.dtb \
> -	sun8i-h3-libretech-all-h3-cc.dtb \
> -	sun8i-h3-mapleboard-mp130.dtb \
> -	sun8i-h3-nanopi-duo2.dtb \
> -	sun8i-h3-nanopi-m1.dtb\
> -	\
> -	sun8i-h3-nanopi-m1-plus.dtb \
> -	sun8i-h3-nanopi-neo.dtb \
> -	sun8i-h3-nanopi-neo-air.dtb \
> -	sun8i-h3-nanopi-r1.dtb \
> -	sun8i-h3-orangepi-2.dtb \
> -	sun8i-h3-orangepi-lite.dtb \
> -	sun8i-h3-orangepi-one.dtb \
> -	sun8i-h3-orangepi-pc.dtb \
> -	sun8i-h3-orangepi-pc-plus.dtb \
> -	sun8i-h3-orangepi-plus.dtb \
> -	sun8i-h3-orangepi-plus2e.dtb \
> -	sun8i-h3-orangepi-zero-plus2.dtb \
> -	sun8i-h3-rervision-dvk.dtb \
> -	sun8i-h3-zeropi.dtb \
> -	sun8i-h3-emlid-neutis-n5h3-devboard.dtb \
> -	sun8i-r16-bananapi-m2m.dtb \
> -	sun8i-r16-nintendo-nes-classic.dtb \
> -	sun8i-r16-nintendo-super-nes-classic.dtb \
> -	sun8i-r16-parrot.dtb \
> -	sun8i-r40-bananapi-m2-ultra.dtb \
> -	sun8i-r40-oka40i-c.dtb \
> -	sun8i-s3-elimo-initium.dtb \
> -	sun8i-s3-lichee-zero-plus.dtb \
> -	sun8i-s3-pinecube.dtb \
> -	sun8i-t113s-mangopi-mq-r-t113.dtb \
> -	sun8i-t3-cqa3t-bv3.dtb \
> -	sun8i-v3-sl631-imx179.dtb \
> -	sun8i-v3s-licheepi-zero.dtb \
> -	sun8i-v3s-licheepi-zero-dock.dtb \
> -	sun8i-v40-bananapi-m2-berry.dtb
>  dtb-$(CONFIG_MACH_SUN9I) +=3D \
>  	sun9i-a80-optimus.dtb \
>  	sun9i-a80-cubieboard4.dtb

