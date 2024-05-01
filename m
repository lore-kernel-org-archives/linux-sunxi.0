Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBB1161320
	for <linux-sunxi@lists.linux.dev>; Wed,  1 May 2024 19:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714592899; cv=none; b=VSToAHr3eD2N5DREqSMk/QstV38qreSIBAeZsw94zHXhWWkoZ54dKtofez+I2DvZf+kRQU/w0S3QTODGlgXUhJFDujj/vz6uhKzOWsAyZP9xlNupzr4yCcbPGY1CgrzReFqfh8GzY/p3XmnCGV0V7fUJYQxB+yC6egiveVbroSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714592899; c=relaxed/simple;
	bh=0xusBx4mvpGkzkWD4XBTeQoGUcYyDndMqcZwmTR7iPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwchsWL1R7We7fXi7GgV1OY4gufJaDEXSZPeAMQjtYebH38XsgpDbu7kBi8L+wJcUi0gQYN5YGJBTB1hms8P0u4IFBJ0O/BeQdF9zq8iUUUjh3T9DrCkbhYfOOc/dzN7d+BuphzSeWd2C/pEHPomEC67iK2hVkOtUcbidJxxQls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=DLcKY6cT; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="DLcKY6cT"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e4bf0b3e06so71459455ad.1
        for <linux-sunxi@lists.linux.dev>; Wed, 01 May 2024 12:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714592897; x=1715197697; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JtC8dm20imTdKCQqTW5smBrp6Y6uvCPu1xFL49hxPB8=;
        b=DLcKY6cTH8NKN8ftdBSPKtq7mFmlJ2EJoWbROODVdUvnhib+83sSiu0V4tcKn3d6fH
         /B2ZB/jorhMvdJ7MzzcvIbmuDR6jTFmfKi+eH79eO88h400rLJwYpko1vjVTjwteUOUD
         SShii5lSzAOXoalpGPVFOO5jrgxQShT+jQ4n+OW/m97PXBOh78WjUYleYR32hqirhGne
         DNbWXe+sUtTejcYVCL2w4ZmaV9Jh5dLjiz9ImQkNh7TIfXO+/6vv0ZzEtRu+lMCq0f7I
         TO0OOhPWV4Fg/+ZB6ipai/HbKb10iPZALjci0jbcd4UOs9JyKJd/hqSch4/r8BXHG0vQ
         ZVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714592897; x=1715197697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtC8dm20imTdKCQqTW5smBrp6Y6uvCPu1xFL49hxPB8=;
        b=fcpljHjboe04tnUOHS7x0E9iXs8MsSVFcPF5R2cAHY3gCN6SXa85cR9bPlHGmjcUy0
         F7l0EZ380lJEPsXHrYEztyNSZLGA8fekbrpKWx/iyW2J0WKq2insN4oMfoL+QIprhBcB
         jMQ7akYv46cCYoLCW1iVx45e3cJs2cilYzF4rS0ay3Il1g9pK2TESmTm8AtSM8dJfPlR
         bf4taB6bW4p22VpNXcvEA9szRfeg4CrQ4Zp1I4fmzab+z/v+G5uKB75uyzMxxroTMB5E
         HevwYFO5FANRF17Yl+ceYn7QmE36c3bptxlb6PMUrbrir8RNv1rR9pMaquFHrcsyUMyp
         I1lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcRr61ve0vJsgPRlfooPwHFADdFP17SbjBJ7Ub25gj9persrzTN/kWa4OGWDRELMePKGm+e2hXcZe8IUEa3lk15vWKdF4ABjY+9b4=
X-Gm-Message-State: AOJu0YwiTTGDm+6Vnzf2ul+yTXBVt2OHrUELZZmSqLSn4bk2a7Wx8Ycx
	dL6ti+AQcHqpVpDInHp9TrA1e7Nqk1HWc0GA+5OCYuzNl6UYRC5eVpL8XZdHmnc=
X-Google-Smtp-Source: AGHT+IHqE9T7lF1XvjCAtRw9iaYnvm5Bt1x7gAa4owqnGBOgOTMkA2A37jDPqx0fFTLOHQocKAXYtQ==
X-Received: by 2002:a17:902:d506:b0:1eb:2fa0:c56f with SMTP id b6-20020a170902d50600b001eb2fa0c56fmr4034243plg.35.1714592897320;
        Wed, 01 May 2024 12:48:17 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090276ca00b001dd69aca213sm24321702plt.270.2024.05.01.12.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 12:48:16 -0700 (PDT)
Date: Wed, 1 May 2024 12:48:13 -0700
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
Subject: Re: [PATCH v4 07/16] riscv: cpufeature: Extract common elements from
 extension checking
Message-ID: <ZjKcfZsWgR1AY3AZ@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-7-b692f3c516ec@rivosinc.com>
 <20240501-probable-unfunded-746ef6ae1853@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501-probable-unfunded-746ef6ae1853@spud>

On Wed, May 01, 2024 at 12:37:14PM +0100, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 02:29:21PM -0700, Charlie Jenkins wrote:
> > The __riscv_has_extension_likely() and __riscv_has_extension_unlikely()
> > functions from the vendor_extensions.h can be used to simplify the
> > standard extension checking code as well. Migrate those functions to
> > cpufeature.h and reorganize the code in the file to use the functions.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/cpufeature.h        | 78 +++++++++++++++++-------------
> >  arch/riscv/include/asm/vendor_extensions.h | 28 -----------
> >  2 files changed, 44 insertions(+), 62 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > index fedd479ccfd1..17896ec9ec11 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -98,59 +98,66 @@ extern bool riscv_isa_fallback;
> >  
> >  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
> >  
> > +#define EXT_ALL_VENDORS		0
> 
> It's not really "all vendors", it's standard. Otherwise, this seems all

This hooks up into the alternatives:

ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)

Where the "vendor" argument is supposed to be 0 if the alternative is
applicable to all vendors. Is there a better way to convey this?

- Charlie

> grand to me,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Cheers,
> Conor.


