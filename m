Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE3812F395
	for <linux-sunxi@lists.linux.dev>; Wed,  1 May 2024 18:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714588661; cv=none; b=AyAsSJInTfM7nn8Tiwe5RLP3T18gzxIJQ0pc86BQnD4/WJ16g4SiCD1SWy8wbauRTZWJ1R/AsgQj3GuFTEle4A9I4ZKs8bUfY9XeyMXOH+SaDFfZwvYUD1Pc5H4LL4hv4FOK6sJH7WwA6sDAiNwpN3BgSM5q4qYTsN6uMsf0Npg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714588661; c=relaxed/simple;
	bh=JuEww4VdQj0DUkQJJy7CdW/ah+PwXXtcE+4baSBSWmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9ZjHrX+mOBQGfCJeGGW3e0obXswAZz52wK+uVbN6kScBKLJg7uIk6mrOhUmu753Co4qrBnDEhXKsXiqb2jHppbK6IebRmBozrwgz3/ukdF8ZSN92qCByi2i16UXvVyTumSKV5vrfDHUsnXCq3QAH+sq1GipxWWNcpBWccLdY78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=DhM/N0W1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="DhM/N0W1"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6edc61d0ff6so7084883b3a.2
        for <linux-sunxi@lists.linux.dev>; Wed, 01 May 2024 11:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714588659; x=1715193459; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UPPZ5LFjy8shqZnGR3m66PAl3+HNQfmLTm+BXjtgDiI=;
        b=DhM/N0W1jSzsOWxjpJrW9woxnrHo1QI3mGojAQjBnaNuGvkEXcBw5RnwES1zawp1Sk
         CLDlMgm3yFEENKbslMzUT+VNqermaz5SxJo5f7TFyIflLBHeHPnEzF+b9Vr1Bk/+C6Fb
         QZ0Pavy16qUxn+trDU5kWtW3it/U3282r3Uc2xYX9l1aaCt3iRpEkJGX2daFxVE1bKeu
         Uq6gvoimvchJdWqFTCGTlUGhvjS0obdc65XJXXVkHmzAq7La1SPQ90JBrMj19AZRDY0G
         X9wb08feVpwPx+AikA8rR/n7zL9pqNX862eu1e4jrRpIsXUMhYdnh4LbhrfuScQ68H0Q
         1PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714588659; x=1715193459;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UPPZ5LFjy8shqZnGR3m66PAl3+HNQfmLTm+BXjtgDiI=;
        b=SzmBK5NUqA8aD8CnmKBmJ8RGdc4kpkitCFMLuGcOuJEctkpu1FfPDestzPG5KUw6B4
         tP2OQpvGb1mnqpNlBisHmynk/DBk615Y4CqjzlPPLfxRrUy0TywNAWWSmN/3R6f7mZyL
         51InXGKoApOm0rHoO9Guonk4Hzuo5SdPzjaeNrworwTDtSQXeLzi2i1COAWG4cahXtKM
         ucGwOxdW8IOT+sGVqcQqaz1lp6EPqU4gv68kbhOjG+Ut8WZqca6iFjQpHrAGaiGYdRCm
         p9I6cRsc+nFJTRjtt1NCYpBvvVg7GKk/5PpRz4xe/A8bBT1eKZwx0MK6RaR+GyFk73HE
         VEUw==
X-Forwarded-Encrypted: i=1; AJvYcCXrOerkMCI0s+5FZzpzjFfGK8k7j7X3MpKWxDzKr985fiEQ37uVQdgkT9VhBvvuszbBi0m8lvA7DPtKC5yJl8UrrbYrdvtBwKxOiFw=
X-Gm-Message-State: AOJu0YzObtjPJwolhRO6bo+A2Acfp89Ju6g1Jf69yYMCDiqyVXtNwMxr
	P2KElwteBI2D0Hw7ZmLnY3hlAa7PTJhep9mYsOJz5JSaQ2uGix++SV+QWM86Z7Q=
X-Google-Smtp-Source: AGHT+IFvmfcgG9gsaJ1/osT3hsX+JLkHUCdFQSUoli8OLgDET6zbJ2GqgYGb+4vjIsoV+zp3JnL2Pg==
X-Received: by 2002:a05:6a20:8425:b0:1a7:3b4a:3e8 with SMTP id c37-20020a056a20842500b001a73b4a03e8mr4113035pzd.7.1714588659240;
        Wed, 01 May 2024 11:37:39 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090ab78800b002b15e6ec4efsm1672349pjr.15.2024.05.01.11.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 11:37:38 -0700 (PDT)
Date: Wed, 1 May 2024 11:37:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Evan Green <evan@rivosinc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <ZjKL7x+s5AYzdCGE@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
 <CALs-HstM64Hy_=XVz=0sWQt=8j1u+bq6RhthUuD3P0E4=HyvcA@mail.gmail.com>
 <ZjKBKg5zzikR5ngl@ghost>
 <20240501-banner-sniff-4c5958eb15ef@spud>
 <20240501-moneyless-shifter-a54bbaecc4e7@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240501-moneyless-shifter-a54bbaecc4e7@spud>

On Wed, May 01, 2024 at 07:09:28PM +0100, Conor Dooley wrote:
> On Wed, May 01, 2024 at 07:03:46PM +0100, Conor Dooley wrote:
> > On Wed, May 01, 2024 at 10:51:38AM -0700, Charlie Jenkins wrote:
> > > On Wed, May 01, 2024 at 09:44:15AM -0700, Evan Green wrote:
> > > > On Fri, Apr 26, 2024 at 2:29 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> > > > > +       for (int i = 0; i < riscv_isa_vendor_ext_list_size; i++) {
> > > > > +               const struct riscv_isa_vendor_ext_data_list *ext_list = riscv_isa_vendor_ext_list[i];
> > > > > +
> > > > > +               if (bitmap_empty(ext_list->vendor_bitmap, ext_list->bitmap_size))
> > > > > +                       bitmap_copy(ext_list->vendor_bitmap,
> > > > > +                                   ext_list->per_hart_vendor_bitmap[cpu].isa,
> > > > > +                                   ext_list->bitmap_size);
> > > > 
> > > > Could you get into trouble here if the set of vendor extensions
> > > > reduces to zero, and then becomes non-zero? To illustrate, consider
> > > > these masks:
> > > > cpu 0: 0x0000C000
> > > > cpu 1: 0x00000003 <<< vendor_bitmap ANDs out to 0
> > > > cpu 2: 0x00000010 <<< oops, we end up copying this into vendor_bitmap
> > > > 
> > > 
> > > Huh that's a good point. The standard extensions have that same bug too?
> > > 
> > > 	if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
> > > 		bitmap_copy(riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
> > > 	else
> > > 		bitmap_and(riscv_isa, riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
> > 
> > I suppose it could in theory, but the boot hart needs ima to even get
> > this far. I think you'd only end up with this happening if there were
> > enabled harts that supported rvXXe, but I don't think we even add those
> > to the possible set of CPUs. I'll have to check.
> 
> Ye, you don't get marked possible if you don't have ima, so I don't
> think this is possible to have happen. Maybe a comment here is
> sufficient, explaining why this cannot reduce to zeros?

Okay cool. A comment is sufficient then.

- Charlie

> 
> 


