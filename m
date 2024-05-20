Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AEA51005
	for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716209336; cv=none; b=hIb29Izu2qagnE/gmAq+ER6gWObqGCbwhMPOWe6Ud5IttjKoeWWdx5x0k8odh/jnLQJzZ1KJSLNn2mpW4f1YgU8EPe63c4wkDQxAy1Qkq9eLqyFT/umYUEULJVkxLqbQeMEYIDqSC7CBGEzkaOgRe/DXfx1fM4X11k4u7jdgz1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716209336; c=relaxed/simple;
	bh=xGLpQvlkSMguRY3Aiv0Eoi3vrQks8x7hjPr0es+BL7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ct1bCduqUmPmuUIEhV59iVxBaY1cLuIhDzYw2CPesPRfFAbmQ/CmsvAid9v2C0wEPNVtiYOB0LwvhyowNbkmGMDX0sgHLcxpzZ8d6XrS2Dav+bXJrSy6pLbFe/LSin8gTVOjAuupyE2dLZAFrdpoPw37eERiLq/7p8dndyFBIEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ku77dtuQ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ku77dtuQ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-571be483ccaso7216067a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716209333; x=1716814133; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=th3Jw3Ra488MyIDoF+vI7PjhzrI0uWKpJV2cin7BcqI=;
        b=Ku77dtuQHATetRZAwmgPJO78OLnnkCjn7Z67AybbyMJgV7PCnq0zRWgWNzQlZ+VBiO
         /316PgWrRmI0t0UAIICQrPexP45Aw1YR5FCIAVp6shUedoZLUBP3Ljcsag6W65rGWw+F
         AMRnaEkbVP+E33N0Nq98J5rtkmPE9cdDRvF3258EqbjPBZ/46dvx5eqzh2JWz3Vahj6t
         LdPrj54VHt4XxmBRSJ90OE2Wbr0yC0i5DYvXQmpDbBB0km27AmcfVIUMRHntdHZPCHT2
         H6TlqX0aeL+XuNrRkUTDn+JZYSwweWqOIPFJFV5wOQURlTP/qjJ2wiQ35t8Wx8HTUZrM
         4a2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716209333; x=1716814133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th3Jw3Ra488MyIDoF+vI7PjhzrI0uWKpJV2cin7BcqI=;
        b=iSKNDl2tztE5SJZPOYshFGY6cUgR4g2s1weKf9Oa1PzFEdUI2NMhGZ8J77+qYdYYzB
         kbvfYDdeImd0MDJJT3R5dczlUMDYxsgHOxPdT94Klc9QRQ1lnI9A0b5A5bF6huz4PK3C
         qktCkNz33ltSWhGAHV8TnbofWMBo9yHm7SZWxFvsgLy36jCMQi7UqkK5ldmZR+0S4Bgk
         SAm01l+gRfnw9EVRE+hC/CHS5Jy6mfaKaYQbBhCc1YmGW2XQSsmcRt4arIDX3prt22nf
         naGYC3QdKSdEjMfzOkozyI2lmtq1uzguc2SM/7Cx59YMI2D3iNGJ9SSSbTSqHUTUCUMQ
         PSZw==
X-Forwarded-Encrypted: i=1; AJvYcCW9a0CZ9oxQGg8624njip9SAW1eaxdmxMyxSHz+F8iQnQgOcLgFC84kf2catVYNwW3I2igB1XN071si93hOpCRDqHYdJr4gJ/IRpyg=
X-Gm-Message-State: AOJu0YxoM/RJFPdYm4Q3fhDzecif0bzsUP08mgzCUulAqjOqvzMit45b
	bWBK711/cOxcivQm14CGpLA/rU78BBnxo9yI/Y1vrHjcfaHD7FU4HRQiysmNNjwu4q68MiSItfV
	L45IFNL4fBLaRAoRz6iLjv1EoAXs=
X-Google-Smtp-Source: AGHT+IGookqit6t3fppSJK8FP4uPfxywqdNY4ygqwJ/Pc2p1Mj+uD00mLEB6K2NImPajkoDzpViIsVEpvVM/ehkyenM=
X-Received: by 2002:a50:f603:0:b0:572:7142:4594 with SMTP id
 4fb4d7f45d1cf-5734d6ed7b6mr16823029a12.29.1716209332715; Mon, 20 May 2024
 05:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240515234839.26898-1-andre.przywara@arm.com>
In-Reply-To: <20240515234839.26898-1-andre.przywara@arm.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 20 May 2024 13:48:41 +0100
Message-ID: <CALeDE9OrY-wdpbdOWvqkgYE6YD8SLGCw_Fo1FaBsjQ75LQcqtQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] power: pmic: sunxi: consolidate AXP SPL drivers
To: Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Chris Morgan <macromorgan@hotmail.com>, 
	Ryan Walklin <ryan@testtoast.com>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

> this is the first series in an attempt to clean up the X-Powers AXP PMIC
> drivers used by the SPL for sunxi boards. So far we have a separate
> driver file for each AXP variant, but the code was largely the same,
> just differing by the regulator ranges.
>
> This adds a new generic driver, which reads the regulator description
> from an array of structs. This is similar to how the DM AXP driver used
> for U-Boot proper works, but is simplified, since we won't need the full
> feature set for the SPL, and we want to keep the code size small.

Overall seems a reasonable approach, would it make sense to put the
regulator descriptions in a file that could be shared between this and
the DM driver so the information isn't duplicated and hence may
diverge over time with things like copy/paste errors?

Peter

> To help bisect-ability, and to simplify review, each of the simpler AXP
> drivers covered by this approach is handled in a separate patch.
> We just convert the AXP313, AXP305, AXP717 for now, and on the way add
> support for the AXP707, just because it's now very easy, and we will
> need it soon enough.
> The other AXP SPL drivers are more complex, and support more regulators,
> but my hunch is that we really just need the DC/DC converters in the
> SPL. However I need to prove and test this, so I will convert the other
> AXP chips later.
>
> Please have a look and comment whether the approach in general is a good
> idea.
>
> Cheers,
> Andre
>
> Andre Przywara (6):
>   power: pmic: sunxi: only build AXP drivers for SPL
>   power: pmic: sunxi: introduce generic SPL AXP DC/DC driver
>   power: pmic: sunxi: replace AXP717 SPL driver
>   power: pmic: sunxi: use generic AXP SPL driver for AXP313
>   power: pmic: sunxi: use generic AXP SPL driver for AXP305
>   power: pmic: sunxi: add AXP707 support
>
>  drivers/power/Makefile  |   8 +-
>  drivers/power/axp305.c  |  82 ------------------
>  drivers/power/axp313.c  | 133 -----------------------------
>  drivers/power/axp717.c  |  92 --------------------
>  drivers/power/axp_spl.c | 184 ++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 189 insertions(+), 310 deletions(-)
>  delete mode 100644 drivers/power/axp305.c
>  delete mode 100644 drivers/power/axp313.c
>  delete mode 100644 drivers/power/axp717.c
>  create mode 100644 drivers/power/axp_spl.c
>
> --
> 2.35.8
>
