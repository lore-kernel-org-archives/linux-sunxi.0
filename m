Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB74F158DB5
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150989; cv=none; b=C6y0WMwETYUgAeSpXs5h0RaARPyznuwTQhWEPSIk3LZBX4uek4pTM6ks+ZGIdp/yL9DFxtmRvtz87Hxht8XyGYdCSVNEXMWWUVlW7EVQgrzWH40Rk5W1II68qZxbAxw4xvu5nUKyCfpMoK4dm+RLUiH0nKG60fJOTeqVwP/qlmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150989; c=relaxed/simple;
	bh=IIUidfl+uxE8HqCjRrfbr3H1JmrlbwQllqwYZd4nwsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atV7kw0tKGf2S6yMalsgw3SgTBE9Cw354uKxfl3qpUe6R8tkmsp/VjeIXb0Wl50T4ixD+uT44iME4jzvd/EzhlGDgxYpx6i5Iox3AyleB+bAhTeguOgDuFMtE3TNRyUVnmvnD9aNyTmdMIktEHrFeGuyBodDdm0taTenICEv+08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Iv9apZaW; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Iv9apZaW"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ed691fb83eso2041170b3a.1
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714150987; x=1714755787; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQOEs8kmpRBE5AbT4DjWE8lg43hpZ4efabp/bR8JqV4=;
        b=Iv9apZaW12LjbWxHK3wcgQ8X9i6v4K7ZyPEQKRGMxZMJ/jDrZvTMDlTN9NOd7atuQV
         QBEy45Fxv28SmK4oh5st4W3gxla/oMLYA+QFWynvwC9XOKlyohjSAXQU8QrpG7ibTOwU
         Jfd6ZE0GMV+edsLUECf3fxxyRm+YjukAYq1SF7FOJHOfoZPGKxFkR+yPsdXDmXhQgOMr
         HA3oYqJFxIMAw4EDOAvIo8oQlHbIFeDfoJDIeAJPiHBJ62t+StbVVT6xByc6keytIfrl
         Ev1G25EnYmJYVbmwXJ1V9oHqh9mD1QqHAnwdkQoVXKzzGuVEIyrmd7QAaXivYAW2kEzh
         /hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714150987; x=1714755787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQOEs8kmpRBE5AbT4DjWE8lg43hpZ4efabp/bR8JqV4=;
        b=gtyFeJ97jj1KpbYb+cE2UNbGdXyHizdO2+Il5s2t44OfZe2CH6/5x3i7WCwEMqfcdS
         wSPnDq09e6TnFV3o+WCleCUt0kK1Vb9mZIpAgoE26kNvzgOqbgMFjEWzcpyXXF94yquE
         s4ocKt4y9Twtq46rnhnKo80x9hB0/KtH2YvtIwmfCgGYyOfJITdq7NFnrUZO/OEKF6zj
         3wYIcvedukN3TSQQ2QqK+wcqEYiAb66Q6fttZwGhaIRPtiqQ8PtMuag0DBMR4EbiZpv8
         JtePf9JFXAtW5d9vMnryd1B3Bh44wcT+2zoPfBpFX1nA6FGSGLCJ7djzel2kgyzRyDdi
         zuVg==
X-Forwarded-Encrypted: i=1; AJvYcCWZH2WWQ7LVo58jLMLlWlfd9A7SDG05mmvVhzxbvFb2dmZdsoOvCUOnJSz0/AuDVQ/CXbIvFuqF7qpvkAhirnXCLeVhfqKMvmXDKBM=
X-Gm-Message-State: AOJu0Yxmd+ZmsnlUkmb2pZ35IyC7E+6cbXLTM5wDdLj4tzZEsqe57j+9
	ez4joIhpah7MS4smd3EspeJtIvduxkyJG1MAEboY5qhhQUm7JXmqSb/11Fu59QI=
X-Google-Smtp-Source: AGHT+IFR6N5kNo831LY2QDvVk1TR2PcWNxJi2WUcYOuXc/kYMYtASUjQSOGqHJvgWIKCX9dNVAjTRg==
X-Received: by 2002:a05:6a20:1050:b0:1ad:7c58:6a74 with SMTP id gt16-20020a056a20105000b001ad7c586a74mr3664735pzc.23.1714150986909;
        Fri, 26 Apr 2024 10:03:06 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:4d29:d34e:e48:a550])
        by smtp.gmail.com with ESMTPSA id i6-20020aa787c6000000b006e6b52eb59asm15022967pfo.126.2024.04.26.10.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 10:03:06 -0700 (PDT)
Date: Fri, 26 Apr 2024 10:03:02 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 04/17] riscv: vector: Use vlenb from DT
Message-ID: <ZiveRt5Ebw0dvO5h@ghost>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-4-67cff4271d1d@rivosinc.com>
 <20240426-unfocused-amount-e4e74e66962f@spud>
 <20240426-unfixed-mournful-0a71fb3972b4@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426-unfixed-mournful-0a71fb3972b4@spud>

On Fri, Apr 26, 2024 at 05:21:16PM +0100, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 04:17:52PM +0100, Conor Dooley wrote:
> > On Sat, Apr 20, 2024 at 06:04:36PM -0700, Charlie Jenkins wrote:
> > > If vlenb is provided in the device tree, prefer that over reading the
> > > vlenb csr.
> > > 
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >  arch/riscv/include/asm/cpufeature.h |  2 ++
> > >  arch/riscv/kernel/cpufeature.c      | 26 ++++++++++++++++++++++++++
> > >  arch/riscv/kernel/vector.c          | 13 +++++++++----
> > >  3 files changed, 37 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > > index 347805446151..809f61ffb667 100644
> > > --- a/arch/riscv/include/asm/cpufeature.h
> > > +++ b/arch/riscv/include/asm/cpufeature.h
> > > @@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> > >  /* Per-cpu ISA extensions. */
> > >  extern struct riscv_isainfo hart_isa[NR_CPUS];
> > >  
> > > +extern u32 riscv_vlenb_dt[NR_CPUS];
> > > +
> > >  void riscv_user_isa_enable(void);
> > >  
> > >  #if defined(CONFIG_RISCV_MISALIGNED)
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index c6e27b45e192..48874aac4871 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -35,6 +35,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> > >  /* Per-cpu ISA extensions. */
> > >  struct riscv_isainfo hart_isa[NR_CPUS];
> > >  
> > > +u32 riscv_vlenb_dt[NR_CPUS];
> > > +
> > >  /**
> > >   * riscv_isa_extension_base() - Get base extension word
> > >   *
> > > @@ -656,6 +658,28 @@ static int __init riscv_isa_fallback_setup(char *__unused)
> > >  early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
> > >  #endif
> > >  
> > > +static void riscv_set_vlenb_from_dt(void)
> > 
> > I'd expect to see a name here that had "of" in it, not "dt".
> 
> Also, "set" - I think "get" is more suitable here given that this
> doesn't actually set the vlen, we only do any setting later on in
> riscv_v_set_vsize().
> 
> > 
> > > +{
> > > +	int cpu;
> > > +
> > > +	for_each_possible_cpu(cpu) {
> > > +		struct device_node *cpu_node;
> > > +
> > > +		cpu_node = of_cpu_device_node_get(cpu);
> > > +		if (!cpu_node) {
> > > +			pr_warn("Unable to find cpu node\n");
> > > +			continue;
> > > +		}
> > > +
> > > +		if (!of_property_read_u32(cpu_node, "riscv,vlenb", &riscv_vlenb_dt[cpu])) {
> > > +			of_node_put(cpu_node);
> > > +			continue;
> > > +		}
> > > +
> > > +		of_node_put(cpu_node);
> > > +	}
> > > +}
> > > +
> > >  void __init riscv_fill_hwcap(void)
> > >  {
> > >  	char print_str[NUM_ALPHA_EXTS + 1];
> > > @@ -675,6 +699,8 @@ void __init riscv_fill_hwcap(void)
> > >  	} else {
> > >  		int ret = riscv_fill_hwcap_from_ext_list(isa2hwcap);
> > >  
> > > +		riscv_set_vlenb_from_dt();
> > 
> > Hmm, I think we can go a step further here. We know all of the CPUs
> > widths by the time we get to the first call to riscv_v_setup_vsize(), can
> > we examine the whole list and decide not to enable vector if they do
> > not match, rather than continuing and failing to online CPUs that having
> > the mismatched size?
> > 
> > I guess that can go into the `if (elf_hwcap & COMPAT_HWCAP_ISA_V)`
> > condition we already have, and would require clearing the bit from the
> > mask we have at the moment.

Good point, thank you. Since this is not supported with ACPI, I will
clear the COMPAT_HWCAP_ISA_V bit from elf_hwcap if
riscv_set_vlenb_from_dt() (which will be renamed) determines that the
the riscv,vlenb field changes between CPU entries. 

- Charlie

> > 
> > Cheers,
> > Conor.
> > 
> > > +
> > >  		if (ret && riscv_isa_fallback) {
> > >  			pr_info("Falling back to deprecated \"riscv,isa\"\n");
> > >  			riscv_fill_hwcap_from_isa_string(isa2hwcap);
> > > diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> > > index 6727d1d3b8f2..fb7f3ca80d9e 100644
> > > --- a/arch/riscv/kernel/vector.c
> > > +++ b/arch/riscv/kernel/vector.c
> > > @@ -32,11 +32,16 @@ EXPORT_SYMBOL_GPL(riscv_v_vsize);
> > >  int riscv_v_setup_vsize(void)
> > >  {
> > >  	unsigned long this_vsize;
> > > +	int cpu = smp_processor_id();
> > >  
> > > -	/* There are 32 vector registers with vlenb length. */
> > > -	riscv_v_enable();
> > > -	this_vsize = csr_read(CSR_VLENB) * 32;
> > > -	riscv_v_disable();
> > > +	if (riscv_vlenb_dt[cpu]) {
> > > +		this_vsize = riscv_vlenb_dt[cpu];
> > 
> > > +	} else {
> > > +		/* There are 32 vector registers with vlenb length. */
> > > +		riscv_v_enable();
> > > +		this_vsize = csr_read(CSR_VLENB) * 32;
> > > +		riscv_v_disable();
> > > +	}
> > >  
> > >  	if (!riscv_v_vsize) {
> > >  		riscv_v_vsize = this_vsize;
> > > 
> > > -- 
> > > 2.44.0
> > > 
> 
> 


