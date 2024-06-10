Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAAE14D70A
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718043010; cv=none; b=YB6ojgYoFl7kgTxw9DLG/tM01WDV/ncHP7JYwWUU/qdklqqnNqgaoxaBY7b6DBastnM2mGj9Nb+x9CGCnm/pX3uv8vuJ2R638XgfCrv08p0b7BWk2U73M+uOvs5mtTQ6SXlREcDfn7N9zxPAYlFCST16Y4EDfzGZUvYoiJHbCN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718043010; c=relaxed/simple;
	bh=AR6o8sCr9wM693qULvIgN8SNexb4nDicp0kqFWb7vVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfXY2kuZlj6pqCJlZx3rQCNuRatRak1/cjJc9Wfs6GqAxPXbYasdOekjTHxQd/kXiPtMnmWJX9aDrdE1J3xbvVqmxghp0yznr75Sogb42e7DLGXb2ifTxTVF9vQJmdk8+kT90IFMgsuc/pbFT/M3WR0C4IyYuEHuBdN7dp2fboc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1N+8AJaz; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1N+8AJaz"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f6a045d476so237691b3a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 11:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718043008; x=1718647808; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eOMzuUW5DFxk4CTOU+Df7AwgNRpvbW8uNLdeQ0PQ3JQ=;
        b=1N+8AJaz2IUhVvXfni3KWGVKwvN6LuhkS2hMNDtPr3OM6yepQJ2PS1pBC5rAoEJduA
         xDIL3ziaf68BUxb4vtKmEamxmA7Ez+r0/QRAx5+ZZS/d52taR3hBkxCqDDQ6pj5Mu7it
         MHGmmFpPpF+3yEy5KdcqTLsHo9JfOYBUuuy/+A/MFPt6sAERFi7qmSiODpXOqJGxm96C
         bNZuz9ICKTvX/6CDv4NghWQ0hbGltbKjaadjtxDv/48VWvGc9DN5DZV1/ZHwn9kjox4R
         HR2dbCmu1bmHcOJRNugsFbgZVmWIJ6BkE0P++Thb77i4FCWh5ZeDq2AmkGXif/xwzgm2
         Xaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718043008; x=1718647808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eOMzuUW5DFxk4CTOU+Df7AwgNRpvbW8uNLdeQ0PQ3JQ=;
        b=s3QvmrYKVky7gtA8BvRx5hmChWRUfbE0m2Awt3n6GC7iN1/+XZQU74SqVEMc1zPFql
         P/Jq/AovoqHkVxr7apaPIQmNaN9LKlXXLIeTGtnd+B0lx9J12Gz+yK6RWpyXhr5QSJrQ
         Ms/x0CrYGZEtOrpoOtx17WoshOD3Ak0WAgGiOZ7Ec/OWlDOsPWu6RlGg2JyM0BcU3ElY
         UlruQTL3amM+WRFlaQAgHbK7XsErhxLoKeMBP+yM+ovlp2pBbMGb9hramEyWaH9mY0c4
         Ehec35fSpokd6V8UtO75VAfz5orgRF6CxWoV5xM7YZnf4+VYjhG7j0gea9djX88ZCnqg
         yCgw==
X-Forwarded-Encrypted: i=1; AJvYcCWX0DP/0Xk+3XISrNGX7QqZa1LCZjrmvVy+hLBi313sEhqkyHD0f5V409DvoZ9Ia2K0FX0LeVQPeUriEpC+XdKNzgA6Z5QyE9ZRxwo=
X-Gm-Message-State: AOJu0YxxBkcb7ET8dIUb6AmzMNJb4yLJavIaCMS+p0RSrV/sshMYenNA
	W3dgO8gx8VMG/GoGsaGwZcEntbkGVnNFcSoh7qb9Ixx4aqmwYEKYgf3j3XR0M1U=
X-Google-Smtp-Source: AGHT+IFL20+JEL0d7wQg9UxFST3rvmSUr0csbDVx1uyEXk7E2CThJ5CBB+HSUAFnBhFOYk8GVfwt2g==
X-Received: by 2002:aa7:88cd:0:b0:705:a5c1:e519 with SMTP id d2e1a72fcca58-705a5c1ed1fmr1285257b3a.10.1718043007682;
        Mon, 10 Jun 2024 11:10:07 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:129d:83bc:830b:8292])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70434a4a7dfsm2950294b3a.95.2024.06.10.11.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 11:10:06 -0700 (PDT)
Date: Mon, 10 Jun 2024 11:10:04 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 05/13] riscv: vector: Use vlenb from DT for thead
Message-ID: <ZmdBfNRujzuVvvCp@ghost>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
 <20240609-xtheadvector-v1-5-3fe591d7f109@rivosinc.com>
 <0944414F-321F-4159-AB85-C4B66AE9550B@jrtc27.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0944414F-321F-4159-AB85-C4B66AE9550B@jrtc27.com>

On Mon, Jun 10, 2024 at 06:51:56PM +0100, Jessica Clarke wrote:
> On 10 Jun 2024, at 05:45, Charlie Jenkins <charlie@rivosinc.com> wrote:
> > 
> > If thead,vlenb is provided in the device tree, prefer that over reading
> > the vlenb csr.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> > arch/riscv/include/asm/cpufeature.h |  2 ++
> > arch/riscv/kernel/cpufeature.c      | 48 +++++++++++++++++++++++++++++++++++++
> > arch/riscv/kernel/vector.c          | 12 +++++++++-
> > 3 files changed, 61 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > index b029ca72cebc..e0a3164c7a06 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> > /* Per-cpu ISA extensions. */
> > extern struct riscv_isainfo hart_isa[NR_CPUS];
> > 
> > +extern u32 thead_vlenb_of;
> > +
> > void riscv_user_isa_enable(void);
> > 
> > #define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size) { \
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 2107c59575dd..0c01f33f2348 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -37,6 +37,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> > /* Per-cpu ISA extensions. */
> > struct riscv_isainfo hart_isa[NR_CPUS];
> > 
> > +u32 thead_vlenb_of;
> > +
> > /**
> >  * riscv_isa_extension_base() - Get base extension word
> >  *
> > @@ -625,6 +627,46 @@ static void __init riscv_fill_vendor_ext_list(int cpu)
> > }
> > }
> > 
> > +static int has_thead_homogeneous_vlenb(void)
> > +{
> > + int cpu;
> > + u32 prev_vlenb = 0;
> > + u32 vlenb;
> > +
> > + /* Ignore vlenb if vector is not enabled in the kernel */
> > + if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> 
> It’s not V though. You probably want to split out “vector” from “V” in
> Kconfig land. Most places want the former, I assume, but some want the
> latter.

There is the xtheadvector kconfig that is introduced later in this
series in the "riscv: vector: Support xtheadvector save/restore" patch.
I think I should shuffle the code in these patches around so I can use
CONFIG_RISCV_ISA_XTHEADVECTOR here instead.

- Charlie

> 
> Jess
> 
> > + return 0;
> > +
> > + for_each_possible_cpu(cpu) {
> > + struct device_node *cpu_node;
> > +
> > + cpu_node = of_cpu_device_node_get(cpu);
> > + if (!cpu_node) {
> > + pr_warn("Unable to find cpu node\n");
> > + return -ENOENT;
> > + }
> > +
> > + if (of_property_read_u32(cpu_node, "thead,vlenb", &vlenb)) {
> > + of_node_put(cpu_node);
> > +
> > + if (prev_vlenb)
> > + return -ENOENT;
> > + continue;
> > + }
> > +
> > + if (prev_vlenb && vlenb != prev_vlenb) {
> > + of_node_put(cpu_node);
> > + return -ENOENT;
> > + }
> > +
> > + prev_vlenb = vlenb;
> > + of_node_put(cpu_node);
> > + }
> > +
> > + thead_vlenb_of = vlenb;
> > + return 0;
> > +}
> > +
> > static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> > {
> > unsigned int cpu;
> > @@ -689,6 +731,12 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> > riscv_fill_vendor_ext_list(cpu);
> > }
> > 
> > + if (riscv_isa_vendor_extension_available(THEAD_VENDOR_ID, XTHEADVECTOR) &&
> > +    has_thead_homogeneous_vlenb() < 0) {
> > + pr_warn("Unsupported heterogeneous vlenb detected, vector extension disabled.\n");
> > + elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> > + }
> > +
> > if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
> > return -ENOENT;
> > 
> > diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> > index 6727d1d3b8f2..3ba2f2432483 100644
> > --- a/arch/riscv/kernel/vector.c
> > +++ b/arch/riscv/kernel/vector.c
> > @@ -33,7 +33,17 @@ int riscv_v_setup_vsize(void)
> > {
> > unsigned long this_vsize;
> > 
> > - /* There are 32 vector registers with vlenb length. */
> > + /*
> > + * There are 32 vector registers with vlenb length.
> > + *
> > + * If the thead,vlenb property was provided by the firmware, use that
> > + * instead of probing the CSRs.
> > + */
> > + if (thead_vlenb_of) {
> > + this_vsize = thead_vlenb_of * 32;
> > + return 0;
> > + }
> > +
> > riscv_v_enable();
> > this_vsize = csr_read(CSR_VLENB) * 32;
> > riscv_v_disable();
> > 
> > -- 
> > 2.44.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
