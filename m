Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C03BB24
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 20:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713300192; cv=none; b=W5+8rrnEhnu7JDq7A/jmoJkJq0501E4uPfljBkh+QQ2tqa3rmkiJyjn4tXzWKR4SHLpEFC9yMB7pzA3uetQfm1oNVNKefrZ4pDROuln3Hevc3jwftQwHq7923MkDDqfY2l6Tf+aIuIZ9A2dfXAXeH1ZQua8/cTiZjvR4m+DNGuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713300192; c=relaxed/simple;
	bh=QZKpJHO+aihnmfUC+QgGjO4FBuSK+x9rFDZi5traRCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlbUfb63H5kiaegQG0Xur4+EzwIKwYL0AG3A7Eh5NfGDlMc+q6IPTstwEq7n10sGpUmopzfWyY+II+VKEVezIDb7R7B/5mCFdmunzkA13tDtqPSHQU0bUBcpGysxTOXm3vmEQBJBnKo8AZHXXnIi+zm4XjqTf4VmT0R0rqBmCu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YH04OEVe; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YH04OEVe"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e3cf5b171eso39713225ad.0
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 13:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713300190; x=1713904990; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s6DlS4/ZFHRtR1n8rjuKFrNyH2RJ3e1I9x+YwBEN4QA=;
        b=YH04OEVeE4etGC5Dvj9CabjNu/Pe1lNLZaqorfPMlmaeoRlyMzEpxzgYS1P+8wDkQp
         Ki91GwQG+Csql+4oIvEZTMm4mabEaW4BhN3Y03Gk6dONf/wbbqYj0mWXSz4F3mzRE68l
         z/71ZnfzY8a/jZEN9VabIa9Y06KiOEVorXiWK/2Ru8VEUsV+o+3MXrSO+Eaan0vWemjG
         5OeWyaWmjYaSVfUpbyi70VAYb/0E6jjoq840ASCBwtgIy8vzMETwlfiQPloMP5h6+ctY
         HnJA6s2UV2EOPU68uuTu208myTwYKyKmLG20xSnxaEp+Mjs/rGXQ4Yl0UBuQCnBZm9Li
         1piA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713300190; x=1713904990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6DlS4/ZFHRtR1n8rjuKFrNyH2RJ3e1I9x+YwBEN4QA=;
        b=cFaLufyCcWn46b8+/snqP9GpvZnZJlAv4Ao/zJbSWKsKW/nmBPFLK8ootwcF57bFvn
         J6E5fHn5OnHGjtD0bBr6cE+ttyTzvtLKh5Vu3NZadkaYPZKx66OajqdFJ2woS/4/g6RC
         Dl43tvyXPYFkSd0xc7DvV0/efzUjP/qlxX7LFNMVu85YQRkr5VupA/KhEsS+hXSqzUhF
         p4RkFmTsnw/a4+laSWKKIGqvYBXsnic3wM7MSDi92CknOTvER2gAm1K9HExpiSQjXbli
         qE5FRHKLlt+OjQ5T0+fHs0WK4myoUK9jm6IXbNnkHS4UzqMzMbzN+4vvJolvgTsKjmxW
         Q4KA==
X-Forwarded-Encrypted: i=1; AJvYcCUpSARbrBhTTBF05jsnPQ23LEvq+csQ5vNCPIf3jdni1f9fzkOEfD+d9ufrQqLW0PZmtBVB/ukOWTYQA3GfbMq7y5FLykN2f9MbzH4=
X-Gm-Message-State: AOJu0YwJlhziJYi0XYYMOaxsP2k7LFlSWy5n5M5QChmdlCs5wlYGyXWp
	uRG6Xo7YIum+slN92v/92OB9kV/LNNjZsbDkUiVHo0fqfsy6Kj34iiUzSlQPZPE=
X-Google-Smtp-Source: AGHT+IFyoZj5HEINi8NXkextzYF7UARPdxsaF/H0cx3mKUCsmkMsWC93P8slgpGTD9NT7JEfzLALAg==
X-Received: by 2002:a17:902:eccc:b0:1e2:c1fd:7bc9 with SMTP id a12-20020a170902eccc00b001e2c1fd7bc9mr18892761plh.8.1713300190182;
        Tue, 16 Apr 2024 13:43:10 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id lg7-20020a170902fb8700b001e259719a5fsm10208534plb.103.2024.04.16.13.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 13:43:09 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:43:06 -0700
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
Message-ID: <Zh7i2pir0j6tXfPD@ghost>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com>
 <20240416-underwire-bright-b2ab0fa991ec@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416-underwire-bright-b2ab0fa991ec@spud>

On Tue, Apr 16, 2024 at 04:16:30PM +0100, Conor Dooley wrote:
> On Mon, Apr 15, 2024 at 09:11:59PM -0700, Charlie Jenkins wrote:
> > The xtheadvector ISA extension is described on the T-Head extension spec
> > Github page [1] at commit 95358cb2cca9.
> > 
> > Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d3
> > 35e03d3134b14133f/xtheadvector.adoc [1]
> 
> This should not be wrapped btw.
> Otherwise,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I don't believe it is wrapped? It appears wrapped in your response but
it appears on lore correctly:

https://lore.kernel.org/lkml/20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com/

- Charlie

> 
> Thanks,
> Conor.
> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 468c646247aa..99d2a9e8c52d 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -477,6 +477,10 @@ properties:
> >              latency, as ratified in commit 56ed795 ("Update
> >              riscv-crypto-spec-vector.adoc") of riscv-crypto.
> >  
> > +        # vendor extensions, each extension sorted alphanumerically under the
> > +        # vendor they belong to. Vendors are sorted alphanumerically as well.
> > +
> > +        # Andes
> >          - const: xandespmu
> >            description:
> >              The Andes Technology performance monitor extension for counter overflow
> > @@ -484,5 +488,11 @@ properties:
> >              Registers in the AX45MP datasheet.
> >              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >  
> > +        # T-HEAD
> > +        - const: xtheadvector
> > +          description:
> > +            The T-HEAD specific 0.7.1 vector implementation as written in
> > +            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
> > +
> >  additionalProperties: true
> >  ...
> > 
> > -- 
> > 2.44.0
> > 


