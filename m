Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368F18172F
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 22:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713394290; cv=none; b=JvEkAMKEpYsRgn2AsURuYgA+E0sxIWYP0sZgGyEFxwwFeT6C1us0nxnIMMDuF+TRvM1PA7KeMGrxahqlPRhts9bsRV3lrATtBMeLHkiyFIvJHs1dz+niz6v3fYoe9F99h0t+zqV+imZRBichw79utX2YFWAOKMDpE2IuVxakr14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713394290; c=relaxed/simple;
	bh=ABLnPb+FzE7ddsHXVQyfOs5AvG3SKdeaNiBYdaJWL7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNVh4LJ5embZ/k+Z5klwDDizwVmlGe5W7ItR99sUeZRkBlmgBTEfzCM3IxdeYeSM/ywQisXiZFMNvwzWARyIDSeD4um3hKCd8blCyAKhGVqglg5L4A2rDrAmeZ3trsnrvKRt6b4vwdBtYIPCyEh/HaSckgLeIUJomaFE+U1zUnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bTdRzuhm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bTdRzuhm"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e3ca4fe4cfso1964965ad.2
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 15:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713394288; x=1713999088; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTSo6mWPNg3MYfgUA4f7wbCrE3rgzEA/5uO9sngH9Ec=;
        b=bTdRzuhmGi79WuZazAdOY1bJrqv5ULGT2OHTYFHn8HaAa/uoKWudfzcGpa1fs/ArK9
         w0Ag+ZwKPV/Mrgj0QKbvdVEuwvUchOc97kOrjr0+j6cLFcZYa2k4dNzurjUg6P/26Hoe
         ccCOdC5zrNHWdcjW0nSYNuz87sJ0mErUdbpC/szEy3FU/8mIQAoJrifqgicu7SA5+iET
         es4IrvTy9jil+sr033wQXwW63Yj8gKHZublA3j1GaVNGKwpyxEDo2Y3emfOpsGKh4Me4
         9pCgae1cURa/b4Z/O6h3k10NTHhaWT408P4DsMxnwvOJF91C9+IHMw+oDRY1SenbNoGw
         kkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713394288; x=1713999088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTSo6mWPNg3MYfgUA4f7wbCrE3rgzEA/5uO9sngH9Ec=;
        b=BYQx+7LhKwHUcYm2ViIZIV6/s+fRH5Q81+GobzS4xeGlQXquqz6U+ac/4Rz8HJzZyj
         5YKFf9dx7dggwf6ELA4afKhWnORoH6FMF+iMAe2EbZflz3ZnHDDXNLbEPuXm11oeaAnE
         RNUFKob9eHUOZGo2uKaYsD/tHw2+4spuRFYFFyckYwUTlgUbr87qiGmDKvdk0t2E+cQa
         Jwqa9kOwKfNy/W+3zFtnrNnLoEO5vv3fR0fjvr7oPQuiS/0JumcMqmZ9YZy27eb0fWgA
         4fwqYauWDzVSHuLaavIrIYkYtvHcgfrCA7qIS8pfHrup9ERjlAc4a/Y0fyjLW1I6ST7a
         LRBA==
X-Forwarded-Encrypted: i=1; AJvYcCXaroSoFquPu6VBj9Mg+zN0VSNlwo3Ecg3vf9WzrYfiWoU2D7Vh3wwXFIhFCViJwmWz91DOSRtor1Lpvy6gYpnCM2UWV1kb+6wEkMw=
X-Gm-Message-State: AOJu0Yzi59ojNeORWn/8kMec7lWAtCnPCYwaD4s2qwmTirPR2TWATQfX
	aEgsD45kmSfPnJGqAMYcadpAZWRXSLe/TWOFIF/n3LNTixoLCxF2/cgZr54qxP4=
X-Google-Smtp-Source: AGHT+IHrFjHxUYakHuwCu0KxAXJxMjlVzPR4wDunk8LV/EImWNwQf6hbQbYi/IvWQK0xsqjlBoez7Q==
X-Received: by 2002:a17:902:76c9:b0:1e5:3d8a:75fd with SMTP id j9-20020a17090276c900b001e53d8a75fdmr859944plt.69.1713394288489;
        Wed, 17 Apr 2024 15:51:28 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001e45572a253sm172327plb.14.2024.04.17.15.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 15:51:27 -0700 (PDT)
Date: Wed, 17 Apr 2024 15:51:24 -0700
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
Subject: Re: [PATCH v2 02/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Message-ID: <ZiBSbETx++uIIknH@ghost>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com>
 <20240416-underwire-bright-b2ab0fa991ec@spud>
 <Zh7i2pir0j6tXfPD@ghost>
 <20240416-budget-cause-c4002a9cc05b@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416-budget-cause-c4002a9cc05b@spud>

On Tue, Apr 16, 2024 at 10:10:39PM +0100, Conor Dooley wrote:
> On Tue, Apr 16, 2024 at 01:43:06PM -0700, Charlie Jenkins wrote:
> > On Tue, Apr 16, 2024 at 04:16:30PM +0100, Conor Dooley wrote:
> > > On Mon, Apr 15, 2024 at 09:11:59PM -0700, Charlie Jenkins wrote:
> > > > The xtheadvector ISA extension is described on the T-Head extension spec
> > > > Github page [1] at commit 95358cb2cca9.
> > > > 
> > > > Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d3
> > > > 35e03d3134b14133f/xtheadvector.adoc [1]
> > > 
> > > This should not be wrapped btw.
> > > Otherwise,
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > I don't believe it is wrapped? It appears wrapped in your response but
> > it appears on lore correctly:
> > 
> > https://lore.kernel.org/lkml/20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com/
> 
> IDK man, looks wrapped on lore too. The other copy of the same link
> isn't wrapped & I've never had mutt wrap stuff like this before.

Oops, I was looking at the second one and not the one in the commit message...

Thanks.

- Charlie


