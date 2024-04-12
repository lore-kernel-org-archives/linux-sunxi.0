Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE753F8E2
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 20:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712955190; cv=none; b=TKC9fxR7xW5PXz0mrVBWxFeul/HU8wg9gT21e0Dy7VLnBNdg8jcGGOdbCXBzvdHPoqYCZu6sDc5BiWzd3kLMkflmBf+5KIhe+p3GxlwWsAScZSrdbH/Ny5eXQwNGb6VEam4gAzz5VKm7Jpeicjdcj489ANBb+6TTJxE+wzbk0ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712955190; c=relaxed/simple;
	bh=qGcc/rgVjEIkz41rcNhQCOoE29RUhq2mJkMJFN2mQyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiK4gn//SPNV3zx4M8S4TFU1wE6YyGxicODQp7GE2V/1iHsMOJ0DDo5jVatZvLQPm84xZrbBti3ulmqjAHzOjw1qfObFTkmd/h7lK9LPEEvQQSnx38U/KrXikZjU/Ci0s4rObn/djjxBvEmymsp6yOSXpwjvoo9Z/bzbVhnjMvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gfEdjmum; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gfEdjmum"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ed267f2936so1109692b3a.3
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712955188; x=1713559988; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kuI1xDSDY3wZqRxOoGKgeFXQbOBRCo2OPPgj3TfcWU4=;
        b=gfEdjmumr9BTPGANHTZ6GW8J4eX8IlLtfRCagHtw612jykpK7JOPoe5qwbv/xiRBxs
         55kU0qDE6zkq7WcLjhzHzqU1XTGow8MESHES4OuFfDoCUrVhVCg3U/NtGJj3IOnsIppV
         JJsICDlyPZHm1rFXj1K1kiNz708C6eoa/sKIh9BzJagHLq8YRbIijvMfNfeG4xitGtZR
         8wsuzIRUOvAC1LIkX0l4xP2PmBs/+yZEgCwzqtyQ5QbtTch6Ngv6BkUMn38p8qY2UCHO
         1vX1g0AtbtV1ENV6VDGUs2KxpgNw7VREYvFXOuISd7EWVTcwRrNz7Hl3hFGY9FTbbv08
         DGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712955188; x=1713559988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuI1xDSDY3wZqRxOoGKgeFXQbOBRCo2OPPgj3TfcWU4=;
        b=bdIMeCS2qSoQYU5R+Le++CEtPK7ZrFukok0zS7PIlDhSciZwWontqPYwHrZPAyTLwh
         /FVM6AFLzgUXAz+RT8sPTXN2kFO57pScs2t4Q0vZ4eRiaNWJYFT0D0y1inU9vr9RR+Rf
         E/1Xg14Q6sLKjJfMqah/Kl5TC3ybwY/i8rXob9SFEWl6IW9wTccdCORl2TkNorfKlt3c
         CW7JQH5Wi+ua1yKkDAI15mMXteDCXHGaWFASnWH4I7icvL4aD553FqD2b55DYMSMx9ZL
         nCzzZhfCl6MBCPNCidEDw8xNUKr1azm6M4boAETh3bRp6S3Sn2Plg29ImYs18Fl5ew6U
         bMfA==
X-Forwarded-Encrypted: i=1; AJvYcCUkjmli8tuZiRfZ7zfa6cmH6KgUL/IPcHbH+VuTM2RZjV0I/Q9TzyQ5Skyyu9bhZydMWS0HAEu55AJJQBc4Zu4rb2v3cH5IU7/euPU=
X-Gm-Message-State: AOJu0YwcBS/X+lszS540iimfci/3tJAX1DSKZDSKkVJEJfeipEvi185A
	w+CYqHwWDYY0ejUyZBudA5Xb12a+0czlsGhA0xEloFHbjpi71K6hQSWmY/P0Ao8=
X-Google-Smtp-Source: AGHT+IHrp3HzycZe7Jfb+XseUZGp1zZGIQ3nFRwoibOMYKPLe2QkUbH6yPsYO0522TOlVaFgwYmSxw==
X-Received: by 2002:a05:6a00:1798:b0:6ea:bdbc:6a4 with SMTP id s24-20020a056a00179800b006eabdbc06a4mr4030047pfg.13.1712955187671;
        Fri, 12 Apr 2024 13:53:07 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id j16-20020a62b610000000b006ecceed26bfsm3264351pff.219.2024.04.12.13.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 13:53:07 -0700 (PDT)
Date: Fri, 12 Apr 2024 13:53:03 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 12/19] riscv: Create xtheadvector file
Message-ID: <ZhmfL4Nutu8s4SMF@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-12-4af9815ec746@rivosinc.com>
 <20240412-thirty-sacrament-db052c7fe6fe@wendy>
 <Zhl8Y+GzTB/ip7rT@ghost>
 <20240412-displease-sensually-33d91fc3fe63@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-displease-sensually-33d91fc3fe63@spud>

On Fri, Apr 12, 2024 at 08:00:46PM +0100, Conor Dooley wrote:
> On Fri, Apr 12, 2024 at 11:24:35AM -0700, Charlie Jenkins wrote:
> > On Fri, Apr 12, 2024 at 12:30:32PM +0100, Conor Dooley wrote:
> > > On Thu, Apr 11, 2024 at 09:11:18PM -0700, Charlie Jenkins wrote:
> > > > These definitions didn't fit anywhere nicely, so create a new file to
> > > > house various xtheadvector instruction encodings.
> > > > 
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > ---
> > > >  arch/riscv/include/asm/xtheadvector.h | 25 +++++++++++++++++++++++++
> > > >  1 file changed, 25 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/include/asm/xtheadvector.h b/arch/riscv/include/asm/xtheadvector.h
> > > > new file mode 100644
> > > > index 000000000000..348263ea164c
> > > > --- /dev/null
> > > > +++ b/arch/riscv/include/asm/xtheadvector.h
> > > > @@ -0,0 +1,25 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +
> > > > +/*
> > > > + * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
> > > > + * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
> > > > + * vsetvli	t4, x0, e8, m8, d1
> > > > + */
> > > > +#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
> > > > +#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
> > > > +
> > > > +/*
> > > > + * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
> > > > + * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
> > > > + * the call resulting in a different encoding and then using a value for
> > > > + * the "mop" field that is not part of vector-0.7.1
> > > > + * So encode specific variants for vstate_save and _restore.
> > > 
> > > This wording seems oddly familiar to me, did Heiko not write this?
> > 
> > Yeah, I wasn't sure how to attribute him. He wrote almost all of the
> > lines in this file, but I put it together into this file. What is the
> > standard way of doing that?
> 
> The original patches have his sob and authorship, so I would at least
> expect co-developed-by.

Perfect, thank you for pointing me in the right direction.

- Charlie

