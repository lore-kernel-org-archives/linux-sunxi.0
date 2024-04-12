Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFE514A09E
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712941090; cv=none; b=LwjBt3yRpjuOrySAWi797tQQr0T2mblEcc3nPsvxbWI8CCevPXP6X4v1G+XMlZS154zt+A/n2x49WS5z0i2y4E2scRc2E53fba+qLB3T0WiRHG/ZE0t6G/sZrxx8osL1ThhcaYoi9oBukE0CfeHoEwJPN541pyt+8KL1Oz3/aGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712941090; c=relaxed/simple;
	bh=z//6a/ujrWe0aR0i6I+FUKPGioDXc9HHkfE1eqzCmDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7AtXhJ79LJQEdeNU2zToIlztWdGtCwbXjx2t5ElRKNaF03Ntodz+GYsXIZsMeXn6FfkTSPt/qsBjVrfQcXNdXV6/pO00xjBt1jOZ3ZO1C3kGWCcjcyAqakUP3lE4bxvhwaPronNfCF6soVoYVnEHTzTMT1h/Iw9fugpj2UCD24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=UZ9EpkrD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="UZ9EpkrD"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ed267f2936so936257b3a.3
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712941088; x=1713545888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FJWVQnWLX/pkislYxbbN5qnILpyF7P63m18zWA+EsbY=;
        b=UZ9EpkrDpSr0inXqQbcTn+QHz2BjoDOeHV18DLpyAcoLdswsdTpZ6uivnV5oUmsPDG
         R1RlmN0bTdjRYPf101SXEiGWv5EED4lBfxVaZZS7ySovh/TOMFV1hN5kcB4EP7iT62sc
         q+CLtJiSqhrZ9qL2F2WjqdXu1tyzlPD2KMENuUPvM7hF3LXzFYUhXPJdOMQo2ihTie+I
         kD4yFUhNHsL1ecZFaS64b3VzgfsqcxFlEZkf6CZmStLIxw0LykUqveRdZaEhCfdlTepY
         Jmfa0iO4P161YblJQocv1aMww9uwhozW4LGsxojQEpqnXAprUyc6yqxZFAfmKEFVsdkJ
         j7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712941088; x=1713545888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJWVQnWLX/pkislYxbbN5qnILpyF7P63m18zWA+EsbY=;
        b=q4OWGJ23kXaNymrUsr79bsRcCczhEluVPuH6Yv2t+NN0yTfjNWBrPx/xVdjQ+2RUq0
         NNld63iNJJUTr8vsSts9CdI5SvNg7g6GR/ga2W3COX7GVUunZfoOazWoXJt2vmBchbA3
         o+gEQWJsHrJmyjl9GXzM87ia1lKhN8v9oxyIAJ90SdWCX1wZJgsY80r45aIQ7Hbp8Pjg
         bZT3fnmvja/jR0yutUoKij/2u+/Im/Y9Phhnbh1rZUo5trSp1a4xIXGKAHpzqy+GrIZ7
         WI31ewcmToXQ58ayfpuULnKqB4HH8vHykz3TDEPzOL8QZ5cWJsACyLUHdij8JC6Nyu9P
         aA2w==
X-Forwarded-Encrypted: i=1; AJvYcCXaQcqVkeOnrOuDsJkbrd+4fbuOCLH9+i6FlZphJSntrWQaO3LUir6ah0xJ1SK5SJpt4JBHoAtHxXNJUVeCZ+9jru+R6Rumxb7SG1A=
X-Gm-Message-State: AOJu0Yz2Hfl+ogponjAdIKAFPtXoSqkmQK0YOHC/Fxp661Mesvc3urBb
	tk8W7SvA2AnoJnRiDPhL5RG5yrWBcycCUGJj7OfUZi1+DTBFfOK7Uy8q0+cGOFg=
X-Google-Smtp-Source: AGHT+IGPCmN3W2HTZ0QmJ+6REUIlwbvOotgDE2tr5rxL5ipmW/2VnsTgQx/xnNwczxd72R2Uusa6Og==
X-Received: by 2002:a05:6a20:5648:b0:1a7:4b6f:7934 with SMTP id is8-20020a056a20564800b001a74b6f7934mr3088514pzc.17.1712941088421;
        Fri, 12 Apr 2024 09:58:08 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:121b:da6b:94f1:304])
        by smtp.gmail.com with ESMTPSA id a26-20020aa7865a000000b006ea8ba9902asm3085131pfo.28.2024.04.12.09.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 09:58:07 -0700 (PDT)
Date: Fri, 12 Apr 2024 09:58:04 -0700
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
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 06/19] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <ZhloHGxa5jRRR9xg@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-6-4af9815ec746@rivosinc.com>
 <20240412-sprawl-product-1e1d02e25bca@wendy>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-sprawl-product-1e1d02e25bca@wendy>

On Fri, Apr 12, 2024 at 01:30:08PM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:12PM -0700, Charlie Jenkins wrote:
> >  static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct riscv_isainfo *isainfo,
> 
> > -					  unsigned long *isa2hwcap, const char *isa)
> > +					struct riscv_isainfo *isavendorinfo, unsigned long vendorid,
> > +					unsigned long *isa2hwcap, const char *isa)
> >  {
> >  	/*
> >  	 * For all possible cpus, we have already validated in
> > @@ -349,8 +384,30 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
> >  		const char *ext = isa++;
> >  		const char *ext_end = isa;
> >  		bool ext_long = false, ext_err = false;
> > +		struct riscv_isainfo *selected_isainfo = isainfo;
> > +		const struct riscv_isa_ext_data *selected_riscv_isa_ext = riscv_isa_ext;
> > +		size_t selected_riscv_isa_ext_count = riscv_isa_ext_count;
> > +		unsigned int id_offset = 0;
> >  
> >  		switch (*ext) {
> > +		case 'x':
> > +		case 'X':
> 
> One quick remark is that we should not go and support this stuff via
> riscv,isa in my opinion, only allowing it for the riscv,isa-extensions
> parsing. We don't have a way to define meanings for vendor extensions in
> this way. ACPI also uses this codepath and at the moment the kernel's
> docs say we're gonna follow isa string parsing rules in a specific version
> of the ISA manual. While that manual provides a format for the string and
> meanings for standard extensions, there's nothing in there that allows us
> to get consistent meanings for specific vendor extensions, so I think we
> should avoid intentionally supporting this here.

Getting a "consistent meaning" is managed by a vendor. If a vendor
supports a vendor extension and puts it in their DT/ACPI table it's up
to them to ensure that it works. How does riscv,isa-extensions allow for
a consistent meaning?

> 
> I'd probably go as far as to actively skip vendor extensions in
> riscv_parse_isa_string() to avoid any potential issues.
> 
> > +			bool found;
> > +
> > +			found = get_isa_vendor_ext(vendorid,
> > +						   &selected_riscv_isa_ext,
> > +						   &selected_riscv_isa_ext_count);
> > +			selected_isainfo = isavendorinfo;
> > +			id_offset = RISCV_ISA_VENDOR_EXT_BASE;
> > +			if (!found) {
> > +				pr_warn("No associated vendor extensions with vendor id: %lx\n",
> > +					vendorid);
> 
> This should not be a warning, anything we don't understand should be
> silently ignored to avoid spamming just because the kernel has not grown
> support for it yet.

Sounds good.

- Charlie

> 
> Thanks,
> Conor.
> 
> > +				for (; *isa && *isa != '_'; ++isa)
> > +					;
> > +				ext_err = true;
> > +				break;
> > +			}
> > +			fallthrough;
> >  		case 's':
> >  			/*
> >  			 * Workaround for invalid single-letter 's' & 'u' (QEMU).
> > @@ -366,8 +423,6 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
> >  			}
> >  			fallthrough;
> >  		case 'S':
> > -		case 'x':
> > -		case 'X':
> >  		case 'z':
> >  		case 'Z':
> >  			/*
> > @@ -476,8 +531,10 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
> >  				set_bit(nr, isainfo->isa);
> >  			}
> >  		} else {
> > -			for (int i = 0; i < riscv_isa_ext_count; i++)
> > -				match_isa_ext(&riscv_isa_ext[i], ext, ext_end, isainfo);
> > +			for (int i = 0; i < selected_riscv_isa_ext_count; i++)
> > +				match_isa_ext(&selected_riscv_isa_ext[i], ext,
> > +					      ext_end, selected_isainfo,
> > +					      id_offset);
> >  		}
> >  	}
> >  }


