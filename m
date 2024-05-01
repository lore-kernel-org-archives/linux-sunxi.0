Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67858161309
	for <linux-sunxi@lists.linux.dev>; Wed,  1 May 2024 19:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714592748; cv=none; b=iMVAi+TReAwMfyQkwch45k/RMby0GogW+5I6Tjz/KVK4b0A7DDAbmSWvhuDZQLlYWA8nJ7JgFac72gksikkZR4T2gu/O4VzschElWIi77bTwYNUQJnU0P9whY9dMKSMDMU4TKshRaY8TcqZOi8PvR5oJYtK3yp3/GpMn+ORkcxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714592748; c=relaxed/simple;
	bh=rJzPsR+Qk5YamaIzt6KevMZRAvrz/pxeg0cG+yyl2iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euS1Gxa9PnvwuooZQwcVItufvJIZaE/VgexX8yv3nMX++iT1SXpQDgmjvvuuBVQXPz7QvPERitwIIkppznUghhAZy0OvOFY5pdk8k5Sz+pm3k5T8H5GTf8pQvUkHlQmY978HSGq+VGCHv+TP14wAZ5KVpP5Zbe0S4HwXy4OzFVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=TCKiSXhC; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="TCKiSXhC"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2a484f772e2so4798278a91.3
        for <linux-sunxi@lists.linux.dev>; Wed, 01 May 2024 12:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714592746; x=1715197546; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1EbBqpWrfZZxoY9bSkBt1o8FAuASMzz42NrlJzrLQw=;
        b=TCKiSXhCmVorlsPqsZF4CY62ING2T9ioERAi6zoYRPZNkhH/T7JJ51ncAP1U/9JooE
         QTQ1BxdcbmO7O6N7bmqOp2GI/Thjg6orrsfj+G1WxZtHlgBVzHDYV4zpLNndIhsFuY74
         T6QrFVawd9DbRYJuRVVCnQD+w8F9o8zGWlUntG1vIkb1ndCA2++NUev0DFaNGCR+Fr93
         fLfoQEe73uO0WMhtjkH1VNkzN+7jW16Q29sg9oU9QcPAfCnie4DQkOpbqpPuzDhmdKY7
         /xXQ3KAAUtg0/DWuwmsM7VGhNx9svXwWmPBa6RDE9pDQ2Md0J7ddlnDAE2J0mFazZvQZ
         rMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714592746; x=1715197546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1EbBqpWrfZZxoY9bSkBt1o8FAuASMzz42NrlJzrLQw=;
        b=UzbGIFfmlQwOX7gdHuF4dLONC51i9c3Be/YfN/g+Z6Mr1haSWMhO6Pab7VuU1GlgaP
         dZU+ry6HepUggwJj1XdZJt4iEroI6gVu/YAdZZWrVu3ynBbh69xUAxvyMUaXj8wQfa7Q
         eiivvnBuhLoDV4Ekl7oqprIaRxt+GwMOOBSF735gOhGhkK3MdvpNvPLjKpwh6hlUYXt8
         Yx3emiA16kjWiQwyHK+8G58WLznxAbvPdJ9Ix6Iin0STY6eK3Ytt27ZrUC3K3zFgBeDp
         komFi0Bvj3kjPftUjVZ+ZyKwUpx/n2xITHOGlj8QkNew/68FlgDSyM+KZEJYyot0I+A/
         YrdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFzEv7weplanvBLMHkC+HHJfa3AEC0cmxJhM1wIvpF33DysDX6sTrufNKiChOI1MHilV8IpkmQaRPsWDNqgjecNYx6d3QcdSiBL6o=
X-Gm-Message-State: AOJu0YzLg6l+aMp1zfDEjtyeZ9d3x/i9fh05CLSSCULYeW5XdRxs4uZV
	NRER9IEuC9KxyGTy5CeawjnCDnscFT8FgXJga/+t5cwCQFwfVHIwtBtbR3bb5UY=
X-Google-Smtp-Source: AGHT+IEAo4x8MOTk0rByHOk2fmlXZ3MwLp/YpTWYLg+olqE/2iU7l17JuO1KTk3z+XxlvKBKlVpzRA==
X-Received: by 2002:a17:90a:1309:b0:2ab:e345:4685 with SMTP id h9-20020a17090a130900b002abe3454685mr3536711pja.17.1714592745626;
        Wed, 01 May 2024 12:45:45 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id bf15-20020a17090b0b0f00b002a2e6fc09b5sm1724376pjb.29.2024.05.01.12.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 12:45:45 -0700 (PDT)
Date: Wed, 1 May 2024 12:45:41 -0700
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
Subject: Re: [PATCH v4 06/16] riscv: Introduce vendor variants of extension
 helpers
Message-ID: <ZjKb5e584UzQxSgT@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-6-b692f3c516ec@rivosinc.com>
 <20240501-tripping-acetone-e556e993ba95@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501-tripping-acetone-e556e993ba95@spud>

On Wed, May 01, 2024 at 12:29:56PM +0100, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 02:29:20PM -0700, Charlie Jenkins wrote:
> 
> > index c073494519eb..dd7e8e0c0af1 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -844,25 +844,41 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  {
> >  	struct alt_entry *alt;
> >  	void *oldptr, *altptr;
> > -	u16 id, value;
> > +	u16 id, value, vendor;
> >  
> >  	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> >  		return;
> >  
> >  	for (alt = begin; alt < end; alt++) {
> > -		if (alt->vendor_id != 0)
> > -			continue;
> > -
> >  		id = PATCH_ID_CPUFEATURE_ID(alt->patch_id);
> > +		vendor = PATCH_ID_CPUFEATURE_ID(alt->vendor_id);
> >  
> > -		if (id >= RISCV_ISA_EXT_MAX) {
> > +		/*
> > +		 * Any alternative with a patch_id that is less than
> > +		 * RISCV_ISA_EXT_MAX is interpreted as a standard extension.
> > +		 *
> > +		 * Any alternative with patch_id that is greater than or equal
> > +		 * to RISCV_VENDOR_EXT_ALTERNATIVES_BASE is interpreted as a
> > +		 * vendor extension.
> 
> I think this stuff is all fine, since we can always re-jig things in the
> future if needs be.
> 
> > +		 */
> > +		if (id < RISCV_ISA_EXT_MAX) {
> > +			/*
> > +			 * This patch should be treated as errata so skip
> > +			 * processing here.
> > +			 */
> > +			if (alt->vendor_id != 0)
> > +				continue;
> > +
> > +			if (!__riscv_isa_extension_available(NULL, id))
> > +				continue;
> > +		} else if (id >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE) {
> > +			if (!__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, id))
> > +				continue;
> > +		} else {
> >  			WARN(1, "This extension id:%d is not in ISA extension list", id);
> >  			continue;
> >  		}
> >  
> > -		if (!__riscv_isa_extension_available(NULL, id))
> > -			continue;
> > -
> >  		value = PATCH_ID_CPUFEATURE_VALUE(alt->patch_id);
> >  		if (!riscv_cpufeature_patch_check(id, value))
> >  			continue;
> > diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
> > index f76cb3013c2d..eced93eec5a6 100644
> > --- a/arch/riscv/kernel/vendor_extensions.c
> > +++ b/arch/riscv/kernel/vendor_extensions.c
> > @@ -3,6 +3,7 @@
> >   * Copyright 2024 Rivos, Inc
> >   */
> >  
> > +#include <asm/vendorid_list.h>
> >  #include <asm/vendor_extensions.h>
> >  #include <asm/vendor_extensions/thead.h>
> >  
> > @@ -16,3 +17,42 @@ const struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
> >  };
> >  
> >  const size_t riscv_isa_vendor_ext_list_size = ARRAY_SIZE(riscv_isa_vendor_ext_list);
> > +
> > +/**
> > + * __riscv_isa_vendor_extension_available() - Check whether given vendor
> > + * extension is available or not.
> > + *
> > + * @cpu: check if extension is available on this cpu
> > + * @vendor: vendor that the extension is a member of
> > + * @bit: bit position of the desired extension
> > + * Return: true or false
> > + *
> > + * NOTE: When cpu is -1, will check if extension is available on all cpus
> > + */
> > +bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsigned int bit)
> > +{
> > +	unsigned long *bmap;
> > +	struct riscv_isainfo *cpu_bmap;
> > +	size_t bmap_size;
> > +
> > +	switch (vendor) {
> > +#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
> > +	case THEAD_VENDOR_ID:
> > +		bmap = riscv_isa_vendor_ext_list_thead.vendor_bitmap;
> > +		cpu_bmap = riscv_isa_vendor_ext_list_thead.per_hart_vendor_bitmap;
> > +		bmap_size = riscv_isa_vendor_ext_list_thead.bitmap_size;
> > +		break;
> > +#endif
> > +	default:
> > +		return false;
> > +	}
> > +
> > +	if (cpu != -1)
> > +		bmap = cpu_bmap[cpu].isa;
> > +
> > +	if (bit >= bmap_size)
> > +		return false;
> > +
> > +	return test_bit(bit, bmap) ? true : false;
> > +}
> > +EXPORT_SYMBOL_GPL(__riscv_isa_vendor_extension_available);
> 
> I wonder if we care to implement a non __ prefixed version of this, like
> the standard stuff? The only __ version users of the standard one are in
> kvm and core arch code, the "external" users all use the non-prefixed
> version.

In vendor_extensions.h there is:

#define riscv_isa_vendor_extension_available(vendor, ext)	\
	__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, \
					       RISCV_ISA_VENDOR_EXT_##ext)


> 
> In any case,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

- Charlie

> 
> Cheers,
> Conor.


