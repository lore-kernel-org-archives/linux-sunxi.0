Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE404071E9;
	Fri,  5 Jun 2026 19:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780687471; cv=none; b=btaD+bB1UB640+pXv50SfhOPe0xcACF3RXlU4ZeVeBF6koEbcInv0O6do71aWUdZNwTLFNhJzk5wAMGCW9ypkCtKYVEmdzzfXZ2fqb8oH65TtuVWVD3kUDmgyYprw3rP/hQ68tM+/G7zkwnN1Bz987VqI1Di7BBBHybKxm2u3zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780687471; c=relaxed/simple;
	bh=ypeRvsYBr6OaQZkz/nyNqmaf/JAoyJ+P1lxhvoCp5Nc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PxALaIZBZhp6DUBHZSH3HXyW9Gj9975Q37ZHC8RFHyoeyhhPuM+qtXp9RZorMtF9DyNTNIhqIUFH9ffvtVu91KtAtH+jVmnaMLWKDsNcGMZlQif8Vm8bg4XldZX6hyHDXZeOYXxlGulXO3pD/80UwqvJa3KATRnSx2BaPjO8reo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lB6+UtPI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lB6+UtPI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE861F00899;
	Fri,  5 Jun 2026 19:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780687470;
	bh=ypeRvsYBr6OaQZkz/nyNqmaf/JAoyJ+P1lxhvoCp5Nc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lB6+UtPI1gDdy/Q9wD/aF3eOgRGXJErddP6nbUoV5Az19/wmu2akv+Uv11fIQFBdP
	 4NF6aIOYeulurrfIzhTK9wfp/lQp9D/VYkrSJIlbG0xwAC1RivPsoK+ldsTs4JRbMy
	 bxdnPZFYu70mFQPEf/lVyNDH/mTXpekQE/Whybzcjqc0bZR1TkmXMgZB4LtOuvnReu
	 iTni78MtMmV6nJxP+6pZ9FKOoVc43Xe2M8F29zS+j9elfHeIGY4yQj2uLXp7+fWUxh
	 XUnX8fQ+b57ATBtwAq05ehmAFpMkrMY8i+CzF6mALLFvxV7XQwMiSvNdTjFFetKHpU
	 nJIqEbgRRraQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: sunxi: add support for NetCube Systems
 OpenNMC (dobermann)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukas Schmid" <lukas.schmid@netcube.li>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260605191322.1920944-4-lukas.schmid@netcube.li>
References: <20260605191322.1920944-4-lukas.schmid@netcube.li>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 19:24:29 +0000
Message-Id: <20260605192429.CAE861F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added device tree file `sun8i-t113s-netcube-dobermann.=
dts` is missing from the `arch/arm/boot/dts/allwinner/Makefile`. As a resul=
t, the DTB will not be compiled.
--

commit 72bddd5a378aaecf47418f6e924b30fb31105d2f
Author: Lukas Schmid <lukas.schmid@netcube.li>

ARM: dts: sunxi: add support for NetCube Systems OpenNMC (dobermann)

This commit adds device tree support for the NetCube Systems OpenNMC
(dobermann) board. It configures the various interfaces broken out by
the Nagami SoM, including Ethernet, USB, SD card, and RTC.

> diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dt=
s b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts
> new file mode 100644
> index 0000000000000..d7765caffe2a2
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts

[Severity: Medium]
Should this new device tree file be registered in
arch/arm/boot/dts/allwinner/Makefile?

Without adding sun8i-t113s-netcube-dobermann.dtb to the
dtb-$(CONFIG_MACH_SUN8I) list, will the kernel build system actually
compile this new device tree?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605191322.1920=
944-1-lukas.schmid@netcube.li?part=3D3
