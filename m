Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1ED15217E
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 22:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712959752; cv=none; b=Z93tWki+TKXfH3dp5lNwh6fzMJqSkdgIqSDBAdreILN0LhG5yWKwBKlMFPA4G6/eGcIme6VuzF2RCv8w/qkRNMdZkS+xd2k4uI9gFt9+iLayr5RTD80DAcjVYUJWaFDciIxxQXpYvVNr9XFE87qqk1pcbYXRw6BGLxxGRwnbz0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712959752; c=relaxed/simple;
	bh=2MgrN6DIBk4r15lQzhiuJv78bk5vHq4Hl6rKok+6bn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpSu+7QYbksUAVcNw8WfQ/grhlPkFHVIxV/CU9Y89ZOmBVv9zCA1SvVUiqv9r/7NGhxaN4GRmdcylyeTuq6wqkvSBFRfVBMNW06kaglxKU25N8NROmSjKNe0N0TsUBIP1f34qz+b0rHv/oy0YZIGrWKECU0lnWSqzq1kUPgsQlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=j/4MD83n; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="j/4MD83n"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d715638540so16035931fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 15:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712959748; x=1713564548; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/M8t1HBqBUuifShlatgwWqMHKd8yfGcHLyOfE8iWiY=;
        b=j/4MD83n19qsBIzraIwuzrDrSfkJEW5XSF3HUU/fgoMFCtaS+yxb4uTJt7C9HI0VsQ
         Xl54zysp2CvDQTwVxQkqsiSCbxzrjyG2w+eXewYWHY04dYGr2NkILG2zRdObtXxlURnP
         jKyu1lVv0tNTQWTM2qeoAO3rcPTB+AtIQXo6XWg7QpeWSmLL83gvYbcLBzKdxr59D262
         5dtxrSJzfOQ4HMIc3sAu/iJSrb70EkWC5OS0hMOg9P9R5W7NVQBGESgXpdih+6dXX86Z
         rVWqmYWnFvYt5rBfF69IWBnlPyQyGSvBENIzzPkzwWB2R23jQQKhrBONrTnxguDyv2Mt
         EiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712959748; x=1713564548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/M8t1HBqBUuifShlatgwWqMHKd8yfGcHLyOfE8iWiY=;
        b=gUPbqWQJ3VL7j4UDkBnGJLIi7xBSf2jviWJCo+54EBUw8DfSbatd+idivklvP49H2C
         Vw22Rx/b6Otv4iEZKHP3cDumjMnb2zG1dqpXw8he0ZeBF99kXhYxnLtWNcvs1rUeRsBQ
         lRQYY8w6iBqTz/V7+A22vBlG8Mshu7Z9Zp7VEBESoGnXHwM3UhG0yDvR0a/r4BCrrmG2
         ComwwAbH2U6H64Zweh74OZskS50wWeZPwhvrQmT9OB+9h5MRyqVmJc/4zfbPCXdSJxsj
         f190SmNQyXnHtw0DTNUxA3p1f4TfO0usWFC/XqW+7t3I0PpMVG7VZkgKmvWqgDChEc11
         bYBw==
X-Forwarded-Encrypted: i=1; AJvYcCXhJqx8jdefF1gW0eDee7IftBWw7fTXLnZ+rIH22TWCNSc1+KBC+ZyPN5oE5Qso84nmwALlHpECJLKlxMk5Zhtd8wuXakt3ttVdnVM=
X-Gm-Message-State: AOJu0YzsLztrtmuOb3BqYuaFk+Quozzkn8ELvrGlmGad8KMggidE8Idt
	2NjRb0WurmMmNBLt7qTg+BjrsEUiOGBmjW6yrjWP+C99bJcH1ZO5sOOhQ00PquohQkaSl/Qb1CP
	+0K6FoZiLMIdhCZl8LRERbbaDhNHmNksPYg7mBw==
X-Google-Smtp-Source: AGHT+IF5C2wBUyoWGN92/R3KsVleYtMZwSgDPoheRn1Rem16KloXuSobCZbrLHetSul7X4faQjk9YDXOny1oTJbkyFo=
X-Received: by 2002:a2e:9e93:0:b0:2d4:6aba:f1a3 with SMTP id
 f19-20020a2e9e93000000b002d46abaf1a3mr2395096ljk.6.1712959747751; Fri, 12 Apr
 2024 15:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-14-4af9815ec746@rivosinc.com>
 <20240412-moonshine-acting-0df1a90b86d2@wendy> <CALs-HsviR8E-sRvzz7pd5eVGb4+XsAdG1hhbZOPf+m3Cu4JP_Q@mail.gmail.com>
 <Zhl717rsQ7XLBe2F@ghost>
In-Reply-To: <Zhl717rsQ7XLBe2F@ghost>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 12 Apr 2024 15:08:31 -0700
Message-ID: <CALs-HsuL8A87mCRU2+1F2sEPYmZWTz_MFwAys0h=1uKhb7EYqg@mail.gmail.com>
Subject: Re: [PATCH 14/19] riscv: hwprobe: Disambiguate vector and
 xtheadvector in hwprobe
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, 
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

On Fri, Apr 12, 2024 at 11:22=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.=
com> wrote:
>
> On Fri, Apr 12, 2024 at 10:04:42AM -0700, Evan Green wrote:
> > On Fri, Apr 12, 2024 at 4:35=E2=80=AFAM Conor Dooley <conor.dooley@micr=
ochip.com> wrote:
> > >
> > > On Thu, Apr 11, 2024 at 09:11:20PM -0700, Charlie Jenkins wrote:
> > > > Ensure that hwprobe does not flag "v" when xtheadvector is present.
> > > >
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > ---
> > > >  arch/riscv/kernel/sys_hwprobe.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sy=
s_hwprobe.c
> > > > index 8cae41a502dd..e0a42c851511 100644
> > > > --- a/arch/riscv/kernel/sys_hwprobe.c
> > > > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > > > @@ -69,7 +69,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe=
 *pair,
> > > >       if (riscv_isa_extension_available(NULL, c))
> > > >               pair->value |=3D RISCV_HWPROBE_IMA_C;
> > > >
> > > > -     if (has_vector())
> > > > +     if (has_vector() && !riscv_has_vendor_extension_unlikely(RISC=
V_ISA_VENDOR_EXT_XTHEADVECTOR))
> > >
> > > Hmm, I think this is "dangerous". has_vector() is used across the ker=
nel
> > > now in several places for the in-kernel vector. I don't think that
> > > has_vector() should return true for the T-Head stuff given that &
> > > has_vector() should represent the ratified spec. I'll have to think
> > > about this one and how nasty this makes any of the save/restore code
> > > etc.
> >
> > Yeah, my nose crinkled here as well. If you're having to do a
> > vendorish thing in this generic spot, then others may too, suggesting
> > perhaps this isn't the cleanest way to go about it. Ideally extensions
> > are all additive, rather than subtractive, I guess?
>
> This was the "easiest" way to support this but I agree this is not
> ideal. The vector code is naturally coupled with having support for
> "v" and I wanted to leverage that. The other concern is all of the
> ifdefs for having V enabled. I can make all of those V or XTHEADVECTOR;
> that will increase the surface area of xtheadvector but it is probably
> the right(?) way to go.

For the ifdefs, if you've got a Kconfig somewhere for THEAD_VECTOR,
can't that just depend on the V config? We'd end up with the
limitation that you can't add V 0.7 support without also dragging in
V1.0 support, but that's probably fine, right?

-Evan
