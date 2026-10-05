Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D31F2E2DDD
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 15:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215416; cv=none; b=C6uX1AtOu1/Dvg7H4kZG3lLT/TpZUhyMmxaLXnmhaUyA7JNQrMVujB4J8LyEivdeV9R8IIMfDGbrtmgKgryeHDZae3OoY6q75UgTc62e9qYE1Ak7vgfQxyR3d1tcpJeqBISJhEHazT8MfDFlwOS0/wusB7x0GfILL7MhKgcOzVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215416; c=relaxed/simple;
	bh=vdpsJ3hZNyAcL4ng7ir9nttQMH7WO6n1mJsbI2s3ZfQ=;
	h=From:MIME-Version:References:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTJRH9iE0/yB09PpcCnmkwJm2fokVbUSA4HaiQfk42dGesmVedKWNd+D92sL0bNSaX7Bd4CKiiWQFluAAxjz8mmGE+DWIvMpRbP98yFFmh3BrbHucP/8mj7Xj/31gr+SmYYEelMUNhpeTgeDbceRGC92QPgaIIklKUlJhKPCBOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ossystems.com.br; spf=pass smtp.mailfrom=ossystems.com.br; dkim=pass (2048-bit key) header.d=ossystems.com.br header.i=@ossystems.com.br header.b=o3YWyVTl; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ossystems.com.br header.i=@ossystems.com.br header.b="o3YWyVTl"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7bec5112765so1462340137.1
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1791215414; x=1791820214; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C54WbketwFUMnlhWt0X/x+0i291DYrFlSIzr7u5PmQc=;
        b=o3YWyVTlXRsiYBTimFi39jc+FRJq09/KI4lJ7aKu88tSqk9eERbU8MpXxSNiLF86ty
         n34dYzbp9U1QdYHH/MqW+TKI9KcDTHizJgci36AM+T+bsPyAuGz5HhuuEL673pZOh9UH
         8wn5Sw4AAamkEOhktYGzdPQd79SdhYj6hiQCdquJ1B9jVkxVj3/00zXm0io16XgZqddw
         BLDqCkBl9LBIXfNuTznOXdzbtsOXxjaNt9GQ1zr+XOT4dQbRyBXku5NrViXJBdM7YeAr
         7BrgLFI3HAI4ZBbX02Hy/KFP2EZZ5xgBXBNXWEWS70PLfQkGDbbgiUaIlcMxlX0yWsKk
         Qn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791215414; x=1791820214;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C54WbketwFUMnlhWt0X/x+0i291DYrFlSIzr7u5PmQc=;
        b=MY+eEgp3FOMnBezG3pcoRvC1iEu6XG9ZJfJ1MHccVK056UlVt+st/70s2BnUOZT4ou
         HbGsrhjX+zQGiCn6AN9gjuFEARcc30CCdJESF7uzqgN51EtlehibWqWvDeAgrd/Bg4Pl
         9nDa87eMISwIr6nLQQyI8Cb7Mam/STBLRHxpLIndrH8NvMlzZ/HW51mccmnAtFJlLK+0
         l3BhiiKoxc/KIEhSRg++HaV2QvKqmSe515ql3kZ9AV4EHYRyhcRXNkXEc/5qiGKnBUFq
         07HExCwSbm/1Id4uhfUhPme8k2V4qk6K5U6mykvVbuOIGTn360/b94oPbqvunJby+qxq
         7ChA==
X-Forwarded-Encrypted: i=1; AKwUvBzv7pJAtzC47LxcYOtSd9x/zvFDM973+dVlrpM+Zj4DeTV+32ll8xJQqR4GV61iJD7d339g0y+x1k3DOQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYL4e/5GN5q6J21BgtkLxCc3e2k5WBkpvTdD25ownTh/4qPImaWP
	S7+oHyKjBiy70lZoppl/APBsnv10PLlJjex2zSMWOAUrPr+xynuj8yYYLb4jzRIRvZBaMhG8M17
	Kh1JUa54=
X-Gm-Gg: AYBFou3ONH2ubkTPSmR6H364+kA3h7QlZ9gSyluu4C+jQTJHNKTa3evo0Js+xJ7Ioki
	ZBBeiNO+TEgo5hr+4E0zYMATb3uYXAU/j5tWefNiT2uYhpdW5puRBm4cTvaaIJdIp0xYgiUHG0p
	55mz8vaNEPQDx3mg46J8wTEAJhVD/faqTsEG+rtTj/JBjqDVe/3PXxgVFaucylLuPZLYa009a3b
	fkXU6zuG7PCy+mUjpP762ThsZ6uOVjykfztk+6PF4yqdkYxskJDvoRVBACcDB4KVGxeQ0fQtYed
	awOLVlQem7kfozDKhg3aZpkOyLcRp8jQYgA4DthSKxNukRaWp0y8U3MI6CYW6jbNvEZgNCKSoyn
	35rsoILF6z7kpJPf7SiUZbrV7t13DFTwSNQ6YO3pf4lWvEo1HIMsx0cgal+cQ/Z/ixJjzvwkAF6
	hS3vsofoZ5wAAyYXZZSI1GQpemot42E+cVtP8YHhTCZUx7fVvisOrSHuYAuHWWoyzP92uyS74Fa
	F5p2K4fDTjkCbdChqRPnoDeHpTLfG4Z6kkAiNGCvBAYHGHtY+/6
X-Received: by 2002:a05:6102:638a:10b0:7c2:598a:9def with SMTP id ada2fe7eead31-7c2598aafefmr1485055137.25.1791215413756;
        Mon, 05 Oct 2026 08:50:13 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7c0ff5c2776sm10368045137.5.2026.10.05.08.50.10
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 08:50:10 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98c786605e7so707602241.1
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 08:50:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxZdKPywGdZN1xBDbTtmKiTJmDIr/1ZVTUxxEgtfO8gCpxJewgOu9BHFy9ffGAyinuMjpCEIhB06pSGuQ==@lists.linux.dev
X-Received: by 2002:a05:6102:50a1:b0:7c3:2f13:d905 with SMTP id
 ada2fe7eead31-7c32f13da5fmr1970603137.3.1791215410224; Mon, 05 Oct 2026
 08:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003012534.418820-3-otavio@ossystems.com.br>
 <20261003012534.418820-5-otavio@ossystems.com.br> <2c75983e-5e63-4613-a9a8-055015d04bbf@arm.com>
In-Reply-To: <2c75983e-5e63-4613-a9a8-055015d04bbf@arm.com>
Date: Mon, 5 Oct 2026 12:49:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr2FQ2xeg-u_UQ-krUGsaU3mcWjWYfPAPd7V=ks2=GwzQ@mail.gmail.com>
X-Gm-Features: AclHuK9M-oP6_gI2ooGV7CYgI6qML-uXhAEOVd9YWl1vJlrxk84aNQ57MoMLtgc
Message-ID: <CAP9ODKr2FQ2xeg-u_UQ-krUGsaU3mcWjWYfPAPd7V=ks2=GwzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i-r40: Add SID node and THS calibration
To: Andre Przywara <andre.przywara@arm.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Thanks for the review.

Em seg., 5 de out. de 2026 =C3=A0s 06:02, Andre Przywara
<andre.przywara@arm.com> escreveu:
>
> Hi Otavio,
>
> thanks for sending the patch!
>
> On 10/3/26 03:25, Otavio Salvador wrote:
> > Without the calibration cell, the THS driver leaves the sensor
> > calibration registers at their reset value (0x800) and the reported
> > temperatures drift from the real die temperature by a chip-dependent
> > offset.
> >
> > Add the SID node at 0x01c1b000 and wire the thermal sensor to its
> > factory calibration at eFuse offset 0x40, one 16-bit word for each of
> > the two sensors.
> >
> > The R40 user manual gives the size of the thermal sensor key (32 bits)
> > but not its offset. The vendor SDK key map names 0x48 "thermal_sensor",
> > but that word is zero on all the boards checked. On an A40i running the
> > Boardcon vendor kernel, the THS_0_1_CDATA register holds exactly the
> > eFuse word at 0x40 (0x08780875), which confirms the location.
>
> So in some U-Boot BSP sources on github I see
> arch/arm/include/asm/arch-sun8iw11p1/sid.h putting the sensor at 0x34
> (like the H3 or A64).
> Can you check the values there? I see that Tina-Linux puts them at 0x40,
> as you reported, and it's probably more reliable there than in the
> U-Boot sources, but it's worth double checking.
>
> The rest looks alright (checked the manual and how the compatible string
> is handled in the driver), so if you can confirm that it's 0x40:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Yes, I checked 0x34. The BPI U-Boot sid.h for sun8iw11p1 puts the
thermal key there, but that word is zero on every A40i I dumped: three
boards on mainline with this patch, and the Boardcon board on its
vendor kernel. 0x48 is zero too. Only 0x40 holds two plausible 12-bit
values:

  board 1: 0x08780875 (vendor kernel, THS_0_1_CDATA =3D 0x08780875)
  board 2: 0x082d0822
  board 3: 0x083d0838

The value differs per board, and on the vendor kernel THS_0_1_CDATA
holds exactly the word at 0x40. With this patch, CDATA on boards 2 and
3 also matches their word at 0x40. So 0x40 it is, matching Tina Linux.

I also compared the MMIO window at SID + 0x200 with the register-based
readout (the H3 method) across several boots. All 64 words matched, so
the R40 doesn't seem to have the H3 readout problem.

Best regards,
Otavio

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854
