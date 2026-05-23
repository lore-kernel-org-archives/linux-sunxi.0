Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6E139B96E
	for <linux-sunxi@lists.linux.dev>; Sat, 23 May 2026 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779544528; cv=pass; b=MlOiAJUPo+gSq3Th59SX/1Px8Am+sylqEXm9L/OebDJ1oroXZjhZF7135rxTQHK6U0fTde/zZe4VnQ42gW4QCK/HxQsgPSvWGFQBYpizMA4SLMlPxKCkbzzSbcF0jIDlHwkQAGZ/UkNc1BX7OJCnW5bH57RWnzdamT68KWiRHKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779544528; c=relaxed/simple;
	bh=nlUJXscAj5QuomRn5O6cvpNus9+sfZnlQG7j0zzSF+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBN12gwfmgJTrVNH7LKPUeqXiyuK/UP615cXkcOs1wDGLQucoMFAfZ+LRXG9eQ0EgYm+euSjTkciHIE4+GicDdPHrNqisTliQdUAoSZykLgXqKLiluxxzr4b5lgi7zq6Itj98VzwAU5+BvN2Nhj4TnaLY3xRhreArNeCigv+VzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHRTQ+/e; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHRTQ+/e"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b45cb89f7eso55863025ad.0
        for <linux-sunxi@lists.linux.dev>; Sat, 23 May 2026 06:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779544526; cv=none;
        d=google.com; s=arc-20240605;
        b=NaXr329UmRqoxbLFLY5wPyOrZSmUsaA09344u/8f6utV3Ygyyfj8DznRECEly33ghX
         SxWRPf0AQsH7q0YVIGkZdAxs4KqXUMqHRL4cCIJvJSoJZG/m745EOJUZeZdU2YIssBPe
         nLUPBkZNX+rbxBKQqbTQd5NITAdlICkRJuPgr5OzNqRMaNQvXm+pAqTSXxV7g0Yx/IqJ
         3QPgoY5OjNMcPq0UpgJQdNAGIFugVGfZD9Ha/ZHAk1vO0bqbNXDr7okO93DZsHeQ4xIH
         mr80TMeTjm6vt0uOLlwjjUAkGh5qCXuI3VXavUewOyrG/GXdFhu5D+d5K31PpffJBZUY
         q4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nlUJXscAj5QuomRn5O6cvpNus9+sfZnlQG7j0zzSF+k=;
        fh=7I5UatxRTI4E+DxfQXJLhT45/8KY0FJe+9OpnIeqRwg=;
        b=SXFQj5wyGzcWF+DR3+mxDalGL1vUTWGBkb4pxumVXGtur69vJ+dBS+qGVgb7BOabxy
         WxhSvTvKjP6yYykpO6MFcFZkXNQDMTQpLX8FExBv1ED35BSTzlusv6As3wvpVbsPrSzc
         HYatZxdah5omcO5fdH7nbqpk36xsu2D6mK1SbalF0r+TkMPeODlaPUkEc8fa6lhl7Ysd
         zlaAP0QPly9zJozMjZqCQwu8zGQvA4w9S/zRbDoj436EJnkg2YQy5YhogqZZaxftVPJz
         joxyLQ/ZSGQa4ikr6uqMedtImeyI7xCpwqZuaI8hQhkPtGcHHNsr0mZ2rnmH3E2uslH2
         j1Fw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779544526; x=1780149326; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlUJXscAj5QuomRn5O6cvpNus9+sfZnlQG7j0zzSF+k=;
        b=WHRTQ+/esIT7KEdtSYhQ4JJDKCeWQIiQ5RmjxVvXoW/q1DCTPgTqlBH2WbGNhTL22V
         OZB6rOsaLFD0mIyCRA+doKktmZ1zBUnJCGxt3gbzpdM17MFWmwvI2TfgQdwdg4JKXriZ
         mQw6Ljwi873mT93+O4/INcCI/EqtLSelHpo1Fnclr0x25YYwpF7f8Rag0X8moQunqRi0
         PoKkWG2uguDOOJOmTreMNIxyKZsDXubCTM0GKs22tg6fBv/Jtg0E46ysm+THHOa/m6on
         xKm9GUOmgBdiHx5oAfvjw+wV7CAUVBL+tjby47qNJT48UOnDLmI/dmSBeW7plPPSqR24
         pKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779544526; x=1780149326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nlUJXscAj5QuomRn5O6cvpNus9+sfZnlQG7j0zzSF+k=;
        b=bSNS1kDT1rXgk09DXq+e8dsaUk6nCPfkXw3+AYuIQBQo5zz/HMDXIXzIHpaWFYysAJ
         7vQ2YuDDus4CS8uBycddbtBtiZr9aUItw8SNNuVzvfLS0hywaCpEsxZOeqlNR/kfrSiQ
         fSj7BCVrkCH50vXoo1ZWdxs0FCQIMtpYHUDj29nDVkVKjoVVpKK/qj5/uABB1M46fZxi
         6/OT0NtqTGzLU3SkWRqOU9JrHSUVb6OFanmxQgV62FdWH70xfnVvui2XbR/7DGDNVPHr
         w0MYG0QjcdTBB4MwUDv3O3usu3JK3sNAG+JKcDRvScuFEbs6r8TcXzuErRhB8JWC7LY0
         G8ig==
X-Forwarded-Encrypted: i=1; AFNElJ+GT7jI4GEOIbx5HwEI9T8BRC552oCPTXOiwGZkGZnVZn3qXXlF+FE/mL0He5AT/GZ+nZEEClcijNTcOA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3GqmReYEqvjtRzSmpQQfLdrIi1b6/zLKdCfi+hQ8o649F8vYS
	AaXDlc6wlvjWRLZx5JPY9eGl58v4p0m/94nRep7ep0Pzb3rTPYQGPq1iKW0H7bUGOSMPYuJhWqI
	MgYJzcDN3O/oz5UrzZ+gyNWTjiuUD2G0=
X-Gm-Gg: Acq92OE+9y+toQn1mXFHarfj6UXGus2SwzbWjB11FUtqK2SxaPRi4716nhIlqc9BMl+
	rMmXUFST8WDVGqAABQ4210UAf0rfun2o/Bv6sYWhwcaKyHjktZDCjzy1s6pBSJLIgbFCS2tAvv7
	ipnT2LSvEM0Z0sJXJVio1GDUtCp+GaDL6cl96zKH6Xu+0bJTCoA+bXB1lDtmb0nP1Kp0k/kPKhl
	D4sDQG7r4rY0UQa5zO/SRzffsI1atasySdxxwY9Off+NqgxMEmMjHccsMoaDJugoSaFFrjMYVHP
	7HAUpdUM+s+iQX3ofX+ByKKKUTrp6cZMxt+iJIa2vMjg02xz7Sdmg5fEfm06NJu41SmDtC4pZ6V
	PuR6Al4g=
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id
 d9443c01a7336-2beb037a5ebmr84878125ad.17.1779544525740; Sat, 23 May 2026
 06:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-3-phucduc.bui@gmail.com>
 <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
In-Reply-To: <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 23 May 2026 20:55:14 +0700
X-Gm-Features: AVHnY4LdsB2vxkXWpfCH6RC9wHMSLxokWJG9po2ovVtNcvhv5VoQTpPnz_GBIew
Message-ID: <CAABR9nEB8jizn+NrVgrjcOOJRtaU0u+TH705unMTh7HYO=8Wcg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Sat, May 23, 2026 at 2:19=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
> And when you do add patches due to Sashiko raising an issue, please
> do mention it in the commit message.
>

As mentioned in the v1 discussion , this issue was originally reported
by Sashiko.
I'll add the Reported-by tag in the next revision.
v1 links:
https://lore.kernel.org/all/20260513105003.81880-1-phucduc.bui@gmail.com/

> Did you actually reproduce the issue, or did you add the patch simply
> because Sashiko mentioned it?
>
Since I lack Sunxi hardware, I couldn't reproduce it or perform runtime tes=
ting.
But I did compile-test the patch.
The patch aims to fix unsafe register accesses that occur before ensuring t=
he
device is runtime-resumed.

> On sunxi, either it will hang the system because the bus transaction
> got ignored, or it won't as something else enabled the clock.
>

If Sunxi's PM design already guarantees safe access here,
feel free to reject the patch.

Best Regards,
Phuc
