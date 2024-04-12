Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D4B14C59B
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 19:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712948907; cv=none; b=S/xLQ4mGMrac3gxGdujtXo7dVOB24RJwcxIGUvP6QrVLlko7dqpmlIR2Jztq0cmyMsFbuzF09jZeu2xfSTxOmNOtsW9TtM3ObYiMrhLPRseoB/E3iwCcgKtihV+TiuWzbKQTWzPC2n9LII/x9PBkIPyEJvdLXqx2kFwa9NA7OIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712948907; c=relaxed/simple;
	bh=ZHY0B2jrDYHH28AXwuw2LEYbH6Qivb5lwAIUg7KPzaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKSTes5fIIuWXSbVYXx7Mc5pb5jk87rda1NZXEX496YRIhuAi1rOWEhUKrZla238t5ld98zxv+pWObprXWof555QlQ8VEr5cNQDpAAIc3w0u+JPsID3AS1Z/YesCHmTg76vEOhucqVSHTqzkkxBHE78StoJZBf8BH1rCIbg47qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=RyHklIBA; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="RyHklIBA"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d485886545so19345491fa.2
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712948903; x=1713553703; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hh4bjYtVZmJ141zkkU7dHeg5BG8kICTOwvRezA5T/ZI=;
        b=RyHklIBADVnOr4nWJthobOimA+FXiFUhaaRlsLYHHvKOOnZ/kdBcwb6dIXFXmTNvS1
         I9HoY8WEHxv+UTsOVC0mHFJl9Gfg3wHL1y8ZTTOwskMnU9xJsYcJvN0S+6zb+pjLgBt4
         ErfrLp2PVDelNlz57SiQxBRFIPx6KsehvqfHsiyI5bEuPedcBbTjEMe1WHgiSBD2nlDO
         YDCXmN1gmWTNibjbRb669/K2VRXwqpjhqX8X/kLMbQIfjEVqv6yZcu8wTGbLWTFejAMZ
         IKPrd9w8FIOufjbiHsmx2foC6XHfrr05PYeUkOcMAqxiA9UNmKRZEb312CEZKVVkTh7K
         FuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712948903; x=1713553703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hh4bjYtVZmJ141zkkU7dHeg5BG8kICTOwvRezA5T/ZI=;
        b=LAbUjQCasuFLpylcSaLPJBZaAUopRISpPKx+FGDgKROVrnQANA0z4L5H22lyACMN5Z
         +jy5Eu0WiSGViiVLumhaEkaQ92bJpsTU+CRH98kJIhZvJ4Won8hCgBEYhzUPfD9vqYR9
         MM2APCyc0jZ2PddxVL3fdaoDoy4OtV6ir/TYL4dt/pIKxdlTZ/rYGAKV1doCV5gJsNRJ
         qmvvttZmq4qmj2ABOUd5UpJJf53OMOdUV/vDXIPtRr69mZtTR8n+Rk2Aj15pFc0Qt+FU
         zHlFvx7IgWYBK7S5kAp0g8JsI6JGLi6V9LmAlfopTlc0c+gSz0xQZCmNUdz9o+KC5aqn
         +O4w==
X-Forwarded-Encrypted: i=1; AJvYcCWTXYxxLE5v1PU4iIkQbyXpIcaO1FIXMEnuz+aSFEMZH2k3XslGbaz0yWd+6BI0Q/y+a9NDTt0Ijy5CaEDhwsrd4oZMbW1/P6wrFDo=
X-Gm-Message-State: AOJu0YzTIqFYgsBFyIVfEWEcyAiRFCpyjszX5BfByqvjpdFmWRViorSs
	XKwHZfq33KU32YQ8NPsZ+LDfrE17q2yMJW196rAux1XxdTDs8TaWWEuxYK1zY9++10qpqPrJK8F
	Ro4NivRAiLWI/p/B+G6NCOWrFWPGZQFwLPTfniQ==
X-Google-Smtp-Source: AGHT+IGl6gAJ54LC23KvHA5AMy2AeNgnb9ohqcsVWoMxN45Bm5q+S+z58BBmNSsLopQrtbY8P8r7GU/MH9M+uL9kRCM=
X-Received: by 2002:a2e:be1a:0:b0:2d8:95de:23ed with SMTP id
 z26-20020a2ebe1a000000b002d895de23edmr3111321ljq.17.1712948902720; Fri, 12
 Apr 2024 12:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-16-4af9815ec746@rivosinc.com>
 <CALs-Hss=vuNgq-8bVL1DOR431qFpn-D13yFGn6yf_2saZO0FVQ@mail.gmail.com> <Zhl6lvZzUrCoAB8N@ghost>
In-Reply-To: <Zhl6lvZzUrCoAB8N@ghost>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 12 Apr 2024 12:07:46 -0700
Message-ID: <CALs-Hsu=SLnTJ+gsGZmv7C=K8WGHRiFCn3Q=isE9+QhawcrqCw@mail.gmail.com>
Subject: Re: [PATCH 16/19] riscv: hwprobe: Add vendor extension probing
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 11:17=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.=
com> wrote:
>
> On Fri, Apr 12, 2024 at 10:05:21AM -0700, Evan Green wrote:
> > On Thu, Apr 11, 2024 at 9:12=E2=80=AFPM Charlie Jenkins <charlie@rivosi=
nc.com> wrote:
> > >
> > > Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_0" which allows
> > > userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR vend=
or
> > > extension.
> > >
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >  arch/riscv/include/asm/hwprobe.h      |  4 +--
> > >  arch/riscv/include/uapi/asm/hwprobe.h | 10 +++++-
> > >  arch/riscv/kernel/sys_hwprobe.c       | 59 +++++++++++++++++++++++++=
++++++++--
> > >  3 files changed, 68 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/as=
m/hwprobe.h
> > > index 630507dff5ea..e68496b4f8de 100644
> > > --- a/arch/riscv/include/asm/hwprobe.h
> > > +++ b/arch/riscv/include/asm/hwprobe.h
> > > @@ -1,6 +1,6 @@
> > >  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > >  /*
> > > - * Copyright 2023 Rivos, Inc
> > > + * Copyright 2023-2024 Rivos, Inc
> > >   */
> > >
> > >  #ifndef _ASM_HWPROBE_H
> > > @@ -8,7 +8,7 @@
> > >
> > >  #include <uapi/asm/hwprobe.h>
> > >
> > > -#define RISCV_HWPROBE_MAX_KEY 6
> > > +#define RISCV_HWPROBE_MAX_KEY 7
> > >
> > >  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> > >  {
> > > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/inclu=
de/uapi/asm/hwprobe.h
> > > index 9f2a8e3ff204..6614d3adfc75 100644
> > > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > > @@ -1,6 +1,6 @@
> > >  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > >  /*
> > > - * Copyright 2023 Rivos, Inc
> > > + * Copyright 2023-2024 Rivos, Inc
> > >   */
> > >
> > >  #ifndef _UAPI_ASM_HWPROBE_H
> > > @@ -67,6 +67,14 @@ struct riscv_hwprobe {
> > >  #define                RISCV_HWPROBE_MISALIGNED_UNSUPPORTED    (4 <<=
 0)
> > >  #define                RISCV_HWPROBE_MISALIGNED_MASK           (7 <<=
 0)
> > >  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE    6
> > > +/*
> > > + * It is not possible for one CPU to have multiple vendor ids, so ea=
ch vendor
> > > + * has its own vendor extension "namespace". The keys for each vendo=
r starts
> > > + * at zero.
> > > + */
> > > +#define RISCV_HWPROBE_KEY_VENDOR_EXT_0 7
> > > + /* T-Head */
> > > +#define                RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR   (1 <<=
 0)
> > >  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> > >
> > >  /* Flags */
> > > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_=
hwprobe.c
> > > index e0a42c851511..365ce7380443 100644
> > > --- a/arch/riscv/kernel/sys_hwprobe.c
> > > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > > @@ -69,7 +69,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
> > >         if (riscv_isa_extension_available(NULL, c))
> > >                 pair->value |=3D RISCV_HWPROBE_IMA_C;
> > >
> > > -       if (has_vector() && !riscv_has_vendor_extension_unlikely(RISC=
V_ISA_VENDOR_EXT_XTHEADVECTOR))
> > > +       if (has_vector() &&
> > > +           !__riscv_isa_vendor_extension_available(NULL, RISCV_ISA_V=
ENDOR_EXT_XTHEADVECTOR))
> > >                 pair->value |=3D RISCV_HWPROBE_IMA_V;
> > >
> > >         /*
> > > @@ -112,7 +113,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe=
 *pair,
> > >                 EXT_KEY(ZACAS);
> > >                 EXT_KEY(ZICOND);
> > >
> > > -               if (has_vector() && !riscv_has_vendor_extension_unlik=
ely(RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
> > > +               if (has_vector() &&
> > > +                   !riscv_has_vendor_extension_unlikely(RISCV_ISA_VE=
NDOR_EXT_XTHEADVECTOR)) {
> > >                         EXT_KEY(ZVBB);
> > >                         EXT_KEY(ZVBC);
> > >                         EXT_KEY(ZVKB);
> > > @@ -139,6 +141,55 @@ static void hwprobe_isa_ext0(struct riscv_hwprob=
e *pair,
> > >         pair->value &=3D ~missing;
> > >  }
> > >
> > > +static void hwprobe_isa_vendor_ext0(struct riscv_hwprobe *pair,
> > > +                                   const struct cpumask *cpus)
> > > +{
> > > +       int cpu;
> > > +       u64 missing =3D 0;
> > > +
> > > +       pair->value =3D 0;
> > > +
> > > +       struct riscv_hwprobe mvendorid =3D {
> > > +               .key =3D RISCV_HWPROBE_KEY_MVENDORID,
> > > +               .value =3D 0
> > > +       };
> > > +
> > > +       hwprobe_arch_id(&mvendorid, cpus);
> > > +
> > > +       /* Set value to zero if CPUs in the set do not have the same =
vendor. */
> > > +       if (mvendorid.value =3D=3D -1ULL)
> > > +               return;
> > > +
> > > +       /*
> > > +        * Loop through and record vendor extensions that 1) anyone h=
as, and
> > > +        * 2) anyone doesn't have.
> > > +        */
> > > +       for_each_cpu(cpu, cpus) {
> > > +               struct riscv_isainfo *isavendorinfo =3D &hart_isa_ven=
dor[cpu];
> > > +
> > > +#define VENDOR_EXT_KEY(ext)                                         =
                   \
> > > +       do {                                                         =
                   \
> > > +               if (__riscv_isa_vendor_extension_available(isavendori=
nfo->isa,          \
> > > +                                                        RISCV_ISA_VE=
NDOR_EXT_##ext))   \
> > > +                       pair->value |=3D RISCV_HWPROBE_VENDOR_EXT_##e=
xt;                  \
> > > +               else                                                 =
                   \
> > > +                       missing |=3D RISCV_HWPROBE_VENDOR_EXT_##ext; =
                     \
> > > +       } while (false)
> > > +
> > > +       /*
> > > +        * Only use VENDOR_EXT_KEY() for extensions which can be expo=
sed to userspace,
> > > +        * regardless of the kernel's configuration, as no other chec=
ks, besides
> > > +        * presence in the hart_vendor_isa bitmap, are made.
> > > +        */
> > > +       VENDOR_EXT_KEY(XTHEADVECTOR);
> > > +
> > > +#undef VENDOR_EXT_KEY
> >
> > Hey Charlie,
> > Thanks for writing this up! At the very least I think the
> > THEAD-specific stuff should probably end up in its own file, otherwise
> > it'll get chaotic with vendors clamoring to add stuff right here.
>
> Great idea!
>
> > What do you think about this approach:
> >  * We leave RISCV_HWPROBE_MAX_KEY as the max key for the "generic
> > world", eg 6-ish
> >  * We define that any key above 0x8000000000000000 is in the vendor
> > space, so the meaning of the keys depends first on the mvendorid
> > value.
> >  * In the kernel code, each new vendor adds on to a global struct,
> > which might look something like:
> > struct hwprobe_vendor_space vendor_space[] =3D {
> >         {
> >                 .mvendorid =3D VENDOR_THEAD,
> >                 .max_hwprobe_key =3D THEAD_MAX_HWPROBE_KEY, // currentl=
y
> > 1 or 0x8000000000000001 with what you've got.
> >                 .hwprobe_fn =3D thead_hwprobe
> >         },
> >         ...
> > };
> >
> >  * A hwprobe_thead.c implements thead_hwprobe(), and is called
> > whenever the generic hwprobe encounters a key >=3D0x8000000000000000.
> >  * Generic code for setting up the VDSO can then still call the
> > vendor-specific hwprobe_fn() repeatedly with an "all CPUs" mask from
> > the base to max_hwprobe_key and set up the cached tables in userspace.
> >  * Since the VDSO data has limited space we may have to cap the number
> > of vendor keys we cache to be lower than max_hwprobe_key. Since the
> > data itself is not exposed to usermode we can raise this cap later if
> > needed.
>
> I know vendor extensions are kind of the "wild west" of riscv, but in
> spite of that I want to design a consistent API. The issue I had with
> having this "vendor space" for exposing vendor extensions was that this
> is something that is inherently the same for all vendors. I see a vendor
> space like this more applicable for something like
> "RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE" where a vendor has a specific
> value they would like to expose. I do agree that having a vendor space
> is a good design choice, but I am not convinced that vendor extensions
> are the proper use-case.
>
> By having RISCV_HWPROBE_KEY_VENDOR_EXT_0 we can expose the vendor
> extensions in the same way that standard extensions are exposed, with a
> bitmask representing each extension. If these are instead in the vendor
> space, each vendor would probably be inclined to introduce a key like
> RISCV_HWPROBE_KEY_THEAD_EXT_0 that returns a bitmask of all of the thead
> vendor extensions. This duplicated effort is what I am trying to avoid.
> The alternative would be that vendors have a separate key for each
> vendor extension they would like to expose, but that is strictly less
> efficient than the existing bitmask probing.
>
> Do you think that having the vendor space is appropriate for vendor
> extensions given my concerns?

I do see what you're going for. It's tidy for a bitmask to just let
anyone allocate the next bit, but leaves you with the same problem
when a vendor decides they want to expose an enum, or decides they
want to expose a bazillion things. I think a generalized version of
the approach you've written would be: simply let vendors allocate keys
from the same global space we're already using. My worry was that it
would turn into an expansive suburban sprawl of mostly dead bits, or
in the case of vendor-specific keys, full of "if (mvendor_id() !=3D
MINE) return 0;". My hope with the vendored keyspace is it would keep
the sprawl from polluting the general array of (hopefully valuable)
info with stuff that's likely to become less relevant as time passes.
It also lowers the bar a bit to make it easier for vendors to expose
bits, as they don't consume global space for everyone for all of time,
just themselves.

So yes, personally I'm still in the camp of siloing the vendor stuff
off to its own area.
-Evan
