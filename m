Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CCF12CDBF
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Jun 2024 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421722; cv=none; b=rCNVYatrfWg52OcP+AfDGpeAos7i3mz1go30CO+fy2+uomFhyzIibaB5zT0chmGnzyPLYTsfHppdGURIXEfE+sR+JM05QKiBG41FNJV4Fb7VPQXfYf3IA4YoHrVpVrrkx+DqmWdxf2huwUyzFrAonYd/oFP0GQp98wVMr8eM3Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421722; c=relaxed/simple;
	bh=1VQOn2GFOU52cSCjSEM6E4DqcUrB1pI62kAGi3ZyUtg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cyrrAnsBD8X9vBOncB79bAbJw5xijTCMmfC+Aq6o1kEUrUsbcVwyyWWotT28F3tJjgBq/LELlEs+c1VkSYaQnmt8BHO/F79aGlcXTv9BHJlp3VAqQqt+PvQdIqmAtBGZyFfSdfpQUAI0CA0JEX+usgv2L8eV94XEAcHqBK/A5cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC83A1042;
	Mon,  3 Jun 2024 06:35:43 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1F363F64C;
	Mon,  3 Jun 2024 06:35:18 -0700 (PDT)
Date: Mon, 3 Jun 2024 14:35:08 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ke Li <cnnblike@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>
Cc: jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: sunxi: Removed redundant sun8i entry
Message-ID: <20240603143508.0b8ce772@donnerap.manchester.arm.com>
In-Reply-To: <20240603095133.1792688-1-cnnblike@gmail.com>
References: <20240603095133.1792688-1-cnnblike@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  3 Jun 2024 17:51:34 +0800
Ke Li <cnnblike@gmail.com> wrote:

Hi KL,

> Hi, Jernej.skrabec@ and linux-sunxi@lists.linux.dev,

please use scripts/get_maintainer.pl on the patch file to generate a list
of emails that patches should be send to. You do not need to include
everyone mentioned in that output, but at least the maintainers and the
lists.

> I'm looking into the dts Makefile of Allwinner. It seems like in 724ba6751532055db75992fc6ae21c3e322e94a7 "ARM: dts: Move .dts files to vendor sub-directories", we made a mistake and duplicate the "dtb-$(CONFIG_MACH_SUN8I)" entry on line 202 and line 265.
> A patched is generated for this.

Pavel sent the same patch already two months ago:
https://lore.kernel.org/linux-sunxi/20240320061027.4078852-1-pavel@loebl.cz/

Having said this, I wonder what happened to that patch. I think we agreed
on this, but I don't see it any tree?

Cheers,
Andre

> 
> KL
> 
> Signed-off-by: Ke Li <cnnblike@gmail.com>
> ---
>  arch/arm/boot/dts/allwinner/Makefile | 65 +---------------------------
>  1 file changed, 2 insertions(+), 63 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
> index 4247f19b1..f9484f8d4 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -260,69 +260,8 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-v3s-anbernic-rg-nano.dtb \
>  	sun8i-v3s-licheepi-zero.dtb \
>  	sun8i-v3s-licheepi-zero-dock.dtb \
> -	sun8i-v40-bananapi-m2-berry.dtb
> -dtb-$(CONFIG_MACH_SUN8I) += \
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
> +	sun8i-v40-bananapi-m2-berry.dtb \
> +	sun8i-h3-nanopi-m1.dtb
>  dtb-$(CONFIG_MACH_SUN9I) += \
>  	sun9i-a80-optimus.dtb \
>  	sun9i-a80-cubieboard4.dtb

