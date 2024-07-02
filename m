Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768653A260
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jul 2024 05:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719899176; cv=none; b=DUsypWgkOP1jP05Mn3SbmtAaf+LkN8CM873K9faehfOQWuMDR+Zs9BiQ1+cNK0tAYz3o1m+Prep2s6srfvEeKRghmFqc78cv6y6cNgqCWIS9oeBcPU0QtzuaeC24458aGGq2NMjl87UBgR8hQQULNZem7pLPBCpoXdMdEgutcdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719899176; c=relaxed/simple;
	bh=AdkaUjRTJIhO/K8YUDZQ1Q0hdKG/eUYO18zWbxAkJ+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/nrtbuKW/23aSUsaI8JHOuIl17EMNgZEXJU/5v2vKHgOtyTcUzO6zG46GxPviTCcdyvxGq/IzWeV7SqaTd/vgbBMDrXB0WI2981SC4dwOanPkTC5/GQyfG4k0AV3FGZzn47vV8mNr1cfjHjZjXIL3GUTFN6Xn+pBCI5o+o/NeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=v+aXNC6C; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="v+aXNC6C"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-706b14044cbso2740166b3a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 01 Jul 2024 22:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719899173; x=1720503973; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BGGBEWgqwliEqnZATHjMM1K2Xkz4OG63sXpZDZIsbfo=;
        b=v+aXNC6C/BB0HgDlu3mUv0gdmJb5MiJ5R7H3HnBndBwcwmzdC2/+tr4udcAuQEF/9L
         BrpoutrSLRHolPNNUgzyInib2IF1crn+01ynes9NmN0EaADrClrWQyDw+KeWmEpmQSuz
         bw6kF7p0MIqpRImcwBgR1YCySR+p4W7LEMicEVy8oj2fyGwaySH2c1aCDCOVCu7owKHn
         vCtWmLnBB4bVxg65Nq5X5iN2UWwJLoiZcqNlI+sbTGnh2doRlOv1eGH61t3hhNY7xrYN
         rCQ/rnjWabIkxg1YS0dxuz7p3AIuvlf0Qt2r/vT4mwwwHNaeE5LirfDwdA3PiuFmBK8k
         z9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719899173; x=1720503973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGGBEWgqwliEqnZATHjMM1K2Xkz4OG63sXpZDZIsbfo=;
        b=OhYSJvp80dh74KKn4iY0NUZwHumbRKZ8OXqwQywV5igb9tQ4JZIXOMX6UF/y7KWL5c
         pIk9cd2iiIAm6NhXHpIxDK2+63PNsrR7M4wMdKGQR6L9DtsqKzaLtgyBBGaZ00/kqZuB
         gZSXKuZSR+5y6tTzGdvYfjnPjm+/pv1bd7K+2MZ6yhi0xfu33TprHGUvBZM/yEo6yxwA
         /8DgmTDVaAV3ZIjQssEXbLtwp/9kLhkbB6KkWxH3yoYbsaZX5bL50ngQ6gb4HxZRoqXe
         qY1YPCsiMjgdokPWfF/wVEysPIj+IjpE0AS1ZOOKDyJ/+4FMiWNzVt27wyoBaZ6H7fuv
         0LTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/QwFFaPr9PqFp70mZ8LCgc7/qEUFI6Gqj5rRFafodL7nVQEvHqC1wUyiww2bcAQU2vsna5V1wjhuTITnwKveIkNT6f4nScoLXkao=
X-Gm-Message-State: AOJu0Yx1qRjiNN6JlL56TdpnBIlCNuSga2H96xGA2V9H/wr1HXbgtYcL
	+lvFGHoqdUPFZkzQLp96FwGwPT+DL8gfwTYylVoIFQWAiuo/s3q1SkXCpvkmk6E=
X-Google-Smtp-Source: AGHT+IG2WieA6d2VXCXPEULk6bM4rk8RGnz2VXlb5+XlqbXE2HDHRrkVhtC3A7gynucOeClBzA/BEQ==
X-Received: by 2002:a05:6a00:3e1d:b0:705:9a28:aa04 with SMTP id d2e1a72fcca58-70aaaefd5ddmr6625232b3a.23.1719899172664;
        Mon, 01 Jul 2024 22:46:12 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:a569:328b:99ad:ce17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf95bsm7787118b3a.140.2024.07.01.22.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 22:46:12 -0700 (PDT)
Date: Mon, 1 Jul 2024 22:46:08 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v3 07/13] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
Message-ID: <ZoOUIJIxnwpqxBHR@ghost>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
 <20240619-xtheadvector-v3-7-bff39eb9668e@rivosinc.com>
 <54232f3e-4fea-4996-a90b-6de51e1c51e0@sifive.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54232f3e-4fea-4996-a90b-6de51e1c51e0@sifive.com>

On Mon, Jul 01, 2024 at 10:49:23AM -0500, Samuel Holland wrote:
> Hi Charlie,
> 
> On 2024-06-19 6:57 PM, Charlie Jenkins wrote:
> > The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
> > has an encoding of 0x9.
> > 
> > Co-developed-by: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/csr.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index 18e178d83401..9086639a3dde 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -220,6 +220,8 @@
> >  #define VCSR_VXRM_MASK			3
> >  #define VCSR_VXRM_SHIFT			1
> >  #define VCSR_VXSAT_MASK			1
> > +#define VCSR_VXSAT			0x9
> > +#define VCSR_VXRM			0xa
> 
> These are normal CSR indexes, so the prefix should be just "CSR_".

Ok, I can change them.

- Charlie

> 
> Regards,
> Samuel
> 
> >  
> >  /* symbolic CSR names: */
> >  #define CSR_CYCLE		0xc00
> > 
> 
