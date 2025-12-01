Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3041D7261E
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Dec 2025 00:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764547296; cv=none; b=VP0cczRyKd9CHbOOTBRc6jUU800jv7LyH+W5VV61AmJ1XsFaiyhx8aMPvnjwcHiZv6PRaGOdeTSBMU6pVAFjo9PjGxS1alrbqm3lqOPYM+Lg45L5CqjAlG6cwfqBB9TagqVpGhEXERShW20DNWowG9LEOi0QSJ6LmCT/aam5cJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764547296; c=relaxed/simple;
	bh=xJCfdRztrefK35bqzMchdkEATxCLjEoQoOUgbqyE3ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNV0tftxaw3I3jSSNaN8XZEO5SF57kyuPCI3VJBevswsm9Annvu1G9mMFIOdl6GPZvhnW7j71CbPm/jsoqy/KOlj9jZDc1p3SffpAsiqMXutbdAfaF/yRRofXzMUfTQNTz+e+2N+mJIjdQbg82NJzPdOL3oqHYrjIO8hmZtYoi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=VFI2aeP5; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="VFI2aeP5"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-657244ed2c2so631026eaf.1
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Nov 2025 16:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764547294; x=1765152094; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P12WkWP0Hh0Y8WPBeLcJtJw1wz18VL0eg/A7bi8ixv0=;
        b=VFI2aeP5QFDT+BjNiRx4bJsCTJK+QkUwrO0yaBC9jTNXDjXb2mEJoRnG34df17gDAS
         jgoDbei47DNFKdsvMOVM1d2wofOpFyzxNr2zkmnN82jJOrBx3MqbNhQ369LOG8QHX5Xq
         oPbeZqaS9gN735Cuf5+kGuDwaKZ42HhZIkSoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764547294; x=1765152094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P12WkWP0Hh0Y8WPBeLcJtJw1wz18VL0eg/A7bi8ixv0=;
        b=CWHoSH0CBPdDTVtZx6jsMMB6w//Sg4WhBPfcIodccygvMcK2IhISJ6J/w4HUG49RTW
         sL4C0+SgEM5fuHwS0FDUs4iXWESGTZJyALDtGF7qWpBp1ygLjfFR+LCX8jOOTnATBWiO
         TGzoAdohKTxug6RMOmx9yhkKnCUSj7c6XtF2LRj7xIi2ysxPYNYsPo/Zi/YemZfEtchG
         Ej6BBdpfPWwINh7mlckSk4dl6RFZdBw9KRMWLE5iCQBqdcysjfzbleMUg5Gqslv8Qd+l
         5qn0cftIZ++G8xcro07sXckOv7XxgTUpGizAyvzRYO10zK9fDJ0N1SzCAD1ma+VxA3Pl
         aRKg==
X-Forwarded-Encrypted: i=1; AJvYcCXGM2juxcuKq11iSowyj3MNU7IICjf13F79AiI024sd+OLHocpbb7/OLKV73bXPQMcbuzP+lhgwjAJq+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ26EX3hi19ZThWNwhE5oD0kSGCwmWBox0gvWXaeun1jlNtgWR
	yrX5CY2/fITjLRG8zMKMAWGP7ZXaKSPOHQKP7gkIi7okaNqmmAKb7jo9D6eASncKIiA=
X-Gm-Gg: ASbGncsUyy4H34veJuVg8jTIvmRz1dwjPr888cQ1YkgS8/rl6VbkmzNtKM9++hjzSz3
	cZfCg18lG7qM5kbgKhhTmWb9n47mYzOU2BdYMzCFV9q9ZXUsghj/NSCOaNO8W2AB7CN5QEyCfZr
	cfpnQCTIBlwRy6X23K5AcmTuCWhR2hiS9oPvpwQc0lzZINIJD2gBQZmCBSID6KydPNe3PX9JGbn
	KU1/snmQRvTj7VZSqplBlkAkQRxY8hgZYStKaL95ke08xgxBRuoUjRKCsuH/tVk41jy55r9xsaF
	K/H2Q1lB8iPxKEy7J5TUIO0F55olitxPqlzVB+gcxDEkdTfGsdDEpXnXebjyI+68tdRN+K0qD56
	csEX3ymTAbGzxWTyiD8LXhnesdy+LpmJBLDY4V6/oGSvdhCigz7VqhgB2D86ravXatWdE69WCXF
	gZAAZNaEgueqQS2artAsA7ogfpsaByH8FYUbx8Zs36TWqcZUs2Kg==
X-Google-Smtp-Source: AGHT+IFvcsQe3gxDo6B8HfGSuVYEUot66tfw4FlPZFrxQmAU07KEeWjNbKgfzmaRG58Xtrgm9Bun6A==
X-Received: by 2002:a05:6820:2d04:b0:653:6c32:6fe9 with SMTP id 006d021491bc7-657923c46d0mr10130643eaf.2.1764547294102;
        Sun, 30 Nov 2025 16:01:34 -0800 (PST)
Received: from bill-the-cat (fixed-189-203-103-235.totalplay.net. [189.203.103.235])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-659332cf148sm2193561eaf.3.2025.11.30.16.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 16:01:28 -0800 (PST)
Date: Sun, 30 Nov 2025 18:01:25 -0600
From: Tom Rini <trini@konsulko.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 06/10] gpio: a733: add initial support
Message-ID: <20251201000125.GB303283@bill-the-cat>
References: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org>
 <20251130-01-a733-soc-support-v2-6-18bdd4376fad@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1w1l3+03nLbg7XwP"
Content-Disposition: inline
In-Reply-To: <20251130-01-a733-soc-support-v2-6-18bdd4376fad@gentoo.org>
X-Clacks-Overhead: GNU Terry Pratchett


--1w1l3+03nLbg7XwP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2025 at 09:45:15PM +0000, Yixun Lan wrote:

> In A733 SoC, the GPIO IP block has changed its arrangement, so initial
> GPIO base address and bank size need to be adjusted.
>=20
> Introduce new SUNXI_NEW2_PINCTRL in order to reuse the driver in future.
>=20
> There is no PA bank exist in A733, but introducing a virtual one as offset
> 0x80, and with the bank size 0x80, it will iterate other bank correctly
> starting from PB as offset 0x100.
>=20
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

So, looking at:

commit 452369cd0c636123321d021298b4bc35a34f4941
Author: Andre Przywara <andre.przywara@arm.com>
Date:   Tue Sep 6 12:12:50 2022 +0100

    pinctrl: sunxi: add new D1 pinctrl support
   =20
    For the first time since at least the Allwinner A10 SoCs, the D1 (and
    related cores) use a new pincontroller MMIO register layout, so we
    cannot use our hardcoded, fixed offsets anymore.
    Ideally this would all be handled by devicetree and DM drivers, but for
    the DT-less SPL we still need the legacy interfaces.
   =20
    Add a new Kconfig symbol to differenciate between the two generations of
    pincontrollers, and just use that to just switch some basic symbols.
    The rest is already abstracted enough, so works out of the box.
   =20
    Signed-off-by: Andre Przywara <andre.przywara@arm.com>
    Reviewed-by: Sam Edwards <CFSworks@gmail.com>
    Tested-by: Sam Edwards <CFSworks@gmail.com>
    Tested-by: Samuel Holland <samuel@sholland.org>

Is there some way to abstract things so that again, non-SPL has a single
driver, and for SPL we can just hard-code a few things?

--=20
Tom

--1w1l3+03nLbg7XwP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaSza0gAKCRAr4qD1Cr/k
Ck3JAQDsSp069E9pnwH01auJEOBqtlTjAOpke/GsTUOtr/WCXgEAq6DiJVDXvLUP
SN9uJY5KNEcZNCLW49dBXBybeR+WJg0=
=YLnO
-----END PGP SIGNATURE-----

--1w1l3+03nLbg7XwP--
