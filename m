Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F283542FCCC
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Oct 2026 23:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760408; cv=none; b=RQIot793mV6iZFZivmPIMIRhanC1GcQckdI1xOm2GGQSKk5iRhTLl6Yczar6VXgo6GO766hT9DJXdobWtI5cASjnsqLmQw7e1LjZkOb9Am/5ACwK24e7OhWXwvUA/Bp0MizYGQkr5gxmgyfzukrQ/ue3dnGC6CCz5ndCFccgRws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760408; c=relaxed/simple;
	bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFaHzcWiyJ/0q+vga9W7sVyw/OEP7+/2HR/L3eiXwVyrr3WF0UgYzX8LgwiHXkbpVd2ShFim1YKBCbJ8rpmMBveLzE/En4vO39QD8FEXeX9dy/3argqAatmT0DHd/khmsxOOMUy0aDe9ZBJDv44W0V2qSnMS/Jzj9ul9+8y/Wr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=l/H5Mjiw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="l/H5Mjiw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so11951735e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Oct 2026 16:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791760405; x=1792365205; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=;
        b=l/H5Mjiwx9UC3V2ZW6FCCwMz2V1zSxItD+AyrwLw7t5Edz4D6/x2xCvu2SO9J7MY5K
         nHNL9XdUeV3qBfe2zAu8eydrdU8XrVZ7hS/nYVG5n8tOYKbhI2udIIltw27/7EEm6lVB
         5qSju76ooX8A+RccXB603yqpthdQl/WPMp2LHjPIL5dLw+et243aAqx1Tvftn5ETcib7
         lC1fZ16yC7uO/on12Nna9XBKMx/jB/8m5Qw66OA/l5WRlo8JJLdlH34NuCeCrvfYHzB6
         IVRNpk0VQEy+RGD7klJxE8L+Zdn24adaSNyo+ZDZmXa9dY23sRl01uP1s5753mmGKCdM
         cGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760405; x=1792365205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=;
        b=LSP5WB4VRmMcGVlYe6OQTBnrZq4mVwSCiLDg0NeQ75kt9f5oUwpGdce+LTh621HvkU
         mwjswUHOgyAGEXXBwdJNZ5VOKkXK2yEm9qtMbHfELc1eOXr75spzyeLVEqffqdrG25YC
         juAG98pMuBSzGm+4QMs3c9QjNlkJm02Y7KHwqQYUtszPcwaRzAFcPRgnJVqNtFXt+NB4
         Kucl0DUzD3w4ECpnOdXHUDV3/GS1ZLeR6nYACDSOwivk4I+ZVJD+hBLuZfRn3vtKK1ZK
         LTMFSm6tA9nAGdjHvstndCw0JzDdKmM6euZXlduG46gCzH72a6eRsiRoWozMH4PKCLTB
         toKA==
X-Forwarded-Encrypted: i=1; AKwUvBzT0jqq3/D4RzkH4IXAM73ZOnYtWd7CB9fA5Jb9F01nZf79JBTtD/N+1lD9qgcJXO2jTUIqrpgZ4eNQzQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJj6IWpkIdLnZ4vxyXJVCULW6EmJdPYkl2Ze1N+4+Gx4Fs1Gf0W
	2TeUVVAsae5NyNK3/Dyb/h49ipzqEedEFy12y1v7h3IrRso2OClEtX7kRSm+BCV77W0=
X-Gm-Gg: AYBFou30Pl/7QyR4R/fT2MNBvo9LYKSqz9meNrl5tNKPZWG+9Ceqc7S8Z7JRihGpOHr
	O4obfHUhFW6Dt+jVz4wmgIr4Ho/H0/XMhklGRFeNTt5uM3vqqrJP2A25c4jKfxOqhJ92CtbYEff
	OVE0YBeGDgBUklxUDyxYrzH1gHeSVA8jBxFTD6lzdxyFgp8uDh9z1aAcq1Czbv29/LEx6GC4dEl
	WWctlPaMDjvuuIMGEbE7zNTPmqIyg4MsOPgnhRSKb0CT7lifD92ElfJr4f3BkNIPDu1GgHyOD4F
	oKtfC2b3nCvvLCy48n7OMJVW/NaYxBwh/mGaAmG0HSMk+0zNsUbqJK/jaurOQrIFunpkb7h1KO7
	xX5elcGoTvYj5xz5l0kpqX2YKG3XtYq1+Wgdc+D+xnEm9RrJctGIPwtTFIMIG17E3gIhPDW1r8c
	+D+QVwIP633wlAWLDp8egtqfQbOnntdlRIpDLkO2d5fBnWzhRkKDFSq/cDCXpwIJ4r16LgeBhlf
	68=
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr165188775e9.20.1791760404876;
        Sun, 11 Oct 2026 16:13:24 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bea1021sm222382515e9.10.2026.10.11.16.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:13:24 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:13:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: sunxi: Add support for the D1 CSIC
Message-ID: <aswXwdgpWTVoItYy@monoceros>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930154835.402684-3-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qngddyqnkwhditii"
Content-Disposition: inline
In-Reply-To: <20260930154835.402684-3-tien.nguyenminh@embeddedlinux.blog>


--qngddyqnkwhditii
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] media: sunxi: Add support for the D1 CSIC
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 10:48:34PM +0700, Nguyen Minh Tien wrote:
> +#include <linux/mod_devicetable.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the inclusion of <linux/mod_devicetable.h> which does more harm
than good.

If you really want an include for of_device_id, use
<linux/device-id/of.h>

Best regards
Uwe

--qngddyqnkwhditii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMGBAACgkQj4D7WH0S
/k5tCggArhjqsIMxWZn1mdwNpWwWCgDbuq6GCyhWvxK6/4SoEqOcbECNykQJkcqM
gvBI7Zcz8K+t3TTUvkpf5ten3RucpB85MIpw2zPZyT7UNFTU4XpVJ9KXFNT6G57g
GknahtuMpdBREceO6pO3vd/yn8VMXV8clPTPXpgNywW5t6z3QOzEz0IcrZMJb8V6
cSCkPm8gLqPQcJsxc5Jwdjzt/xaeUIEVlS9TgyVY6BrcotwmfGeJsCPubGsR35Dv
rCHn8rkKSLOaUBG2rAWF26nch4TvC8JDsPDVi5/HJBfJhBqHK5hOi/Nri4WSmi8T
kVp10DCvNgThgd+VEI82L4IL+a9Oig==
=gnsw
-----END PGP SIGNATURE-----

--qngddyqnkwhditii--
