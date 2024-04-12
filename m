Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B73152181
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 21:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712959013; cv=none; b=F+qn1aQ9pqVGPJLMXmCRqr4gpr7fBt6GQd94WeUBHHZOrQc2pSytF+4zA9rEFIZZ+vuhyk4hSI1eAs8AUbUB7IRQI/uaoU39tiUQYrLu7doZ6C5dXwrup6w3R9hzq95Sg20qvetg+QR6THcxCNFej3JsuMpOJZ+KlTCO+wngA7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712959013; c=relaxed/simple;
	bh=1PaWGfxyrHB5QHCFj3ZBI3SC8je2iOSCNdYW+yj2zZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRR3nPnkmq+6hk9MReS94oysuzdNIHGqDvckpSbifXEr3gNytFVw86SjLyGj3vNyiPltCUoGuvhj1WTNGbIXBmWkJOzXf6P26vwYTCYz4FW8RpqWfpQrEm/mjUAHP6EMGuDZmJTvJkYYl9gfCbyh78F+SGXgo+PbhDUG4zP7oMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Nw1dNQfE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Nw1dNQfE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e504f58230so12277255ad.2
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 14:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712959012; x=1713563812; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KaHJoFfHeKcbZbr8DZBqF2w1WE3ebjk/glljyT7W9ZI=;
        b=Nw1dNQfEigw/tqVbxiM7Fxr8aQU0DtjLW4WQrb//JNbRU1JqfvuODzOQRsduw2S8Cb
         UJ1t85BSVyqgyFViSsFCqh3SaTwk4NP0TjHpSuBMdiNtYcEdsxjKZC8XN0JhcbZT5BNF
         AXNJLhRYYWQ1Oz25Bk7Mgt2EJ/ZvmCB5OGNjIP114WQ5BXHGQY2bR4rZF+M7cSw7AmVZ
         DUd/kO0a7QPkYqQUb8V21cfJ8aqulvYAYv00BGCC4k3u0KHvh44Mv0CgucSmRUR+E8p5
         lE34tH3z7yfsEMEsEfh1y+mgxam1HMsjVfxWEomEhpwexMDfnzIXe7xkkogTUfLyNrHB
         B4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712959012; x=1713563812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaHJoFfHeKcbZbr8DZBqF2w1WE3ebjk/glljyT7W9ZI=;
        b=WBp9Ml/zrqii1KL/uciqoa+RJ7KpAqkNW16YTMcugVj0hZw7w8GKXyVn+I0UYc1YIH
         1LN0/MeexOs3dehIewrnI62FC4Koj6RWhmyYU1q5CP42ZGVSGGJEYYn5lljmGXqaWsBj
         2TnxBMJw6lVyy+A5rU0KVCfrCSWtNEyak2of2gyC+FGWfmaoxJvvF1gfm0A4dSHwf+tk
         vOiqQhxA56XouU1zh2JCR4kdifa+R6P/VocfmEMFhDWR8U5aQ1c7W236lZD3mDRMc1Aw
         89+AuwaQnKImEe1Qc0q/jtEQF6UYT3KhrO436ubxqNCV5TVY+/4W7t9wY3MUtBQBsnCR
         Cn6g==
X-Forwarded-Encrypted: i=1; AJvYcCWrJt2rLZHW5+3MZFRSz1WHbbD/bqLe9SmNSKxp/72RnYpQikc+zMVeTu8q0F0vNcvu8/LkzvNVRrngd+M4UIg4kJGaXJ57mT40utg=
X-Gm-Message-State: AOJu0YxB3AfNFZ2LRfAfLdAxVuGmXJX0HI9qVf4t+6tkRPEHXkArmz+E
	JepupjT5WHzwGC3oMg8H/qrNjULjwsEfLQjvS/xBuO3azmqXUL/OszfmJKYotls=
X-Google-Smtp-Source: AGHT+IEWqFfAYkiXilmnZ21u0Vqs/Bc8kyXEc8OwbOgXHViFBz7n/2ViIbfUfkCfp7Uh0oJ1KjxbyQ==
X-Received: by 2002:a17:903:250:b0:1e4:b1ea:23ef with SMTP id j16-20020a170903025000b001e4b1ea23efmr4487004plh.49.1712959011683;
        Fri, 12 Apr 2024 14:56:51 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id o16-20020a170902d4d000b001e088a9e2bcsm3463749plg.292.2024.04.12.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 14:56:51 -0700 (PDT)
Date: Fri, 12 Apr 2024 14:56:48 -0700
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
Subject: Re: [PATCH 08/19] riscv: Introduce vendor variants of extension
 helpers
Message-ID: <ZhmuIGX71THEuZWx@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-8-4af9815ec746@rivosinc.com>
 <20240412-dwarf-shower-5a7300fcd283@wendy>
 <ZhlypvTdsFPZBr08@ghost>
 <20240412-drab-french-55d8ff2c8cfa@spud>
 <ZhmhtLS5NuRrPOfu@ghost>
 <20240412-geranium-monotone-b47f414715d1@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-geranium-monotone-b47f414715d1@spud>

On Fri, Apr 12, 2024 at 10:34:10PM +0100, Conor Dooley wrote:
> On Fri, Apr 12, 2024 at 02:03:48PM -0700, Charlie Jenkins wrote:
> > On Fri, Apr 12, 2024 at 09:40:03PM +0100, Conor Dooley wrote:
> > > On Fri, Apr 12, 2024 at 10:43:02AM -0700, Charlie Jenkins wrote:
> > > > On Fri, Apr 12, 2024 at 12:49:57PM +0100, Conor Dooley wrote:
> > > > > On Thu, Apr 11, 2024 at 09:11:14PM -0700, Charlie Jenkins wrote:
> > > > > > Create vendor variants of the existing extension helpers. If the
> > > > > > existing functions were instead modified to support vendor extensions, a
> > > > > > branch based on the ext value being greater than
> > > > > > RISCV_ISA_VENDOR_EXT_BASE would have to be introduced. This additional
> > > > > > branch would have an unnecessary performance impact.
> > > > > > 
> > > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > > 
> > > > > I've not looked at the "main" patch in the series that adds all of the
> > > > > probing and structures for representing this info yet beyond a cursory
> > > > > glance, but it feels like we're duplicating a bunch of infrastructure
> > > > > here before it is necessary. The IDs are all internal to Linux, so I'd
> > > > > rather we kept everything in the same structure until we have more than
> > > > > a handful of vendor extensions. With this patch (and the theadpmu stuff)
> > > > > we will have three vendor extensions which feels like a drop in the
> > > > > bucket compared to the standard ones.
> > > > 
> > > > It is not duplicating infrastructure. If we merge this into the existing
> > > > infrastructure, we would be littering if (ext > RISCV_ISA_VENDOR_EXT_BASE)
> > > > in __riscv_isa_extension_available. This is particularily important
> > > > exactly because we have so few vendor extensions currently so this check
> > > > would be irrelevant in the vast majority of cases.
> > > 
> > > That's only because of your implementation. The existing vendor extension
> > > works fine without this littering. That's another thing actually, you
> > > forgot to convert over the user we already have :)
> > 
> > Oh right, I will convert them over. The fundemental goal of this patch
> > is to allow a way for vendors to support their own extensions without
> > needing to populate riscv_isa_ext. This is to create separation between
> > vendors so they do not impact each other.
> 
> The one that needs converting is xandespmu. As I said on the other patch
> a minute I don't think isolating vendors for the internal representation
> is needed and can be left in hwprobe. I also don't think we can rely on
> a behaviour of "SiFive CPUs will always have SiFive's mvendorid" or that
> kinda thing, I've heard talk of the SoC vendor getting their mvendorid
> for custom CPU cores instead of the CPU vendor and it's possible for
> the SBI implementation to "adjust" the values also.

Okay that may be possible but that is up to the vendor when that
happens. The vendor extensions are fundamentally different from the
standard extensions and have even less guarantees of correctness which
seems like it would invite more errata if multiple vendors implement the
same vendor extensions. I can extract the code into a different file for
each vendor so that is more clear.

- Charlie

> 
> > xlinuxenvcfg does not fit into this scheme however. This scheme assumes
> > that a hart cannot have multiple vendors which that extension breaks.
> > xlinuxenvcfg is really filling a hole in the standard isa that is
> > applicible to all vendors and does not appear in the device tree so it
> > is okay for that to live outside this scheme.
> 
> Ye, xlinuxenvcfg is an internal psuedo-extension that should be treated
> more like a standard one than something vendor.
> 
> > > > It is also unecessary to push off the refactoring until we have some
> > > > "sufficient" amount of vendor extensions to deem changing the
> > > > infrastructure when I already have the patch available here. This does
> > > > not introduce any extra overhead to existing functions and will be able
> > > > to support vendors into the future.
> > > 
> > > Yeah, maybe that's true but this was my gut reaction before reading the
> > > other patch in detail (which I've still yet to do).
> > 
> > - Charlie
> > 


