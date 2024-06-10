Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCFC14387E
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 16:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718037493; cv=none; b=LIzzBqDlGz/qP4fguSPSi7aKAvswRhPH4P0keReWliFrWjkOeGwNfvwtu/o1MQBcvkHhm9XW0VE3HPh48WvzaIk7WtAJeCIJ3Ghcp+vU4DVZN2rMXAehmuA2vwMqNUJCslNOU4YscyqTaxuULgYGX+/rJU8W0vPzqMl30RruHnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718037493; c=relaxed/simple;
	bh=kiJ5B+nQ3bNrTcSfOUxREX/Sxo9421n4Dpjf7djMOc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9jIH/epxPcA/Awa49m+tyZj6gG/Zv99F5f8M+rM7AgGtyrszS8qACrevAK3PkL/Xk625Xc4er7Z9AHynAn288WFqwIA0uPy946w+Qcqcs4tYn7bpQ2gO154qKcdYHZqiAhkIPWaE/bWv5eYydvqeiZ2BCZ7uW/i4VQ+ehHzxiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=3PMKq4J5; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="3PMKq4J5"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7041e39a5beso2001498b3a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 09:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718037490; x=1718642290; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NXoCBXdsY/M+q0fRNH+4Z39Lx/Z6bNhqTdLOeE8sP8k=;
        b=3PMKq4J553b3B8RQOxzzrHEBBdgfA4AFUbJtvF0i5TkRpegA1I3iTW156yKejF2TbB
         +Pjrhi8nAWIwnPJlY+fWA1dYYu7Q1+gij9eJuOri+XCw7MgXM2skkD7CoIE3ZteZeotq
         3OLLx6uJmw+feWRi++Am1Taqnzw10UsWkctrPx2d/3Mb62xpPnYWkKp0DZc9qzgZc46Q
         Vw7FJtiu5P3Qdg/HiaBmB+RrA673w4ubs97yvkD74YF0K3DPt56Gtlc6VxavQq4bbohO
         9QZJjM3mKfOGpc3IHTxpXzpEsYSVuzNMDgdwIW/a3/VTX2HXk5ck03892GHNKkXnK2kx
         blqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718037490; x=1718642290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXoCBXdsY/M+q0fRNH+4Z39Lx/Z6bNhqTdLOeE8sP8k=;
        b=B1wMfkXBbOKfO2HFDds3v+R7RDyOpSaNdRu9/SFP/rW/JoxsOfmM+i2mEThV2zVp9Q
         Wkdb0Bc8q4gtyFbaGwAAIYerq/7u+RrNsX2r26ai8U8OiTz0F4K6qp74jetOekziT6X0
         /pMme2M6QdO8cRW25sltNQeOrMNpMWjnfyDOWuXqsKSEPELdJ6Huj/++7qphW1gG1NDk
         +sppkinon9iNuvfXkEsDrpYfImibf77/5I0LG2jUbm18WpWBDXfwsAq09D+BKFEoEcAj
         xOfMK4VQozLPKPdtmjoKWlkg8cMPCOQanBla8CdA+sCmKiR1yZCB3hWp7eAFpJ2c+Fnn
         TZQw==
X-Forwarded-Encrypted: i=1; AJvYcCUF0Eg60DMJEn2FTN3wwTtGx4BzpVMFjbnCOjIQR+Xoj7L97PDWZjQBydy1+YT/9vlBUWVbCkDv9arktCQfUmSrXLuhcMqPZ5HONwo=
X-Gm-Message-State: AOJu0YzOwMN7HXtWv3RzGp6N99LQYHm62+PcVzf3asyUTP7nrvOlYIq1
	wewCjUfs9C3EIRVdPFlpaP5PP9ZAkaTitjpAurdSBAL7NOw3Z3JnlO/6vGWlKGQ=
X-Google-Smtp-Source: AGHT+IE55hp5TAOsUAoyvyS756iP3CfmNdcn1/vY5DaP2UtK03lkcl/o+b2HM769MgzylCW45JEhTg==
X-Received: by 2002:a05:6a00:138c:b0:705:951e:ed88 with SMTP id d2e1a72fcca58-705951f1f4cmr3638587b3a.25.1718037490325;
        Mon, 10 Jun 2024 09:38:10 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:129d:83bc:830b:8292])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6deb62efb66sm5525307a12.12.2024.06.10.09.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:38:09 -0700 (PDT)
Date: Mon, 10 Jun 2024 09:38:06 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/13] dt-bindings: thead: add a vlen register length
 property
Message-ID: <Zmcr7pP+XEWHYTsy@ghost>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
 <20240609-xtheadvector-v1-2-3fe591d7f109@rivosinc.com>
 <20240610-unaltered-crazily-5b63e224d633@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610-unaltered-crazily-5b63e224d633@spud>

On Mon, Jun 10, 2024 at 05:29:23PM +0100, Conor Dooley wrote:
> On Sun, Jun 09, 2024 at 09:45:07PM -0700, Charlie Jenkins wrote:
> > Add a property analogous to the vlenb CSR so that software can detect
> > the vector length of each CPU prior to it being brought online.
> > Currently software has to assume that the vector length read from the
> > boot CPU applies to all possible CPUs. On T-Head CPUs implementing
> > pre-ratification vector, reading the th.vlenb CSR may produce an illegal
> > instruction trap, so this property is required on such systems.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/thead.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
> > index 301912dcd290..5e578df36ac5 100644
> > --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> > @@ -28,6 +28,13 @@ properties:
> >            - const: sipeed,lichee-module-4a
> >            - const: thead,th1520
> >  
> > +thead,vlenb:
> 
> This needs to move back into cpus.yaml, this file documents root node
> compatibles (boards and socs etc) and is not for CPUs. If you want to
> restrict this to T-Head CPUs only, it must be done in cpus.yaml with
> a conditional `if: not: ... then: properties: thead,vlenb: false`.
> 
> Please test your bindings.

Now that I know `make dt_binding_check` exists I will use that in the
future!

- Charlie

> 
> Thanks,
> Conor.
> 
> > +  $ref: /schemas/types.yaml#/definitions/uint32
> > +  description:
> > +    VLEN/8, the vector register length in bytes. This property is required in
> > +    systems where the vector register length is not identical on all harts, or
> > +    the vlenb CSR is not available.
> > +
> >  additionalProperties: true
> >  
> >  ...
> > 
> > -- 
> > 2.44.0
> > 


