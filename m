Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE78D32B112
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Sep 2026 03:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788578222; cv=none; b=C97Iey9tk7CSfpTDwsEoULPnz4IkeKC5Kceo3CK9ptfg/ZvzrmldCMFEhpimrHgQnNDEB8O0FDWM7x0yZmHlBscxUpnQXjfq/Nrr+Af2Ig5xgOV05EppwMhh8tYxFjmg3jhjLAllAvrjqfd4QQ9GP7hwfeONK4ZDunwJnFqWaEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788578222; c=relaxed/simple;
	bh=nisr5ziN83/vvuUa7fT3PuLqT+p6PzbxVPM+MpNzzyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cNeLQTQwp778qgJVXDJOr1YTpeAqtmAkEchvu8W8X/YDADS99juLD75qM18/8mLmHWN6AREOo3zfTRf4jdblkQZCCId9ajUYCJp05Iv2cBy9xFUb6hWUzcBImLHM1zCDZaZBgOjA6P4mLgeket2Rdhttdl+I0O2GiCIfzr7OTcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qTL2KevR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qTL2KevR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495590dde14so23875135e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 20:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788578219; x=1789183019; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8CCZA4VoDQ6PBSjxOO7MB9iXLnCy8XMS9eXQBMC5ARg=;
        b=qTL2KevRd9YFHE6b79NxzIVlfhhIfBBAGigfVnMno1EIKmyBjYozhA9NpKSg8PLT1r
         0h3fPE1mY3ZePCsv1P0gXYSBJIjLivk+oXRc7Lnw1RxEcPFD+z03sTWDn7mDHRUhFl6V
         EpC7T8GavMosY3wyIeholOauF4YUfRoEkLrWanf+UcJTGQLWoJMOcvhMnh0KKTRCRxbL
         G0DfFuukUzsSjdoIFr+lbIIM+SZRDZ1AO7wWww+byjBfeaRC95LxPnbdb5ZUQ0OO6feL
         gPNDgf8J4TcVWyiYMNDQrOwh5MM7hfTCdOQh20VifmKxxhXLzUI4BqvnBLM07bhQrDPn
         HCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788578219; x=1789183019;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CCZA4VoDQ6PBSjxOO7MB9iXLnCy8XMS9eXQBMC5ARg=;
        b=RdEfu3Swhh4CWYD1O3CCdE4jXPPBB1QZ22FcQcb0f1nXEgaYRb7YTRiXrEJbtrFrwY
         2sKTL3faHpaKuAUbwIvCmGLca9uV9iMUTSL7xcuol82dHLKDkUd5IYI79ua8uDKaAKxN
         kDp1SkD+5G3LJE+jM9ExF8KWo66JfB+S1sOHFHGljjHZbTnzTWMEXArKKWW33FLiWBUG
         SBXE45rrP4VuBVVPLxg7aABxY3EFBXUVTyc1fabKKHydp6J8J/QpjFidok853EYKG1ka
         GfjPOiuL2wL4FUO071K1YqalVrbRCT6jEzcwoDKhx8DVkztkkkNP5tpKJ31Y7fwX2pPE
         2Bxw==
X-Forwarded-Encrypted: i=1; AKwUvBxZWgVvtVIpXFiaD182EO7XDGjEC3aTtYQBtQKgcwFIFbr/aFw3IPiGwkjCZMQfDAfEyXkDScyKO/Rb9Q==@lists.linux.dev
X-Gm-Message-State: AFuF++lAZclR/hQZpplIpgBt1p0aNg4o2yuKcIiM4LwfnIKFR0jfB1Hc
	vGshOI0R1bq4nd/PvhWvWTjzR2nWcnrgNVlMEQexmKcDIJhKz0OSBH4u
X-Gm-Gg: AYBFou2CBkv7E8dDjd+6NTY0xfBo0vcbJvtkKaRT4j6c7hk0k/oTKlFhfTqPdY8sa+e
	VUMu3/nFszvNliO97z9dpnJJFxRhTqYxH6dq1Js+1sdWb7qaFAYqULYD5qT9rpTE/MWdUDxAbMF
	8iXuS9vkTxQxiXtz34oCVkE1dKiXPBg9e+uX0eSMB1BFtAciTgntvz737CpID6HSBHr5bww4hFU
	Pr6jUQ8FI5VjeQf5GlLc8CZPRRbp5nsmvqa4OK/Jcr+J3oY4AT38u5edqlzKAHC3PeXVY7v67Dx
	H5dfQB98IVgvu8IiCdMs8aekQNzJIiNSc+Qe6OOQFKYtScy3uHOR14dKkUOikwAI03EiaEH/2jv
	wa3BH2EfDSWPInldNPfSuIQ9HLUKQ+TYZho4S+e6xnmbrgDBeA3rwy2pWpIKgdaXXzoy9EKllz2
	5bLD7L6WKCVd4kY0NYqE3lEcclxkl/qIaydabAyAWb1dfxXf2jmISpv0w9yVR0QBcWAm555BLYb
	5SB8Uf4c8dR50a1yP86ktSeBZ+/Xhrb59Vve6dikNMFw8UkEahqp10VSDvdD2GjJTW0kdrvRPOc
	z10n4DeNtxpYFFnOMTfKMmLG96RcdHuEC1P1gvksy3D1tTzvfEhKqcd8BWU+6cpDefCo/Ud2R3r
	DdvOuZZ+6qzE4JmFCCqxuoZ/5hVgngCtAy/2H6PHnCA4D8RHvL/YYDw==
X-Received: by 2002:a05:600c:1d01:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49cf81e6f87mr157093075e9.5.1788578218915;
        Fri, 04 Sep 2026 20:16:58 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm25312595e9.13.2026.09.04.20.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:16:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Barzin Lotfabadi <barzin221@gmail.com>
Cc: Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 0/2] arm64: dts: allwinner: h616: add HDMI device tree nodes
Date: Sat, 05 Sep 2026 05:16:55 +0200
Message-ID: <uGlvDrXdQ7mTWJ790WN0hw@gmail.com>
In-Reply-To: <20260904213329.3910099-1-barzin221@gmail.com>
References: <20260904213329.3910099-1-barzin221@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 4. september 2026 ob 23:33:27 Srednjeevropski poletni =C4=8Das j=
e Barzin Lotfabadi napisal(a):
> Hi all,
>=20
> These two patches add the device tree nodes needed for HDMI output on the
> Allwinner H616 family.  Tested on an Orange Pi Zero 3 (H618, 4GB), which
> drives a 1920x1080@60Hz desktop with these applied.
>=20
> Mainline already has DE33 mixer support in the sun4i driver, but there are
> no display nodes at all in sun50i-h616.dtsi, so nothing probes.  Ryan
> Walklin's "arm64: dts: allwinner: h616: add LCD timing controller and
> display engine support" series adds the display engine, bus, mixer and TC=
ON
> nodes, but states that HDMI output is not provided.  These patches are the
> missing HDMI half.
>=20
> Every register address, clock index and reset line was read out of the
> vendor device tree shipped with the board and translated to the mainline
> dt-bindings macros; the clock and reset numbering was verified identical
> between the vendor and mainline CCU headers before substitution.
>=20
> Two things I would appreciate guidance on:
>=20
> 1. Patch 1 currently also adds the display engine, bus, mixer and TCON
>    nodes, because Ryan's series has not landed and the HDMI nodes need
>    something to attach to.  If his series is merged first, I am happy to
>    respin this as an HDMI-only delta on top of it.  That is probably the
>    right shape; I did not want to post a series that applies to nothing in
>    the meantime.
>=20
> 2. These nodes alone are not sufficient for a picture.  Two driver changes
>    are also needed: an H616 variant in sun8i_hdmi_phy.c (only
>    a83t/h3/r40/a64/h6 exist today), and setting the TCON pad select bit in
>    sun4i_tcon.c.  Both exist in the Armbian sunxi-6.12 tree, authored by
>    The-going.  I have deliberately not included them here, because I cann=
ot
>    provide a Signed-off-by on another developer's work.  If someone in a
>    position to carry those forward would like to, I am happy to help test.
>    Without them these nodes probe but produce no output.
>=20
> checkpatch is clean apart from one 103-column warning on a remote-endpoint
> line in patch 1; the identical construct at the same width already exists=
 in
> sun50i-h6.dtsi:183, so I left it matching the surrounding convention.
>=20
> One implementation note worth recording, since it cost a boot cycle: the
> DE33 mixer's three register regions must be named "layers", "top" and
> "display".  The driver fetches the latter two by name, so a wrong name he=
re
> surfaces as "invalid resource (null)" and a -EINVAL bind failure several
> layers away from the cause.
>=20
> Result on the board, with the two driver patches also applied:
>=20
>   sun4i-drm display-engine: bound 1100000.mixer (ops sun8i_mixer_ops)
>   sun4i-drm display-engine: bound 6510000.tcon-top (ops sun8i_tcon_top_op=
s)
>   sun4i-drm display-engine: bound 6515000.lcd-controller (ops sun4i_tcon_=
ops)
>   sun8i-dw-hdmi 6000000.hdmi: Detected HDMI TX controller v2.12a with HDCP
>   sun4i-drm display-engine: bound 6000000.hdmi (ops sun8i_dw_hdmi_ops)
>   [drm] Initialized sun4i-drm 1.0.0 for display-engine on minor 0
>=20
> with the connector reading "connected", EDID read correctly from the sink,
> and 1920x1080 among the reported modes.
>=20
> Full boot logs, the decompiled vendor device tree the nodes were derived
> from, and a photo of the running desktop are at:
>=20
>   https://github.com/BarzinL/h616-hdmi-mainline
>=20
> Based on mainline a500db7819c5.

NACK.

This uses old, improper description of HW. That's why it was never
merged. Two mixers would never work with it. Also, TCON_TOP
isn't directly compatible with H6.

Here is newer work:
https://lore.kernel.org/linux-sunxi/20260509190015.79086-1-jernej.skrabec@s=
iol.net/

Best regards,
Jernej

>=20
> Barzin Lotfabadi (2):
>   arm64: dts: allwinner: h616: add display engine and HDMI nodes
>   arm64: dts: allwinner: orangepi-zero3: enable HDMI output
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 191 +++++++++++++++=
++++++
>  .../dts/allwinner/sun50i-h618-orangepi-zero3.dts   |  25 +++
>  2 files changed, 216 insertions(+)
>=20
>=20




