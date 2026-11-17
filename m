Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907668;
	b=Kjb/4P39M6StVWUamqtmluES8Yw0vnA0yDlaBUqZqofeODR26WszOPXcrFOVbEp6hIwy
	 +LKl1X0HGHw91DF+49wzewOpqHikNWC0IHj6LIyFvmrHLqOI6eRV5qv2fwqGPoDYD6XHg
	 JfxUXXzuBxf6sCKVfgIxeI4HBq5E8KOmLpoTpxjsNWzUwL7AaJKz6CnLM9jPJl2enC8e4
	 sBcfCtV3SNcSPS0c6Xr0Brt4T0Jde0u7qQtkL9Haw4YZAGs87ORLnKmql0vOw17ttzYmK
	 xLOCjJmnivizTy5KZAThP83fwTBDhHNuSqtXIZ/6H+SC0HrejefgkKu6Eu6gl9vFuYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907668;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ITwwlYvfP5Zx1SwPrI9bFvqzw5Aia9EoYj13v8b1XFM=;
	b=5Q042Hwl42ZuA5MDS1jNQy0YyDzzrXbs4/hDQjesCWWVQao7V3e0xkS8h8pT8MY9Ildx
	 HevesuQCpCwcLRTJ/+/XgY6joclVNsK+cVTZUz8lehh3aacPsSuvdW+EQ8Gue1zoUwfeF
	 Azgpvzzddf6zsmIJfipnjlvLcAkH6cDuSLLOYZdcyiGBcj2zEyGh3t8i9ZCvH/lkd2HNu
	 YYOAomLG/uEY5FvX4y5m7KtwFoRGbMBFRt+8QdHTSSzsDGa3Et81s2+iJ0IdkdkXovcaA
	 y8UV52fst9NASthkg5Gsyuvk82psrU69YuOFmfqvj80wwZXgJLcE8XI78ov+JU3bKow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nwz1nE2z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97915606A330;
	Tue, 17 Nov 2026 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nwz1nE2z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1730E1F000C5;
	Tue, 17 Nov 2026 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794907668;
	bh=ITwwlYvfP5Zx1SwPrI9bFvqzw5Aia9EoYj13v8b1XFM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nwz1nE2zc3zc5xldLvnMPuAHtAB+qg5StKJxeN/SbHK2iR6Xtr6znofcc8woCYHGN
	 BXr8C+ArdTJn31N2pevFwNer/1qlTiJ256Mv9A3lwqgRFTR1aiWrufYSUmOI+/qJjb
	 qJd/09Oii4LElL1Uzzdhp9lIonZ8L3c3doXqhuWGBeU7PO6Xix+B9naotN808PtwTJ
	 7ptxciPC/pvtqfuJ9efc5mxdiVwGvg8VUqRNwrsVNjiHejfKRe6KThml82WubMD3Cn
	 uPideC4XfEQsSN71T8l+jd52HsQ0NC+HU3hBUIaruI2oYnb3TTUy3jO91kx7z+wBOE
	 RgAqPb9gV1lOQ==
Message-ID: <sashiko-outbox-218483@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: rg35xx: keep RTL8821CS powered
 during suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yang Siyuan" <hsyysy@163.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117092024.12163-1-hsyysy@163.com>
References: <20261117092024.12163-1-hsyysy@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 09:27:47 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: allwinner: missing Fixes trailer on RG35XX-Plus
  suspend fix
--

commit 6bc1ccf6bdee4d4322a5c25361fc4b5c6087cce2
Author: Yang Siyuan <hsyysy@163.com>

> arm64: dts: allwinner: rg35xx: keep RTL8821CS powered during suspend
>
> The RTL8821CS SDIO WiFi on the RG35XX Plus/SP is soldered and powered by
> CLDO4.  rtw88's SDIO suspend callback asks the MMC host to keep power
> during system suspend:
>
>     rtw88_8821cs mmc1:0001:1: Failed to host PM flag MMC_PM_KEEP_POWER
>
> sdio_set_host_pm_flags() only accepts MMC_PM_KEEP_POWER when the host's
> pm_caps contains it, and mmc_of_parse() sets that flag from the
> "keep-power-in-suspend" DT property.  Without it, the first s2idle
> suspend aborts with -EINVAL before the system can enter suspend.
>
> Add keep-power-in-suspend to &mmc1 so the WiFi stays powered and s2idle
> works.  Tested on an Anbernic RG35XX-SP: the board suspends and resumes
> from the lid switch, and the WiFi reconnects after resume.
>
> Signed-off-by: Yang Siyuan <hsyysy@163.com>

[Severity: Low]
Since this fixes broken s2idle suspend on the RG35XX Plus/H/SP boards
where &mmc1 was introduced without keep-power-in-suspend, should this
include:

  Fixes: 398e5fdf60ed ("arm64: dts: allwinner: h700: Add RG35XX-Plus DTS")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117092024.1216=
3-1-hsyysy@163.com?part=3D1
