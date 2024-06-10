Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7A4147C86
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718041889; cv=none; b=b2VfE4LKBnyBrGFzu+PZf675khR5f6CWNFNaznhWclSGpVtaw2aBxEsG8vpC9Z1O8+mLWFO/g3GLhcr3lPuQ3vwyPgCysChknhBFTAu7TDqcMNLJPn1EfrOfG5DXqj3ing9yadgXQhNAodiFpLm4SEhquMVvVV5x0PSYju+Uxok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718041889; c=relaxed/simple;
	bh=FneSkAV3jCsGNrND9Mj7IMRiPZCTqIkhyvxDpV4xx9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clw+62PXF6n93AjoyTFS//heIqaK+vpFD2uJ9IBC6xkSV4CoQey3PuE7ytIfHIGi3+K2rZ1nxSg0e0EKQ1fNj5x4Ju+WgPRTgM673y5MiQZDHQxXcw8v0+QGgzxPrHpcVUIDt1cyKHebDfbmDypa2xuUx6h8hULmmpZUKwvoBd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=lAlmWt23; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lAlmWt23"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f64ecb1766so36507285ad.1
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718041886; x=1718646686; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XqAidOJkzifwbi0aDp05YiJHEtIMzMs4UmIa/z6sCUY=;
        b=lAlmWt23t9mh4L62JxfCfE0KzD/f/vG82cAPrHNRi1MCXMi+TB7XmWkrZWA0B08fo+
         mZ1arY08VJhc/ZNu4QQdpijDIxElA0LH6wIXUFQgTqfW0XD+n45b9qNkl9AxgX/pJOrV
         oos9XzEMEB2viUF2+PZ5riu5ju8tHUE4SADkcOxuoSGf4rwnOBFd3CAU9ZjeovNqjOEz
         uyG5xiq918IllmBTgvsbfw9y1Ay+QHaC+6u25Qv8cAK72slSMZpMxyj3RujCbIXtSRBz
         E0qk+RW7NloU2HbYE9rSYPppHbKWqNUxlb1DjZbxplCftE2uXe/e1+C2i6giTlabeTW4
         Jdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718041886; x=1718646686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqAidOJkzifwbi0aDp05YiJHEtIMzMs4UmIa/z6sCUY=;
        b=MIFVEom6hll9zExEePMtOFUuf9WJtrAc33F3kKEhWc58J6ZBt6fftHtTQ5Fza4W0VV
         O2dV+LsWvI7VuqXrypEeXf1PpDrq97wKE1HWPmRzENDUlU+fkBX3yZWnRg6yO610lHHV
         EsBCbpXRednfM8cA4Neckx7Z7ezh3p403IqZBO7nOHhjzrFnKyN+6UFKFLBB4NAEEaV4
         lhLIzFHRGh2yHHvlDCuHyoUMR0oP3klHVIFM4BsaL2ycXaG63JzAejHVF/4kB73x+vdc
         VrDnG8DwbfjWWnWTk5JP1h116MkyCVKt0f4y5cnBvEWxPT3vnj8wxp2f9Ecof70BsvRg
         2EBw==
X-Forwarded-Encrypted: i=1; AJvYcCVX+C7AVPjWRPwtBkXXwvMiggrgo0H0XGshYCAqJSbKoBU8AaJC0HA5dKwiWHz56bJj8QNoYrIPxZUhwtYgwDFe+DxxVNriOVQ6tXo=
X-Gm-Message-State: AOJu0YxLXC4dusPqoZ7hj2A+ryXzKJI9wPOhrLSfw8ttJB/nuRnXNU+E
	5MVTKKXYvAMvngLZLnF7Kmvf921JqQng/WWUD51ynbbbz7y9At4uH6Wf6mTg1f0=
X-Google-Smtp-Source: AGHT+IGI7ZtC5yMFeVhgobcpC4ELjQ0rXq8graZvm2aNnJqlgdJJt9Tf50Z+1bVL5t64KhWiB1DChw==
X-Received: by 2002:a17:902:cf04:b0:1f6:f5bc:51c5 with SMTP id d9443c01a7336-1f6f5bc5391mr72332595ad.47.1718041886043;
        Mon, 10 Jun 2024 10:51:26 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:129d:83bc:830b:8292])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f70eeaedf7sm27441255ad.84.2024.06.10.10.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 10:51:25 -0700 (PDT)
Date: Mon, 10 Jun 2024 10:51:23 -0700
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
Subject: Re: [PATCH 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Message-ID: <Zmc9G2syeLF2rBZM@ghost>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
 <20240609-xtheadvector-v1-3-3fe591d7f109@rivosinc.com>
 <FD6771F5-5739-469A-9C0B-952AAC62AB68@jrtc27.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FD6771F5-5739-469A-9C0B-952AAC62AB68@jrtc27.com>

On Mon, Jun 10, 2024 at 06:49:30PM +0100, Jessica Clarke wrote:
> On 10 Jun 2024, at 05:45, Charlie Jenkins <charlie@rivosinc.com> wrote:
> > 
> > The D1/D1s SoCs support xtheadvector so it can be included in the
> > devicetree. Also include vlenb for the cpu.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> > arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > index 64c3c2e6cbe0..50c9f4ec8a7f 100644
> > --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > @@ -27,7 +27,8 @@ cpu0: cpu@0 {
> > riscv,isa = "rv64imafdc";
> > riscv,isa-base = "rv64i";
> > riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> > -       "zifencei", "zihpm";
> > +       "zifencei", "zihpm", "xtheadvector";
> > + riscv,vlenb = <128>;
> 
> thread,vlenb

Oh right, thank you!

- Charlie

> 
> Jess
> 
> > #cooling-cells = <2>;
> > 
> > cpu0_intc: interrupt-controller {
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
