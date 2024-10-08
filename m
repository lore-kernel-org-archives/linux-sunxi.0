Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982A35B1FB
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Oct 2024 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728400218; cv=none; b=l+gEWAcDjcB92V9lCvQA7BtQxvR+utesBWmLkosn3OghA01XBsvhlNAwOGKAvHYuBYBillj7LSKWx2BsO+7JIqBdq/LKcMwoCjiWaVo0fXsEawYgZ7tzM03SOcIirtRMTsLx0zkHvPMX958nLZSn71PUXlFFENLXBfFP4HcKcOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728400218; c=relaxed/simple;
	bh=xo0C4U4wBPUyH7JhzEAeKIblQrARa9L8u8Zjshvxzx4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAFJ0dyGAfaB+fz4Yt/ptGZ8kBft7L/p5/rv/7GN157n9GpHtbl3TCKcaXVSlvoq9GtOhpsYoV5R+t/Vrs/fg13+lsCFskThpom3bE7kf7jnrGzMmhtoz+QLxbK9S6+iDSY6ip7WdPxf0mPS8W2zOwEzoB3qwnnDP0faPhFPpGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juxurln0; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juxurln0"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-710dad96bf7so1430104a34.0
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Oct 2024 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728400216; x=1729005016; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h8FVjFSOCkqIf/0pMIi/pzRKFL8gLTJryJEfNVlsG7Y=;
        b=juxurln032xbcp+yGAs05krnyDyE68mZfb4FAwKkC5TvEE0QCs+gCq8GIJkpEh0a9r
         j3UYjv3LnXR+MI52eu0mRMYQqsPxitXGGveYIIbdl+rMRDVc+X/oBXK8aTf2l217kX92
         yUMFmCBN7okCTDuBMyNhBV1kOqhPgOqCxKr32cwaxYEyDyaPiL4ldupyul49Ewx7UBNb
         YMrLNFkXuUfPG8eorxTlGxcpSm/6fesLLiZCcP/epMQHn9F1AWq0AoMrrrq6NA3uQVr2
         IrCw5TMNlGGOtE+4NaRZJS7BfMMSfijK+NIhxIOYMVADUmcirhE/ASIzITNEI8ZnNRE6
         Sd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728400216; x=1729005016;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8FVjFSOCkqIf/0pMIi/pzRKFL8gLTJryJEfNVlsG7Y=;
        b=uMHfz1lwrVEKrb38aHoTq5rVxeDoJi37Lx3ziPbREMVRuNHWDAfYmvqRUk4VI96jhT
         Ty1lwSjF1fczD9dof8F9Y6s00UeaERA/7IBIHQsHFkthAo3H++rlCG9xipHei/ZLcvlS
         WbW5wd7HilOT1QX+fpeBkknrc09CgWj3JInZU7EtrEQAy/q7jrkjh/GGnwUEdU7Do9Hw
         PmodE0IthTQCz7/IV0ibox40QJ+Fv2DK291CYQ8bc++WCjTg6qC5qKtCrKrsvzHSmYIf
         FZBfIRhXb+4vfvtsQLGJQx7/Dee2VmOVZwWZ/3fWRIY+jAC1PKcKdIpDlKOtZPCTKSTK
         gAvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmXR/NUOpkuyyI4jqlXsm6+uw2JhLY8A8OsAYrrD+s8RoYd9+878L2VMjSBQJmAcFbosbGgx3Zg5on6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxW+BSgxq2Q3w097ib8/r/XuaJkI/+JNIksIHTzDdHFyO9yWg3
	wBCJ/Qcnr1pq+/WRF6zeF+Ns9YDFpIP2tcQb6cBLHdJtO+6UmIJr
X-Google-Smtp-Source: AGHT+IFYYXW7//lDk6FPokDWD1gM7PjS/UNrxS+imBsA3RrlBJLTTdO5nz6L4rCJS5C+eBsXjG/Ufw==
X-Received: by 2002:a05:6830:6384:b0:710:dae5:df1d with SMTP id 46e09a7af769-7154e98fca3mr10733642a34.31.1728400215490;
        Tue, 08 Oct 2024 08:10:15 -0700 (PDT)
Received: from neuromancer. ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7155686c95bsm1884579a34.73.2024.10.08.08.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 08:10:15 -0700 (PDT)
Message-ID: <67054b57.9d0a0220.359bfc.6183@mx.google.com>
X-Google-Original-Message-ID: <ZwVLVb5L08dVG0ds@neuromancer.>
Date: Tue, 8 Oct 2024 10:10:13 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Aleksandr Shubin <privatesub2@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	John Watts <contact@jookia.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
References: <20240520184227.120956-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520184227.120956-1-privatesub2@gmail.com>

On Mon, May 20, 2024 at 09:42:18PM +0300, Aleksandr Shubin wrote:
> 
> v2:
>  - fix dt-bindings
>  - fix a remark in the driver
> 
> v3:
>  - fix dt-bindings
>  - fix sunxi-d1s-t113.dtsi
> 
> v4:
>  - fix a remark in the driver
> 
> v5:
>  - dropped unused varibale in the driver
>  - fix dt-bindings
> 
> v6:
>  - add apb0 clock
> 
> v7:
>  - fix a remark in the driver
>  - add maintainer
> 
> v8:
>  - fix compile driver for 6.8-rc
> 
> v9:
>  - fix a remark in the driver
>  - fix dt-bindings
>  - rename apb0 -> apb
> 
> Aleksandr Shubin (3):
>   dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
>     controller
>   pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
>   riscv: dts: allwinner: d1: Add pwm node
> 
>  .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
>  drivers/pwm/Kconfig                           |  10 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-sun20i.c                      | 387 ++++++++++++++++++
>  5 files changed, 494 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
>  create mode 100644 drivers/pwm/pwm-sun20i.c
> 
> -- 
> 2.25.1
> 

Has there been any futher updates on this? It looks like v9 was last
updated in May. I only ask because I think future patches adding
support for the H700 require this as a pre-requisite.

Thank you,
Chris
