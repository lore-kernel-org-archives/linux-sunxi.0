Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA2C29405
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Jul 2024 04:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721881043; cv=none; b=fkgow5f7dHnd3bwyr2x2aPXEZyjI7+m0PX7b60+VEtOm19SjKnclM3KX4IyLROtFbssMRNr0zMYEormu6B2dzwvSnvOWGRHncL9LhKi+wEGrckqQwY8iauRX26Vs4mIwOVpr/79Nla28bGt2iCsH1qY6SJt1ObdtqPIxCqsaP7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721881043; c=relaxed/simple;
	bh=Kj0U9MTC5AyxWQYTo+VsBcBXCC89clLXpFMQ9HWKWsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dw+ZmAz4DRxTi1U2JYUyDoMBgZeyZ1kabAf1ZSI0HZNLUvQLVPWbxzxiItclwpcyD4DGAmU9ttjeakM6wym0zJRCklVWl1ZctdZkLs/OY8aWrfRpvL3XQS7bLEoNBRlagqMZ81xZj/kq2Mr4a6zKDNDmlGR8RdqoTd68I6VGvRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=NwXn2K1G; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="NwXn2K1G"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70d18112b60so372373b3a.1
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 21:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721881041; x=1722485841; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+VMdQmHWFgj58kNWJtoryibFDwz3t5+vVkcIVzkHLE=;
        b=NwXn2K1GBTUXdPaJeGz2c9/doxxReklvEJSFmvf9j+5nLqme/kq8es/VC4A+aWfoEP
         sDUxv6/aQI3DbABozROAbX/njD9xu5LMwXiSfkBE8rvuxwFAXlmNqto3v9nXpKfQLAVg
         fLxdmf1WNSXIbcNMBT70Ok2w0DSyZFzfJQj74ujIi4CJJ3+CRzGrVEZQoIpYxojIf5n2
         ss8+iqW5ZijoChijMjLjcVxouxPp51jCl5P5a22tiVlxLe6/QgAffnQRlvItyqyM7EiX
         eK4NQqms6Xh/jWv96AQgs7SUb1DwJ8WEZ4BWeF/j8Vz3uJLsEvoPEPDTOQMtil4ZL6bW
         /ESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721881041; x=1722485841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+VMdQmHWFgj58kNWJtoryibFDwz3t5+vVkcIVzkHLE=;
        b=PbNtKhtegK54JGKrWEydZyMgjpP/fNeblw0MEJdYuHfCMvycGRPTB+SkUGSAn1qp5W
         jEtb7eiSFp1qsFUouYLroxAYtC3c5pzvGbDVnHJeYtjUkQmJR+wehky8G+r1m8bDIHkV
         374frdqaND5n8ZxU8k5H4XwCrPqrwBNr9UvO0gFMV8tn4bRb3VfLGJRiLvnig+X0tTiR
         TWgl3sgk+JmE4ZqQJlLYJDpPPumxh9S5b0o4KWV7BwT9vtH/7Wmr9G94DJiZBmyrN2MJ
         ppWx4hFntKF0ZnRLZHMumpl3zorrcBOiQsvkI66/iNv87P4f+BWjTCkde1G5KQ5SJr8Q
         zkxA==
X-Forwarded-Encrypted: i=1; AJvYcCV7uxIcufbMd199MALlrBFpk+lQPJ4GlbSy4KMgwnevWA6teknzHObbqiQ0hBZDmpOflXDYo2ixEdkDSjKQD0jQ2S3TpBLXbKTXdz8=
X-Gm-Message-State: AOJu0YypjTh1SLP1Unwx8HZqd52GWIjfNQzSTm4sxTsfZHqy62V3lQOg
	AOycNRxhjs0rvdnpj1GoVTmaQHOwg4q53czIBK0bMgVjSA/YRXwB6xQSfoSb02s=
X-Google-Smtp-Source: AGHT+IG8/lGGFfeqD0yKL6Ukrgul7u0XCxEnqHsWKKVCOGqLNIttHBNHSYlpgXB/YPJd1O/zSdOyZQ==
X-Received: by 2002:a05:6a00:66cd:b0:704:151d:dcce with SMTP id d2e1a72fcca58-70eaa1e2e1emr2589164b3a.5.1721881040621;
        Wed, 24 Jul 2024 21:17:20 -0700 (PDT)
Received: from ghost ([2601:647:6700:2d90:4e8c:b287:20dc:e447])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead874b35sm322537b3a.167.2024.07.24.21.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:17:20 -0700 (PDT)
Date: Wed, 24 Jul 2024 21:17:16 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	jszhang@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, samuel.holland@sifive.com, corbet@lwn.net,
	shuah@kernel.org, guoren@kernel.org, Evan Green <evan@rivosinc.com>,
	andy.chiu@sifive.com, jrtc27@jrtc27.com, ajones@ventanamicro.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 09/13] riscv: vector: Support xtheadvector save/restore
Message-ID: <ZqHRzAI0O+zsZd3A@ghost>
References: <20240724-xtheadvector-v7-9-b741910ada3e@rivosinc.com>
 <mhng-28424e23-c9b4-407e-97d8-9dbb09101781@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-28424e23-c9b4-407e-97d8-9dbb09101781@palmer-ri-x1c9>

On Wed, Jul 24, 2024 at 08:23:27PM -0700, Palmer Dabbelt wrote:
> On Wed, 24 Jul 2024 12:14:00 PDT (-0700), Charlie Jenkins wrote:
> > Use alternatives to add support for xtheadvector vector save/restore
> > routines.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> b4 isn't applying this, either on top of your last patch set or rc1 -- the
> base commit in the header isn't a hash I have, so I'm not sure where it's
> mean to apply to.
> 
> Also...
> 
> > ---
> >  arch/riscv/include/asm/csr.h           |   6 +
> >  arch/riscv/include/asm/switch_to.h     |   2 +-
> >  arch/riscv/include/asm/vector.h        | 225 +++++++++++++++++++++++++--------
> >  arch/riscv/kernel/cpufeature.c         |   5 +-
> >  arch/riscv/kernel/kernel_mode_vector.c |   8 +-
> >  arch/riscv/kernel/process.c            |   4 +-
> >  arch/riscv/kernel/signal.c             |   6 +-
> >  arch/riscv/kernel/vector.c             |  12 +-
> >  8 files changed, 198 insertions(+), 70 deletions(-)
> 
> [...]
> 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index bf25215bad24..cb48092fdc5d 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -845,10 +845,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> >  			riscv_isa_set_ext(ext, source_isa);
> >  		}
> > 
> > -<<<<<<< HEAD
> >  		riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
> > -=======
> > ->>>>>>> 0f260ac829ca (riscv: Extend cpufeature.c to detect vendor extensions)
> >  		riscv_fill_cpu_vendor_ext(cpu_node, cpu);
> > 
> >  		of_node_put(cpu_node);
> 
> This chunk isn't applying, and it's got a conflict marker in there.  So I
> think that means something's gone off the rails?

I really messed that up... Okay I sent a new version that is based off
of your for-next that should work?

- Charlie

