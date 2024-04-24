Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8D715FA7D
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972986; cv=none; b=duTtINc1q7EyS6gRuY4W+EbYAsvRsU5anz0y3QCB4wUGdaAXqh9jCODJIFTvv1g0WsGwbFx9WjvhZB522F8p0ydSHspLQehQZKxJ+wPk7fJgfHetl4sO7aWNW8X9iNPZnoAyP553tVse4j/jBg6VyGkDNCS814K32Mickuml8vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972986; c=relaxed/simple;
	bh=H/kqbfAVoGFvlhHgdIzd+BSw/1qG8jsiW3DecnDx3PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHNlEgmB8q3kbtrQ6legPvlpmZ0yT9WGyLslG0gWuoT4iYi1WzMExxEeK7RmsgnkoVhlaYuFL/188Xf6qVIcJp74+jFhkDewg9ZJb85NyxyO+Qprfez+lVYf2F799UU5S9TWIMEzemcIz34S2RWAGbfFutmbRQRuw+UY7hIeSvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dJ5YV0h/; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dJ5YV0h/"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-61b3be24dd9so517067b3.0
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 08:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713972982; x=1714577782; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOeTFyyci3z7BUZ6gEboB6kicq7JHa28+x4pg4U/L9Q=;
        b=dJ5YV0h/rZUN2VCfrSqppogDjRFbZo0//t9FDS9zm1LDReU2M7fBcXu1DNK0CmOj9d
         1KiuPKplQZvpOFp8UAZhyPZAaZyizfTcswzY1gvRS2AcCXxim8u7RLZPPwMm+2ApTy7p
         iWWBVSz1dbrz49/Wi+5eum5xv9DyXBtOGc0pWvbHHolb16qW1mAj/YA3JcqJeRcaRVt/
         CCNBL76NShzNx1qgISsL2XJrmTWRhtqON5mwy3D4Cmlqwl0Zt0XaBwUcbFiLzc5O/WtE
         +IAteyAmopiP8KQaUOnO5Tr/SIfW5OD8JmHKmXRXbrr4EvSmFnSNgVAfMIio74B1P2aY
         XPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713972982; x=1714577782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOeTFyyci3z7BUZ6gEboB6kicq7JHa28+x4pg4U/L9Q=;
        b=b9Yu8NkjqNH7LnBj1xLs3oDt4a7sSyt8iPc52xIf7ljquK8eheUL8vMovkr2psmwqJ
         gynahc1w/LslGyXvE61uZuHx3TJM3qm6yXG4A9F8OfVfQVbZAcQ9OGXdmcMH3iktF1Sd
         gnvAJJZb0L/YYAO3D4Lwa9MFH4eydZfOBGdaQOdjIYpEONPz48q8lHMCNEIwea/kMjNb
         ejJ1owK/DbAXhDSg3GdxjoNhKn8cQFx2jYOo2MWdbG/aW8qiKj8zUMmw/UOSHnN47yEo
         H4nqu7dzTGeR69VINb/8ZYghxhO1bPXQ7sZ0TWdhs7xU+F32X/9vyvC0FADKOe9Mh+UN
         g/Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVkgLTEPGsfsDQrkiXkgpguaEoB8DHW0x1GsIwW5wU9a08V4zfmmdW8rz/mkE2xqPFhBREPtU12hrmOYGpBXZcFMTU0GmvyrLtiC6I=
X-Gm-Message-State: AOJu0YySE71l16FvAeAFibQ9dLSoP/Mv257XDc2xMv95ZaZmY6jMcB7a
	8TLl3PFb/X1Zm9WsNOZGXUAxyH/dwQcQ4pXOgd7zqZRJzfGaOyRIjBZLdLCdCuc=
X-Google-Smtp-Source: AGHT+IGUqY1hEYLyvR7VYD34HR40H5BCTS3NDhpEtJYnVydiqbsmxy3Dkl9KuCGBuZqe3HcyqLC03w==
X-Received: by 2002:a0d:cc12:0:b0:618:88d1:f15f with SMTP id o18-20020a0dcc12000000b0061888d1f15fmr73152ywd.0.1713972982354;
        Wed, 24 Apr 2024 08:36:22 -0700 (PDT)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id j82-20020a819255000000b0061ad72dd577sm2417745ywg.112.2024.04.24.08.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 08:36:21 -0700 (PDT)
Date: Wed, 24 Apr 2024 11:36:19 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v3 06/17] riscv: Fix extension subset checking
Message-ID: <Zikm80mmHFYoaAOF@ghost>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-6-67cff4271d1d@rivosinc.com>
 <6c624361-a968-498b-a9fb-ea2aaec70ce8@ghiti.fr>
 <20240424-wildly-goofy-c81aac6f8cd7@spud>
 <ZikhpEgEoMX/rObu@ghost>
 <20240424-gondola-cosmic-b7a02b2a8619@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424-gondola-cosmic-b7a02b2a8619@spud>

On Wed, Apr 24, 2024 at 04:21:05PM +0100, Conor Dooley wrote:
> On Wed, Apr 24, 2024 at 11:13:40AM -0400, Charlie Jenkins wrote:
> > On Wed, Apr 24, 2024 at 03:51:54PM +0100, Conor Dooley wrote:
> > > On Wed, Apr 24, 2024 at 04:22:02PM +0200, Alexandre Ghiti wrote:
> > > > Hi Charlie,
> > > > 
> > > > On 21/04/2024 03:04, Charlie Jenkins wrote:
> > > > > This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
> > > > > than if ext->subset_ext_ids[i] is valid, before setting the extension
> > > > > id ext->subset_ext_ids[j] in isainfo->isa.
> > > > > 
> > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
> > > > > ---
> > > > >   arch/riscv/kernel/cpufeature.c | 2 +-
> > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > > > index 48874aac4871..b537731cadef 100644
> > > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > > @@ -609,7 +609,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> > > > >   			if (ext->subset_ext_size) {
> > > > >   				for (int j = 0; j < ext->subset_ext_size; j++) {
> > > > > -					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
> > > > > +					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
> > > > >   						set_bit(ext->subset_ext_ids[j], isainfo->isa);
> > > > >   				}
> > > > >   			}
> > > > > 
> > > > 
> > > > I think this should go into -fixes, let's check with Palmer if he wants to
> > > > take this patch only or if you should send the patch on its own.
> > > 
> > > I think splitting out this and patch 1 into a new series targeting fixes
> > > would probably make things clearer?
> > 
> > Okay I can do that. I will give it a bit more time before I send this
> > series split into two to allow time for the rest of the patches to
> > gather comments so I avoid sending too many duplicate patches.
> 
> Ye, I do hope to get back to this series later in the week when I have
> time to actually read through all of the patches in detail.
> 
> However, you wouldn't have to resend both parts of the series - you can
> just split out the fixes portion and send that, leaving the rest of the
> series sitting on the list to gather comments.

Oh cool, I will send those two patches out in their own series then.

- Charlie

