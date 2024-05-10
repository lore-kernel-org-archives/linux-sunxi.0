Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22A613B5A4
	for <linux-sunxi@lists.linux.dev>; Fri, 10 May 2024 21:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715376333; cv=none; b=cjovGgDLpwj+4L+5SQgzo0cOLwD3FDIwsTg6OzRx0NGxsBQD01OBCcgvI+FETc071WPPyZoNW7RvOOjD1FJCmfaUUmBUIieo4OcS7zFDhwtuqCKcN7GKVBKGseYwMkqavh2XzfdORAimhtuFL6uQTzP0+iR5MSZzydDuhl6jE6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715376333; c=relaxed/simple;
	bh=pKK8FmPjaKeVmC/x9esCm6cF6BXhvjrK1358Io/3/iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcUyobIVtkZDpm6hq3d15ApGpFs3hDqRz7hu5BeLh4vunyAQbe/X7gjw/9crDkrVGKSEF2kHi+vmq7b+r+LRPmqn/dy4pOKmPKgD21cmASXLd0wVFcZr7nuj/hdbxQsfiep75EGi/Ju+hKuZJFXJ1/m4OtmT7EKv23CH06NGO90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=FomyBbol; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FomyBbol"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so15634865ad.0
        for <linux-sunxi@lists.linux.dev>; Fri, 10 May 2024 14:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715376330; x=1715981130; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EbHwqyrBSxlaInOgJHXkpBV851gT6eWfUw4RtCMLqkQ=;
        b=FomyBbolgnDQADOPKNBiGYImv/HC/7N4NB3qnS+n8+Xl6/QhsauDyh3R0tSeRBuQPe
         uyCAjedtOF5BU4LsOhMzJM2bUe7GZNcE3tbQMnVOh7mzg3ULAtxHnOFxmAid1DNPK4bC
         yG/rxSqxZuPvZAUiQLjev5WuSQNAq5aFIMdlAKL8vGrSqRYSMeOINd27vMz4InvkkkRL
         iopKGC/VRxGPYUiX2Qj5yrkNcYKD0wjT6n8vvi9nB2NEYu26zD5A9+4UYYFxRhv/0TSg
         dbwVbbonotffk5R6qGxAIwik0m8JLLL01qqXuYq3PDgARyKA57z42t/S1bhsFFiADxm7
         /uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715376330; x=1715981130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbHwqyrBSxlaInOgJHXkpBV851gT6eWfUw4RtCMLqkQ=;
        b=DRObJewdiMXgg0hYMQGiPbufQWshdGliJk5fTdjPLuuMCDXZJs8IR3TxisR1Kr7Zyj
         tN53YyH0lU3Fah9ec86yHnnVkxueJLA2X8q1UBZ0wJ8I62ScNyuOYSr4jlPndPw2GzP4
         4ISraIqBoOfA164SC+Z9OVpeg/vylKglo1l99yJAQzjM935KDBkJ5ITF8bFIVl9h8yBm
         jfulc1/z8V7GhFmnT6oudoCxExYTd62Z6PlJdG7MntPsjcZSTAzGWy7/qPQivZ7meS7Q
         RWdEEiblurg7BFj91tUYFFa+zfDiRFv2GHUmQFDy6phhh4utuqWcab8Si0Zh4K7zwLJb
         TRWw==
X-Forwarded-Encrypted: i=1; AJvYcCWygn54acEt0fSXN8YbnNReogiRwT+xrEHJt84SiJk4rq0LaxpcUMqXWPgpIF58pl08oxiio6Lq6oyoJKQQ0KaiCEXa8UjW0DwlrsY=
X-Gm-Message-State: AOJu0YwqrI4GDtwCO/+VWYr5dhgg7GIuvIxwilq8bHMcHDk2Ij7apqGt
	1Z4DkYRO54KXoW3ytY3nj97cI99riCRoaEhwEYSHkbfluXcRwnlMYmY5sWFOXDY=
X-Google-Smtp-Source: AGHT+IEW69BEVO8myOChhepwVIMyAvXTkksrs6sLcKMonG9mCSm10McFQyRA5n6lZJBf+YbxIyRNZA==
X-Received: by 2002:a17:903:2443:b0:1ec:b6e2:da8f with SMTP id d9443c01a7336-1eefa03a440mr105945135ad.12.1715376330278;
        Fri, 10 May 2024 14:25:30 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:629e:3f2:f321:6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30fddsm36780655ad.136.2024.05.10.14.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 14:25:29 -0700 (PDT)
Date: Fri, 10 May 2024 14:25:26 -0700
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
Subject: Re: [PATCH v6 06/17] riscv: Add vendor extensions to /proc/cpuinfo
Message-ID: <Zj6QxisrBZSWq7ax@ghost>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
 <20240507-divisive-swoop-c2737a2d9a9f@spud>
 <20240510-childcare-outlook-d18e3cc5ccb3@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510-childcare-outlook-d18e3cc5ccb3@spud>

On Fri, May 10, 2024 at 09:50:32PM +0100, Conor Dooley wrote:
> On Tue, May 07, 2024 at 06:03:19PM +0100, Conor Dooley wrote:
> > On Fri, May 03, 2024 at 11:18:21AM -0700, Charlie Jenkins wrote:
> > > All of the supported vendor extensions that have been listed in
> > > riscv_isa_vendor_ext_list can be exported through /proc/cpuinfo.
> > > 
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > 
> > This seems fine, thanks for updating this interface :)
> > 
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Hmm, actually the automation on patchwork is complaining a bunch about
> the series, but I think that's mostly false positives except for this
> patch. The nommu defconfigs are prob the easiest way to reproduce this:
>   /build/tmp.QPMRM3oUNu/arch/riscv/kernel/vendor_extensions.c:41:55: error: 'struct riscv_isa_vendor_ext_data_list' has no member named 'vendor_bitmap'
>   /build/tmp.QPMRM3oUNu/arch/riscv/kernel/vendor_extensions.c:42:60: error: 'struct riscv_isa_vendor_ext_data_list' has no member named 'per_hart_vendor_bitmap'; did you mean 'per_hart_isa_bitmap'?
>   /build/tmp.QPMRM3oUNu/arch/riscv/kernel/vendor_extensions.c:43:60: error: 'struct riscv_isa_vendor_ext_data_list' has no member named 'bitmap_size'
> 
> Cheers,
> Conor.

The false negatives always throw me off. The errors are also offset by
one patch. This was actually introduced in the following patch "riscv:
Introduce vendor variants of extension helpers" because I accidentally
fixed this issue in the patch "riscv: cpufeature: Extract common
elements from extension checking" instead of the one it was introduced
in.

- Charlie

