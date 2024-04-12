Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFEA14BFA2
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712941523; cv=none; b=uwjrj1YoMJ07im16tk3no2YjLtyIYmD+K7HHf8oxoDGRCPespwhGbquu2Oege4mMBwiVwGQcKRj9/eVU9/fhL6XIg5Xqh6qOvDx0fEm7UIr6l3Z5TqUvRkhGDXYJyeOwbqO4RhnKchxoQtzZ0R/oGI54VqEKFLtU0S2q8DeYhhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712941523; c=relaxed/simple;
	bh=0iWl1Io+EcPTnphzUKNTmq8fNPf9pTiT7i8KtPiB01w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfXOlQG4G2DTskw76437F+/0le6sn1SGpRYzOHAxCsG2F3g+SRW+Hv3FA4fio/DBCA/sdb6Y3WLXaP8AqXfbBus+AgUIFNURZxrusHjpA8MW89IawLu/dz6stv3Clc90m+9VC5aLkJH5vb8Eh1+F11s7RqCCJfWYaeqAauG8YOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VKtVvnID; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VKtVvnID"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516d3776334so1484500e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712941519; x=1713546319; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2+F6Z5+nSqcwJp5/u9iM3I5euO/lGGwbVB876NJ+N8=;
        b=VKtVvnIDKi0/wdq+5W1Wnyma4EVJCyx85yol/CrWDX8Vddc5otEZDG3ao8a3uFNOMP
         7i8VQ2DXxvTegSzcdJZFRWPXqRK/XjSo2x8KxEc6nuj7K0QZ1lXHafLbJyspaq39h+fM
         rdHBk/2xEU2so+rgCjU1uVLnjxvFwn289EgNfrdFiPG7hpc3T/J8WHCz+fyz65kksXz0
         8BB6haVZwTHNdI03dp9AJgEtwHSmz+FSPrT5UayQEROWa/1MDS1m1luH9tlWQUdYBHTT
         /dqe2DfPpy0ImybymLYH1AYYxP0OokAc8UMN073XtpiB69EmG114IfzBCEgqdT9qGvFD
         xrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712941519; x=1713546319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2+F6Z5+nSqcwJp5/u9iM3I5euO/lGGwbVB876NJ+N8=;
        b=WG9fTpl73KjA9fvt4mC/M29x0EmzWZtAW3bs/ixwP7KC3pPzBqrYeqVLlJHEvNTzIc
         Pj0P38/OisPg3wSJ9OsVEYMcwb7loDfxzlj8tDrYBG1khe9yTWe7nVouw154SRBy1qF4
         2UxDnkVsdYX8Jqau4zzArjILMwf4huPZtLHMVOXKOaiviKDpN89y4jo/GPaw0d8HDHZb
         CL/TxfYqL9NSeNwAUA8oD97hPXOcbxSUkSjykbMeZLOl7uf0n3FpThZI2ejOI4zx73ud
         Z5yUburecSDhqmcOuSTmXGImE6AP/p3WGUkjcJcPgRd9CsSyTZNWbNhGZ2XLMf3CNWr4
         04Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+MEAtmZtdL8V8Mv1o++pm928fdheZwqnRb4SOrS+YeGfK1twpaBfnQ5ms10+DXIUUqo/9e/7UkmaVzz5e7QNTgWis8laf/5b09I=
X-Gm-Message-State: AOJu0YxYDbtAvqt5gUqWAamXbGVu33tACEkMBWJWAh1bsfPTBg1zeDz9
	43JZor8HWVBnz94CfXCdd81rLTKb3IZpVWi67fJ9BqHvt76n1YzFWPj9tfqvySoUMJrvNguoclv
	9U1vqallTsUNxuQtWtOnNGiuvkgafib4qHqbYNg==
X-Google-Smtp-Source: AGHT+IFTwWgekolEJQkFIbbTNtxauFKuhwni5/Gb89sRytgSj62M43pT7a0jCUkjzdpqZU6SGxa9xotVOWrotjKfpBI=
X-Received: by 2002:a2e:9b06:0:b0:2d5:122a:4b1f with SMTP id
 u6-20020a2e9b06000000b002d5122a4b1fmr2435885lji.43.1712941518949; Fri, 12 Apr
 2024 10:05:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-14-4af9815ec746@rivosinc.com>
 <20240412-moonshine-acting-0df1a90b86d2@wendy>
In-Reply-To: <20240412-moonshine-acting-0df1a90b86d2@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 12 Apr 2024 10:04:42 -0700
Message-ID: <CALs-HsviR8E-sRvzz7pd5eVGb4+XsAdG1hhbZOPf+m3Cu4JP_Q@mail.gmail.com>
Subject: Re: [PATCH 14/19] riscv: hwprobe: Disambiguate vector and
 xtheadvector in hwprobe
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 4:35=E2=80=AFAM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> On Thu, Apr 11, 2024 at 09:11:20PM -0700, Charlie Jenkins wrote:
> > Ensure that hwprobe does not flag "v" when xtheadvector is present.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/kernel/sys_hwprobe.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hw=
probe.c
> > index 8cae41a502dd..e0a42c851511 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -69,7 +69,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pa=
ir,
> >       if (riscv_isa_extension_available(NULL, c))
> >               pair->value |=3D RISCV_HWPROBE_IMA_C;
> >
> > -     if (has_vector())
> > +     if (has_vector() && !riscv_has_vendor_extension_unlikely(RISCV_IS=
A_VENDOR_EXT_XTHEADVECTOR))
>
> Hmm, I think this is "dangerous". has_vector() is used across the kernel
> now in several places for the in-kernel vector. I don't think that
> has_vector() should return true for the T-Head stuff given that &
> has_vector() should represent the ratified spec. I'll have to think
> about this one and how nasty this makes any of the save/restore code
> etc.

Yeah, my nose crinkled here as well. If you're having to do a
vendorish thing in this generic spot, then others may too, suggesting
perhaps this isn't the cleanest way to go about it. Ideally extensions
are all additive, rather than subtractive, I guess?


>
> >               pair->value |=3D RISCV_HWPROBE_IMA_V;
> >
> >       /*
> > @@ -112,7 +112,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
> >               EXT_KEY(ZACAS);
> >               EXT_KEY(ZICOND);
> >
> > -             if (has_vector()) {
> > +             if (has_vector() && !riscv_has_vendor_extension_unlikely(=
RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
> >                       EXT_KEY(ZVBB);
> >                       EXT_KEY(ZVBC);
> >                       EXT_KEY(ZVKB);
> >
> > --
> > 2.44.0
> >
