Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DEF14C59B
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712946174; cv=none; b=TSwkKn0dC79jUm4E4so7AyJOlTeUgO98HzJckH6dNOItfRnKVH8WAfrtervGPQmIKJOjMeH9afyMus5iYi1y2jikQ3U+cIBPEvs+MGd3FHNSwTJx7/fNR/bOdzKidKGBf6Z/SFRDPnaFNufC+f9a4Ccy67+WYpWB/Q+sGpoyJt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712946174; c=relaxed/simple;
	bh=nxs6ymKTj6HI1SwIdNFV/IpFSXZC5BKSvMerZjmyt/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6tTUPmMI/aeFXLgqrd6IT5JDidOVKaC0gPVhQBFw0mFgLd2dgXaACtmxMMbe8m8b78msui+8n2CVlM0S6vKWH0rL3G8MF76L1P8cjdvkELGah5r4P963jlvW/6uOjPZQ8rr8j2b3NkaqdP1QUvmrKMq7b6DQLoy6kwdNz+TXIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=HJJCe1vT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="HJJCe1vT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e419d203bdso8634025ad.1
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 11:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712946172; x=1713550972; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K1e60CwK0PVttJs1oeSOiibpRUbN18cUEABEgzA6wIs=;
        b=HJJCe1vTmcS/vKuBU6iPLstvQsDyNDv3W3b2GFHPxMJjwBROQ22RpVIp2SmGl6lVKR
         32YvCf4sbN0XHDqSxNJdCFKF8LOlYnxkg9iJonIyPUgM9U5VZackZQhZihGZ0nruyqmf
         J0aWnT12IPjz1nxx/1PJXtn9bARmOWRvE1aAYT19j37+F/I/H0N5u/e+h/oYR/+xTdq6
         doq4wZVjKJWVlR5lGRoqFt765URyVNBimatfhHxmNDtiIA4JNemuyHcObCFrjBIA09om
         uOzdtPtShd50K/+KrsWinmHW71HSAcRhsuFMDD9dByK/jd9dAv2m0oXaHyiwfPZ05XZC
         Cc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712946172; x=1713550972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1e60CwK0PVttJs1oeSOiibpRUbN18cUEABEgzA6wIs=;
        b=HTNiSS2LvJ5gMLXoAGM8ntZrMt7vbjIctN1TirxZfYjbjsfNPSpfVB9KPhcnt4WtGv
         FOebMZ615evRCHZuTH3xSMvibKMJKyzfXk0/K33jhiYhmjEu7TwPEHztDhmtZK74AH9s
         Q9brpC6Ja0bd+O+HyXvUN26fq+3ZIna8I8vLYuaGKJSGKdPc214e0ENZobjR3VOmYPqc
         KV49z+u+255XDJ/OSBpvwAgVu/FAXr8elkglMmcx8MdkAeuJ2v8Qzt+0SxEcPz4XLBRW
         AeqiNHnsPbYfVp6L8l61AaeK2LVkV3af1Te0SskvTytmA9J8UL5WtQ0zNrQu1cNrIh43
         2Amw==
X-Forwarded-Encrypted: i=1; AJvYcCW4LAJjTGmA6vJA0qBpbmMTB1p90j1z3b+CVNfo9UyFuiW/0Da4ShOr5fwiM0h+txzXvHv7rCtml/1Icg65QI+/WZVipBuqH0pJIoQ=
X-Gm-Message-State: AOJu0Yy+80U1BXJVXA+bs0ejD6qdZmYZlaCtZvtIG9Thf2KYbtIr9161
	35QkFGzPgL+R6Wl9L55hKBhur7TGOtvPtQ28oXsTEp3VRmu3BDiMazsBvXPW3Ys=
X-Google-Smtp-Source: AGHT+IFxTX0XIuZbNR6qdEOLtuqZ+KqQsFRqq1yUy3tf+EcRY4ZnjF6vouMF9rorhX6yEu6I5X4zfw==
X-Received: by 2002:a17:903:32c7:b0:1e4:3b58:7720 with SMTP id i7-20020a17090332c700b001e43b587720mr4370912plr.2.1712946172563;
        Fri, 12 Apr 2024 11:22:52 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902684c00b001e3d2314f3csm3352924pln.141.2024.04.12.11.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:22:52 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:22:44 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
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
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 10/19] RISC-V: define the elements of the VCSR vector CSR
Message-ID: <Zhl79HOrWWGaM4lK@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-10-4af9815ec746@rivosinc.com>
 <20240412-viper-bullish-d57d19805a0c@wendy>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-viper-bullish-d57d19805a0c@wendy>

On Fri, Apr 12, 2024 at 12:27:50PM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:16PM -0700, Charlie Jenkins wrote:
> > From: Heiko Stuebner <heiko@sntech.de>
> > 
> > The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].
> > 
> > Define constants for those to access the elements in a readable way.
> > 
> > Acked-by: Guo Ren <guoren@kernel.org>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> You need to sign off on this as the submitter Charlie.

I wasn't sure, thank you!

- Charlie


