Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CF4325726
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099168; cv=none; b=SOaUcF19F3t7TJW4QTLBbgeL/YKoq6GtpHMooXUVB/MF1f7AOPNENk2Mwa+OhciseKKnQl4hIrBMvDr4cP43C2xHrxl94+z6ky9wR3+DgWhxd3WnDyUe3Ae/g2CwG+Ljk02hH5Ms0qLZUg7Q6hju5LjjeMk7MVU76qw3sE/vHos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099168; c=relaxed/simple;
	bh=HHoyvLjypv/XHA9Vamy+kGhoQHPAMAXQNoJk5ifA7rw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lyTXpuTX0iNlWvTMUnsEjkVLYBkSAmrc/l5Soupdq3Ctz59LZBZiD2HjO8PFKN3dtLVNoSjODvb/1AnG+AfFWVWDX6S0X4xJrQgI9i8GqHJp8wVOfTwjyt9hq51RG3YLvNbRaGk0l+Gt9NX5ErgYTZrzNPv6IUUZooJyETr03LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FS26bk+v; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FS26bk+v"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso15210215e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 03:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779099165; x=1779703965; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HHoyvLjypv/XHA9Vamy+kGhoQHPAMAXQNoJk5ifA7rw=;
        b=FS26bk+vUkByVjhKikD88TfjD6v4ZBzeHaqbroThhgY9OlFhiKOFSuWv6EzUG8dm95
         j83lHZld6FU5VqMbEkhQvtj1syUbftJ/5dtprCft1m8pAaT2p3846aE8LhCHJIDJg66W
         oSnGxd+4olJ3Kk9aLF5Iqy8Nz05FWbomH9h57Ie76xY2daaGkzoUPoBqwA5WFOWETWRU
         dZC+J3bDUSnJ663Zq5DnDvH358FNQduNO9XbXDCBX4TbEvhW4g76y9po7fjj6DbF7KVo
         Dt9uVHk8UaqmAeh8pWZ9mhIjbhkDx0DE+izj8catX4eowEnk/AdpzsJLd+28xKmjHQKu
         bffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099165; x=1779703965;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHoyvLjypv/XHA9Vamy+kGhoQHPAMAXQNoJk5ifA7rw=;
        b=R8Q58NUbD8kECRlIrNMD/f7iMqsZbt7G4LCm/XXOIjV9wNhGC0BjoSJmC4wS+7qWvb
         wM85UDJDRq9+ngSIaxnBrSFtjJhWepAr34lc0vNwNdYgWrYAJsvwm6FDSYWYq1tP8G1e
         Vi7/40X+2UyO7oozHhpWYXyriKxmQpcDBGKuodpSborusiNqmb6O1wmm3dY+lvmsAnsQ
         150nSH5WjIES+M41qZAK8PNY/jgEpqjPJJeSdxP5n+lSJoLGEJifBhRQ46DxA+9QD8Uv
         4upz3mHzgyD19MbxRbCiqcL7hM6/FhogRmRumK35G2DDWGGp2c9o53LEkr5Ch86ky4Sh
         cpNg==
X-Forwarded-Encrypted: i=1; AFNElJ9aR6cVV92Skp/L7VKHNs0B0cPdEAYpgGgwuzjCbcqA1+7lwlEss+pZHd0GtKkHMDoLLnGy3NunAuXmZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YypLpb2erginO/+58HIicg4ii2aztX320xxXk72sNs7lL+CtUFx
	a28X/z9KmJ9NdeCfweaa1GtitDfxz77m7S8ELtHCTepSEAvAIfPImdW9H0YBXeab
X-Gm-Gg: Acq92OGR9Mca7XYRfaTrpgrg21+lCheWrNM0aOZa424+Fc/gazw3KIkwMURo4J83wM1
	qGsgPsNwqVYSGDpKBtZsFZsdS4+41CmzAnA5/1lE1CNb1KkEvxOOAvEnKs45z4KP4MWleBdU+2J
	epOrMswOfGs7P+b3JdD0aXJ2mryAe2xkthD9hXblvzf5e0POhl1yZxJqPkuFvoOmxIhzq2NQXMo
	Ob7U8Wvi/95ThZYIWyjBu2lguOsRYo+11H1qXlTcJP7u7dSGf4qpfDFYeVZE5iHBBqMoOMez+3Y
	QG9g/7ORAHrKqhIQvffzwP98ns0cIsmLLD2Shy0KOeMKXh+W5PEL50u7/Chv15LeJZfmGLMIUxH
	4U354krkltGQOCylGnshS7XJQd/50dM5FBNTeHO0Dt3ty7h6pdYe0QOLenj9cp2Cakubu824v83
	SE5RKKklx55qMt81E1iB2tpDh4Vqb3Ib/dP06X8+VN3DphjSN0GxAbNzx+kAw2AC0CjWH8Olfdv
	nQ=
X-Received: by 2002:a05:600c:1d99:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48fe631389bmr204052725e9.26.1779099164795;
        Mon, 18 May 2026 03:12:44 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab52a6sm242649805e9.10.2026.05.18.03.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:12:44 -0700 (PDT)
Message-ID: <58e882977f7b4297e67d785467ec681c43ce3606.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: wens@kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 12:12:43 +0200
In-Reply-To: <CAGb2v67tjOCE=Xk=pD84wBG4WTt1nYhDoW3gu_xfx4J0Ooc_VQ@mail.gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
	 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
	 <CAGb2v67tjOCE=Xk=pD84wBG4WTt1nYhDoW3gu_xfx4J0Ooc_VQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Checn-Yu,

thanks for the review!

On Mon, 2026-05-18 at 11:30 +0800, Chen-Yu Tsai wrote:
> > > And you should provide a top level 5V regulator here, to be the root =
of
> > > the regulator tree. Look at reg_vcc5v in the Liontron .dts.
> >=20
> > It doesn't look to me as if Liontron had reg_vcc5v as its 5V "root" reg=
ulator.
> > It seems to be only used for reg_usb1_vbus, while HelperBoard A133 does=
n't
> > have USB power control. The second issue with Helper/Core split is that
> > all PMIC story is inside Core board which has 5V input rail, while Help=
erBoard
> > around it has indeed 12V->5V DCDC regulator (similar to Liontron), but
> > putting it in the DT would introduce wierd dependency of the core to th=
e
> > HelperBoard which carries it. Do you think it would make sense?
>=20
> In that case I would probably put a 5v "fake root" regulator in the core
> dtsi. And in combined dts, I'd then add the 12v "real root", and use that
> as the supply for the 5v fake root.
>=20
> Does that make sense?

"core" board has some battery management schematics, switching the 5V,
I'll look into specifying this part in "core" .dtsi, maybe it will result
in some kind of regulator in "core" part. I'll send v4.

--=20
Alexander Sverdlin.
