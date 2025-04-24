Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D8827BF9E
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 19:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745522475; cv=none; b=YJCPd9kcc7r11eL5ZPT0F1GDiS4ZkjNQA6Yg0455agLZ7huj+vHB+cNSX7JqN0MzImLti8WwHddvC5IPHIdb50UAAmEhYVVBqlHbnK/ru0yXFdQ4sUjhujY77KMk/4/XWoWrYVzLJbHC0BCzSMegZ6Er7lC/IwjV7bGDASiz4UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745522475; c=relaxed/simple;
	bh=VxZVbaLuerUQOiGUQNqAhYl1gyDXczPcezBxadZyF5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h6mMEtygp2slosSBH8HnngVeZrcMa7Mhaaq7RT1QjomWCiUZQUgIjSCJzIJrfYXk5ehMxgs33uoxg+v/+Dq04gaQCGQbQPcfesfptsLDFzzu8XXqtxVRy0GFmj5UKR8i6vQZu6gVi84sXAiediAykZ+448x8r08bLo1gUGnUGgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0As8hZt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0As8hZt"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf257158fso9039065e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 12:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745522472; x=1746127272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxZVbaLuerUQOiGUQNqAhYl1gyDXczPcezBxadZyF5A=;
        b=P0As8hZtLWGkOWEkJqOnH0P6cd19v+urF8FxqiWx8NJ7l1qv/klY0FbGf2pVmKKeqw
         0xRuNCEdWX6UycHe/28MYowV5dEFRMtybACb9jTfF/AIMV5X7CjoB1Fyw6R8B4r11H4r
         wqbxt4Zb7/omzrjfCeBgswd6KyrBAqyWPhssumT4e8Ws3l8I0DSDPkgofLF75EwHyJ/e
         nmr2Yxo3EOeKKWJUuncbAZqxqd7GucfXzMODhGHdS8IZcYgjtchfRp77mC2np41TZrQY
         Zl/Dl5xX4ykFmLp6rYxjCoGTMt+uxzsF+buXZAPS9Ag+bvVIVGlA90uAGbVGCL+XmydX
         pyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745522472; x=1746127272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxZVbaLuerUQOiGUQNqAhYl1gyDXczPcezBxadZyF5A=;
        b=JwSHQqa9cS145bbU3kZBTAlPGZp8ikoOrlWyp77it/zXC9tgsr7LVBbtqHFQyEMauZ
         Naq3GoFpH/lH4KEqlwAcW7wO6SaBz6XTanOx7PxGh2hnb9cDnTJ9es7pxzDBUz0vPT0I
         +t/UMe31WQ1PwUwZ7Kze6wqoOCKF39/NzpQlI7PPKy5rdWEeRhdFZs4Y4I5iSuHCi+LT
         IFZVxgX55JjtK8m3gEjqi6RVA9px4GPbelw1w1vKIBG9uef4kW7FIl5fJA5Fuq/MszUo
         Oyf33EHDqAYH7hhc3F1+KzmguhVxWh6g7PgMpo169lCSk/f/Dz3wyCDyJvSE8d7lrlGF
         GOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ6ku6TaenxCRhIvVKsEZiXKM4YQzTNd53AGrKUhz/emDaVDhdOiTQhu5ZgR6qEcUkr/+nepuY4oPPOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBTSxNSj2PC5Z2VB8O0IuTyte2j8atvgiI7YqHpstv0+kWl34V
	y1hLfaTi0ohqE3SKLTCyvLING1dkeLXplbIfPlHa1uZg9zWZiFD3
X-Gm-Gg: ASbGnctDCrGdZ8+/qgS+QBVvkvUKf1q9K9SFH5j/kxLfKYhweTbnkhvmkkB1e2808e6
	XxKfybfu9iXd9MSsJ6Zp7+Aw4bhM4G4asU0eWunPCCsAOlUOgM2BRmVg3gHceBjKtAWsBf+rXOn
	p2A6jVl3lkvax14jcYIAF+a1u0HhfiD2OyYF+/2tlakvr4CHOgTGgUcnBAojplEjgafRMOpBAyz
	sKFXYI23u7l1Nq01ilcySNXPTNmphTBbduviP97XOrsdXCpvGU5lTLZeu6GXflvNSXegzaTOsHJ
	7qyf0PkzvwdQ5kMfHQjBmpMLVrVqZHqjBALzH2AXd0+/bFcx1nEZfbsdPVDMn4QwLspl/iUMGrn
	/cR3/BD1EcptHDw/y
X-Google-Smtp-Source: AGHT+IFZGRprjS3R9kdZBnFSrqQKh3fPVHhwBoQA7Av3OfiEbnQa9dyvQJUljIblbrFBUYdwTbBs0Q==
X-Received: by 2002:a05:600c:1e86:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-440a3186746mr5102125e9.28.1745522472126;
        Thu, 24 Apr 2025 12:21:12 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d868asm31066455e9.26.2025.04.24.12.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:21:10 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, wens@csie.org
Cc: Andre Przywara <andre.przywara@arm.com>, Yixun Lan <dlan@gentoo.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, clabbe.montjoie@gmail.com
Subject:
 Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
Date: Thu, 24 Apr 2025 21:21:09 +0200
Message-ID: <8516361.T7Z3S40VBb@jernej-laptop>
In-Reply-To:
 <CAGb2v65GPqr5Vnqb_MhAJBAjQzd-vKi1g1pJ53oUnF0Ym2PH9g@mail.gmail.com>
References:
 <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <7fcedce7-5cfe-48a4-9769-e6e7e82dc786@lunn.ch>
 <CAGb2v65GPqr5Vnqb_MhAJBAjQzd-vKi1g1pJ53oUnF0Ym2PH9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 24. april 2025 ob 21:05:17 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> On Fri, Apr 25, 2025 at 3:02=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrot=
e:
> >
> > > In my experience, vendor DT has proper delays specified, just 7 inste=
ad of
> > > 700, for example. What they get wrong, or better said, don't care, is=
 phy
> > > mode. It's always set to rgmii because phy driver most of the time ig=
nores
> > > this value and phy IC just uses mode set using resistors. Proper way =
here
> > > would be to check schematic and set phy mode according to that. This =
method
> > > always works, except for one board, which had resistors set wrong and
> > > phy mode configured over phy driver was actually fix for it.
> >
> > What PHY driver is this? If it is ignoring the mode, it is broken.
> >
> > We have had problems in the past in this respect. A PHY driver which
> > ignored the RGMII modes, and strapping was used. That 'worked' until
> > somebody built a board with broken strapping and added code to respect
> > the RGMII mode, overriding the strapping. It made that board work, but
> > broke lots of others which had the wrong RGMII mode....
> >
> > If we have this again, i would like to know so we can try to get in
> > front of the problem, before we have lots of broken boards...
>=20
> I think the incident you are referring to is exactly the one that Jernej
> mentioned.
>=20
> And regarding the bad PHY driver, it could simply be that the PHY driver
> was not built or not loaded, hence the kernel falling back to the generic
> one, which of course doesn't know how to set the modes.

Mainline is sorted out as far as I'm aware. Broken PHY drivers are part
of BSP code drops, from where these values are taken from. So, for sure
I wouldn't trust phy mode set in BSP code, but allwinner,tx-delay-ps and
allwinner,rx-delay-ps are usually trustworthy.

Best regards,
Jernej




