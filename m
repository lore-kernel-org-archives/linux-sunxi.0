Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F1830D3E5;
	Sat,  6 Jun 2026 19:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780773995; cv=none; b=UMq15aMFPchBIT4Pe8CUYsUyDSo6QbpJafXERwSgoTcUL4yPslpGXY0TVsBFMJPFLg34/50FoPp7g/C42Cjk3ituEAfpzgTK8aHEK+dJlZVMPK3k0Keid09F1OWYFvsTR3lWp8MKnlKmNgNbsmk/kmUx3RXMbqmhOXI04mqo2kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780773995; c=relaxed/simple;
	bh=lZt6H7XdaI7reH5WcStHmqtyDchmQu70asicveCrHDg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DQIsJJwBQRdbYSXiY6gHYvPmB7oMBK3IepC3KfE47vIHRbKisk83Z80bWX4GXGF1pK8t+uQ62Th7yLcP+zEll3P8KZYmHitFpZjmf/ReLIVNemBytJbKexUUysQGVEvpQDOIKKuqYTjyJXjVPiUz1nPArk4mra0sp3QL/JsCYms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DeBWjbm7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DeBWjbm7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E930A1F00893;
	Sat,  6 Jun 2026 19:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780773994;
	bh=Lztxtfeb8rYO41Wn0tUA+/PTnrKdkzQdkeVccRyfme4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DeBWjbm7p2JlTTLM4GzmzELHhZqie7dQjg9P7hdCp8GtZ2kkAXJktM1u6wVg7qH+j
	 hBBMNcd7qrnfYqCCmMR+AP8jYyuFz2Ubu/XmUwgp3PObZsfS97flSwAcYYLszxR9Y6
	 gX5dECePEVSZLeSOMeyN3U5qjRzVQqNSYT6bLQRQ7WoKobFDiSRaGFLssQEJRltwJb
	 2Q3RS57EdbjF/tjfqi3V0EhrxWGLGaNIzq3pX+ZyfRbG0dlCpXEw7De52cKC2SelGN
	 drkPSpIPDmXMUu+2pRqrrJp1HZvY7vzdPh6GeC+qFygth0uKHCzOw0shXLTnFYdgZm
	 EdzyCUpImbTjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] ARM: dts: sunxi: add support for NetCube Systems
 OpenNMC (dobermann)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukas Schmid" <lukas.schmid@netcube.li>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260606191649.2347704-4-lukas.schmid@netcube.li>
References: <20260606191649.2347704-4-lukas.schmid@netcube.li>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 19:26:33 +0000
Message-Id: <20260606192633.E930A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree source file is incorrectly added to the Makefile wi=
th a `.dts` extension instead of `.dtb`, which prevents the build system fr=
om generating the compiled device tree blob.
--

commit 050625703589dd3473dcaea2f70357c5bd2c45b5
Author: Lukas Schmid <lukas.schmid@netcube.li>

ARM: dts: sunxi: add support for NetCube Systems OpenNMC (dobermann)

This commit adds device tree support for the NetCube Systems OpenNMC board,
which acts as an open replacement for APC SmartSlot Management Cards based =
on
the Nagami System-on-Module.

> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index f71392a55df87..220a20734dc24 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
[ ... ]
> @@ -261,6 +262,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-s3-lichee-zero-plus.dtb \
>  	sun8i-s3-pinecube.dtb \
>  	sun8i-t113s-mangopi-mq-r-t113.dtb \
> +	sun8i-t113s-netcube-dobermann.dts \

[Severity: Low]
Does this target need to use the .dtb extension instead of .dts? Kbuild
expects the compiled device tree blob targets in the dtb-y lists to resolve
the compilation rules. Listing the source .dts file here might cause the bu=
ild
system to skip compiling the new device tree blob entirely.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606191649.2347=
704-1-lukas.schmid@netcube.li?part=3D3
