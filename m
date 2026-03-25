Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6851DE894
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Mar 2026 00:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398578; cv=none; b=tJ7n4ngYkKQX5/CWYqJh/ziJR6KA8k4qH+lWM9watpQIBtn8l+dnYywIW3wmhuE+2ld//eMvyVbKlleq+LSTV0sam4DbliFwmGSeViaLLnM4H4xR2j9nJEGYeugQ+6MltheOojZDgfodkofXZZR+P+sep5U2Uz0q1Eo6GEago0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398578; c=relaxed/simple;
	bh=By3Ou6WJvbdPzgAPVPN5nuBbD6epbX0LP9TideIC+RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCFHc3w16c9Ufrsudc1Xk7gmKORBdYrl3worRQWdUzfjqQ4O6oWqoAPLvzlz+stnMgrUWaAw8PnYjuWBDoCekZwCzXqCkAJXSZQshFpCTJuEDHfVmCy3a60BFj8U4q0tOWclmXz5nXw6r4MVGpBU7BWT3aiIyfg9oF61zkPyA1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCOGRuDM; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCOGRuDM"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50b3488fb31so5432841cf.1
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 17:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398575; x=1775003375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVriyXCxKTMRvh4VYnzoi9ecmHg2bwe0SbN1igFKrG0=;
        b=KCOGRuDM7b2JxVlwpMSHUFZB/EzhOetwTiZTD7b/s8+0fyyVEqWineh507XWqnoCLc
         eG2krgsdQBBD+dlRKF9K3dyn40X+n2zvYPcLKK5dq27439Rb8B9qWvd+pvBtjtNh66aK
         X0SmtNbsgdGYHTbiKz9rLiPOPdAGUZ6mAtKe7y8cKHNSPlH7HmKSRh0VqyaAVR0xqv8Q
         ekboNgiYRREwQx60mCzUftZQR4Ey2ETnGeERj8C4MbE4+Bu2jmDnbuKnX22BS9VMDZ5o
         21dFnNeg6ili2myz2vjwzmlCUMAmACa3OW+vXJNiabZgkiSM3cr64t2m5dK2E7mZTQLY
         wk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398575; x=1775003375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yVriyXCxKTMRvh4VYnzoi9ecmHg2bwe0SbN1igFKrG0=;
        b=ewqDufhVinKtvy0Rv1rJJgrRWxePYFTPUQYbRBImM+j/x4cFewUHWA7kKOgLxMYpI2
         pPXhPQKk2SgLuT7ZvKdKUWfwv0bxexbkHAZzcdN5firM7HOr2EjWLp9hcvz4GAKDxokH
         TIuvz66qcGj0wo1oxOJovVEnFdDd5dxOhLW/aTBBKtT19xYs2vh+aWXH9wZSddLEUS7O
         X807rp6vBXHF8z3SsobdMYmAJF4MClbgM2ItxUEUxNsoEsQIQhRlqHX6yoHYExD3vQ4p
         fNPS+liq9Vyz5eoAbMs+Y7ACCygieqpGhKxvHx0clJdeNg9G4p8PHaxMnlkZrhSu78ui
         PXgw==
X-Forwarded-Encrypted: i=1; AJvYcCXyS9VzIESyrsV48i4/boaZtaS0SWpKHcv8nfk8ThvdCqQoQnZH+ov2dyZkC88lgbQngHp4mfv/67mi4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgOkKV765G9FIXFXyG3NbUe6qtfY3yH5XB8+kAOyZU3p4UavMp
	VJ8lFwt2ve6WLXsfhTegNEGCryq8AriFISQva3fmAmkqOgO9Dq2TgDzuXcWQMKd0
X-Gm-Gg: ATEYQzxDbxqqtHm3c2VOwgcG1SWbnC5qyQAM49OIzVN0rDWc77+iQVS80LcsBovr3ib
	jrKZjlFoIQVQx/m2MdelNzqEeKzKaPJtBUlKcQxJh6iHHGXtc1PmPv6u8Tv314gLO/UH7qCRyXT
	zeFoPXip9nC+t63w7MKoGhaMAotlcB+1TnR4fbKpBWnTdFQS9q1kifsBzwCE4c9xQzME4IZrBLX
	PAKqbDbYhWvo1DQ5jZxiVoRJg2CElnk7ZXwebGOwwIRNHn/fuq7yfWvCzFjzYXjL+oX4Zkt3NTR
	L8fXH5ibFlQqrXmq9E54HKtDykN2axWcuVIzb1LJ4cZfCVw35UG5RjxrqgT2CroyKE3a1XXpB0H
	ne6Sgk+5N7vlhj7X4EMpCLsq4jzXkArp1wnbWVFgSJCDN2SZCBRV0iyxlGyvXc47vag8W/0RSyh
	nh9x9spYNngAUecRkgNJAlqYcFIv+mBiAAmq009g4omeSZjB2rQkkxLKne1DFvAcl+Y6ShEu0g7
	HARO4aiIg7icw==
X-Received: by 2002:ac8:7f92:0:b0:50b:2dd5:2be with SMTP id d75a77b69052e-50b6ed70684mr73711441cf.13.1774398575338;
        Tue, 24 Mar 2026 17:29:35 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8534f9ccsm129996976d6.39.2026.03.24.17.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:29:35 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] soc: sunxi: sram: Add H616 SRAM regions
Date: Wed, 25 Mar 2026 01:29:33 +0100
Message-ID: <3682916.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20260324164357.1607247-7-wens@kernel.org>
References:
 <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-7-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:43:54 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> The Allwinner H616 has two switchable peripheral SRAM regions:
>=20
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
>=20
>   The mux value for this region is different from previous generations.
>=20
> - The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
>   KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
>   CPU access is disabled, the whole region reads as zero, while writes
>   are ignored.
>=20
>   The mux value for this region is the same as on the A64 and H6.
>=20
> Add data for the VE SRAM. The register values were taken from the BSP
> vendor kernel.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


