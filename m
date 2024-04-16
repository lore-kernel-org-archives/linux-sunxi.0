Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2E3C47B
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 20:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713299978; cv=none; b=JUQoO3Xc6LSozd64tweNzOb8NeHhFqkoZDs75OMfkvDngY8HRKkobHWRSy5dox50FF5MflDVReP7cOmdMPGnj884ldTETznmAMBxGlwPivzexeKllK91kLvqmDxqq/L8tBBcMFAKP2o9cJrJ/aWEaNhczyOx6zGBcel336jxrEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713299978; c=relaxed/simple;
	bh=83pdUfUUCdF5WrGmIF1GO0LUgsvG5H+wRIvNQRdgzmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3qPohxArrqdwMNgGpeC8vyxyLn7w1sqqjDdioLI3ESXJLLMX3NzThevBAXAgPSIoc7FhZsjPgHrCQdCTa9SITXmni7nkcYbD3Z5OuzyyVD+mpjOApE3n7PnlcElH1z5KwgZABf6tQK4FZgzEt0ovmQ4PHFSrviTR4+3qkAFL5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=lZU2hud/; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lZU2hud/"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so1181065ad.0
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 13:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713299977; x=1713904777; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BMsxIpE4Z9nqdYgum8o4M/KssYPkdpnJdREANM4LfZ4=;
        b=lZU2hud/jXye0TNr21or9a+UqRewCzvtze4C1EgeJl7D55HEm3WL2/5WoHqxk5sfk2
         tashbG2vc3mIerSY6VOFOQ4pRPVTIp06Xx89Ia84DUsO0jiAzZPvS9siTs+/pwbOu0Lj
         WgdcwVZXD811OPp6iuaIuFfQRLHg1Oj46t1DUvPQYjNXzRPWMrS2jvfHsdBq3eIYbd6n
         0oq4IiMeZGoH+2mAg0p/C8GIfp8AyFtCCbSavRyrJqyhn6CGncAPrR7/gYnajpQr+r7e
         v9seqf95JEdFy7M+WeUjJnDVFVZm7tgbghYCJ8E/9Qr/V59FXxsKAWgRJZTNyQChQkKk
         DhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713299977; x=1713904777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMsxIpE4Z9nqdYgum8o4M/KssYPkdpnJdREANM4LfZ4=;
        b=E4tXO3hbz75fFFj9jlIpqJhMFId05R3uHQ2KeqUgdKrgsTMe+uADXsjL+c7usIXCsd
         IPFMBGfYqo7rl3OUryUnGrjDOrjgA2actM1SKWgExvHJ6TTkOMRFuYmVt0M/EySR5Lou
         h57raJahyMZ3nqG0gHu2VcCRusXBxo7/tegFmFbepVhqri4M/bZFuN8epsFKYBXMkxww
         +jW4IxP3infDY3NP8yrTbhvvY/TjPkoehpPwXf6Drq0zgsWxzBlrjDYYr9tevp1icU3h
         IBT/S2/+P1Nn9SI5v67sQK6VM1i5yGU3he3+j/JIOnn5bzV0K2TM+eRQn6GvQj1V3tti
         Iryg==
X-Forwarded-Encrypted: i=1; AJvYcCXBWpDX11s3j3yQXQbhwGAKQj9kRxXI3FP4yH3wtxtbha3zf9tcwDYS1cBOps+/6M5ukqDsyl2mXo+yLdVSYqSZ2detIFVYFY+dQUI=
X-Gm-Message-State: AOJu0YyvpLjBE9LcAeqoFdod4AJuMu9MWYLei8WNpIeSf8EVW9MPs4p+
	aKGQvwm/0thzfNdn1vTHhiEmp9NElgolYHYXmN5Q6nDoS4s25JzJBGFyH7TWjbY=
X-Google-Smtp-Source: AGHT+IH1gf91D0Jx8EX2o/Z8Zgr/8lKTTJMrgChMy1jkDn9GpdgrT/0VA+/pYw0KTlvpLVreUrkRWg==
X-Received: by 2002:a17:902:e811:b0:1e4:6cd7:30b3 with SMTP id u17-20020a170902e81100b001e46cd730b3mr4087832plg.23.1713299976719;
        Tue, 16 Apr 2024 13:39:36 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a1709026e1600b001e2ba8605dfsm8797603plk.150.2024.04.16.13.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 13:39:36 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:39:33 -0700
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
Subject: Re: [PATCH v2 04/17] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Message-ID: <Zh7iBRUybq1BAReT@ghost>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-4-c7d68c603268@rivosinc.com>
 <20240416-scorer-easeful-4dae3c18465d@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416-scorer-easeful-4dae3c18465d@spud>

On Tue, Apr 16, 2024 at 04:28:19PM +0100, Conor Dooley wrote:
> On Mon, Apr 15, 2024 at 09:12:01PM -0700, Charlie Jenkins wrote:
> > The D1/D1s SoCs support xtheadvector which should be included in the
> > devicetree. Also include vendorid for the cpu.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > index 64c3c2e6cbe0..4788bb50afa2 100644
> > --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > @@ -27,7 +27,8 @@ cpu0: cpu@0 {
> >  			riscv,isa = "rv64imafdc";
> >  			riscv,isa-base = "rv64i";
> >  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> > -					       "zifencei", "zihpm";
> > +					       "zifencei", "zihpm", "xtheadvector";
> 
> 
> > +			riscv,vendorid = <0x00000000 0x0000005b7>;
> 
> Isn't this effectively useless given there's only one CPU here?
> We also already know the vendor of the hart, because the compatible says
> it is a "thead,c906" so this doesn't provide any new information.

Yes, it was simply to provide an example of using this field to make it
easier for somebody who wants to use it in the future. I can remove it
if it's confusing.

- Charlie

> 
> >  			#cooling-cells = <2>;
> >  
> >  			cpu0_intc: interrupt-controller {
> > 
> > -- 
> > 2.44.0
> > 


