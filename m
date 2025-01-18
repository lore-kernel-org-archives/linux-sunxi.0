Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7C113C809
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 07:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737185385; cv=none; b=KXB1BJM7hRyZQ99iFo8gIQ/PjwAyRSFFiOY+dWEhdyElrrM7S3jjqm28rohHKcDQSvs9yEwailIAcF96+Y0RoXxqFMIGl2aVQJSZvRA4f+IpazN3AMNz22zp7sYsurGFgolhXBw/RFsXNkwHfnMZr1XEFqytBHSX1s9HeWOs4X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737185385; c=relaxed/simple;
	bh=c2AmFxt4+aN7bqCGwSgc6MOH4S2fqgDX+AG+SrwurYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZjYnd1/DGVjzYmlqYU3aS4XEm85oaDuPBaFpJovu62ppg0BtVO9UneRkfo8yWpgHwxMMiQbV3NwR8K+u4keZmGhTX7aHCFmDjalFk7pxuHVvVSGs7+clxS70tuXIh73rsAnSvxA+k0bBPIVXJQD3UQPgtG3aXdVe7YDkBmJGnbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/nFhWb0; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/nFhWb0"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaf60d85238so470118366b.0
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jan 2025 23:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737185382; x=1737790182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2AmFxt4+aN7bqCGwSgc6MOH4S2fqgDX+AG+SrwurYI=;
        b=j/nFhWb0vm+nW3Y9GRIQufeULVJ76x66w1b/EZS4vhKWur60cR4CCCI83uCT3lyw4F
         cL8n7a3aI59pT+LkSYPvJblbVf5k0AvrSWD0aTPDJMtuDcj0vZB4YscRAdjHt3VZ19II
         r5WJ9vdGrCAGDJErkXFG3h24HTUvV4FHLKZr7lBUr39vC+dYNVrPSWnkgP6ePh6dJUpg
         LAqWo+YvYbuS81DTtE1rsbnMKLygpSKpWa9+fpTfo+gU4abu13gTbZrkb5i+MZbe1kB0
         lO1ij6aJJifJAKY7lhLPWiAXp3LEDZki+s+fDiSbnhNCRC1yBXSAl7G5rq0mT4yR4+WJ
         dj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737185382; x=1737790182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2AmFxt4+aN7bqCGwSgc6MOH4S2fqgDX+AG+SrwurYI=;
        b=oCGLf/n5eGfv8nePMeSK0axmTO/jDifTGTE8/2TYzsi2svyQyjjuWaQNJfmPQ9bca3
         E2cVp/GuRqEYLeEnZruytIYneOmxa55teHfikJ+wPzXxkDEcyv431faGFWpH11GtHXlT
         4wOnkbFxmI7AbR/AO74vgxgbameVjicD+nt9GTGbsw/VmbKOPaqUK7A6ZIxGZ+LCTpHJ
         ccSK/fdxuFJaaPN/1D7DRm+j/eE2Ht2YU3NAr/8FZaCrpUnGDnlNybAawWdZy6WjP4FQ
         ILmSqY4FpTlmdFLT8FX6sA2kLoPGFT93VDdKiA08rhTWxlNkg8vkYDRfZD2ZadowY4Kk
         A/8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVV0BmliyjaaRyA9FMvxwYGYz45aUruo0dj4WKpj5iEcviphm7kkXIg6Um8fBQoaABeYZX9T6ITzY/yow==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZxmlJTHay65SdnMc74OhEpGcu2Mr3PTmLCZih+31LdO15Y1um
	cX1iGAoxfQLj0M5ntun08ep7bA3M7vikBsEc585idK1/EjvffzLX
X-Gm-Gg: ASbGnctZym5+XcAkDaqm0ibNW803MQlZc054jgo3HBKkdu3GSqpOjM4i7ozCD247Wgw
	wktUHqdQ6BbskBNW0p533X/FcCi0QvFyHCcPz7sH2x/DzrdSmQLr+mxld2S33u6dnnqXe2g9VCx
	MP1fzK3YSjrt8eQUb/mv+Q6LBxwAxP3zKFKbcRAQXcuJAZjRe5PzMmT3Tm3dy+pS8DXIf/4TkGH
	Iz0ejrNipPRof20h1c+/QozeMjM/rUcLLe3SBdv14vv+tLfLeNcxy+XyaJRl2jO7WoHW+Gz1kHM
	oj34PFAcbOjV4RY=
X-Google-Smtp-Source: AGHT+IHR7qTc96Z2y9tFOwncSihKZnT4bJk0zyDZbwWCUnNXwUqqYIL4r3LTH0yl+gNfwdEW7rerWw==
X-Received: by 2002:a17:907:9408:b0:aab:daf9:972 with SMTP id a640c23a62f3a-ab38b29cf07mr489715566b.28.1737185382455;
        Fri, 17 Jan 2025 23:29:42 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d2e519sm290242066b.83.2025.01.17.23.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 23:29:41 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Cody Eksal <masterr3c0rd@epochal.quest>,
 Simon Glass <sjg@chromium.org>, linux-sunxi@lists.linux.dev,
 Parthiban <parthiban@linumiz.com>
Subject: Re: [PATCH 6/8] power: pmic: sunxi: add SPL support for the AXP803
Date: Sat, 18 Jan 2025 08:29:40 +0100
Message-ID: <8475686.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20250117014537.22513-7-andre.przywara@arm.com>
References:
 <20250117014537.22513-1-andre.przywara@arm.com>
 <20250117014537.22513-7-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 17. januar 2025 ob 02:45:35 Srednjeevropski standardni =C4=8Das =
je Andre Przywara napisal(a):
> The AXP803 has been around for about a decade now, but so far we didn't
> need SPL support, since the DRAM rail was wired up correctly at reset.
>=20
> Now some boards using the A133 SoC use the (compatible) AXP707 with DDR4
> memory, which requires the SPL to set the required 1.1V voltage manually.
>=20
> Add the descriptions for the DC/DC regulators of the AXP803, and enable
> that when CONFIG_AXP803_POWER is enabled.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


