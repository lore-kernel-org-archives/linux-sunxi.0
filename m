Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F62625A33D
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 17:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739381107; cv=none; b=c5o1So+P8wloPfHbES9XDY8Uvkk4sGqEMRm6VUJLM9QI0yrhbDaUx3jLcB1mTSlTIwy9oNKUCVGDNphf1nlToUnoc+OrhP7yp+PXb+6HZMZwDUb4Zn00+GdDhUwxaiE80SjkdcrbjoX6fb3CrLZ76a1qKG5sz8MtLK3lFyeHuRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739381107; c=relaxed/simple;
	bh=gpVHDHA5/VEjZ971k1bpcLE8cgFeUrevL+UYZUWngdc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crlCG9SSLB7eElIlabEOyZaz6yC6zu8H3oejRKHW24LhvjZ/04JotZgvYQOuT82hxcYvLQsf464zo1/MWb3gPoE16rglHaaYxIi/+sQRWuMx2CSvKM9ImuKadtY/DGYwW3nvGY2+eop2HM75uiq04nQHeeBFwof+P0jwNZuGHzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hunHaLbo; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hunHaLbo"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2a88c7fabdeso8074fac.1
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 09:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739381104; x=1739985904; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jQhvgvLw0Ab8WRqkX0Q6owok1NJpwPhofznn4BvHFOA=;
        b=hunHaLboeQg7icrkI5fQ7mRO2FTV+ORXNXrsKIeNsBPSS39bZb7+KJC3fcW+c2T9uM
         IGlhO81beSkLqV9RMiNjq+65Kbhi36ThchB+tOKrgCaTVh7k2u2VuKACH0/JPravCmuk
         nIhjHegcq9ZG0+zS68+3z1k1ATzZPt2NQC7c0Kdl8KMINKcd7n0Rt5bKe0HLGnwggx5R
         KkIBWd3GsMyol4kRn+9V/FoiqHs6UumOtYGtfQg+sNTe5uGuF7r0+rWzoq7j7+hgr+X0
         XcjPQT7M1f7sMTU8ltAKmFoKWuXg2PcmJT0ooZ6JPU/fLvmb7Nif7VW+5+PXr2zevTel
         JDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739381104; x=1739985904;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQhvgvLw0Ab8WRqkX0Q6owok1NJpwPhofznn4BvHFOA=;
        b=pCxRC3g5jmZNT+UWUit/tyRymsMKdRnr7QlnQXQYo9YYWz2HmvN5mlKrTj2svyfWpx
         T4A6Kp/6cJDP7UdqN66TPJuRhLJIzBIWJ1DpwQ9RanL1+enxxqB28SCFTRJv9wbV4Liz
         6Wuzd3sSGCqCvhLcdlSWA8YOquY+iqg+kO59fewXNu2zba0KnkM477u59wo9F9jJ5TdO
         PnszMs2kZt5HviFtz9kE+N2SCHeHBs/LU5k3B/fT9kej8bvAdoAaI0M7adpyExCJUNxf
         Hwe0puA0icmRPSMs5qwxJPNdm/coXQcTqYzvm6ZBWlLAw4nfyy4waf7LF5ulknW1xmbc
         Or7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeemlpYD3eQtGixs+iklh7TZEmdnokAc/zq4E5zAyxQTZcKpeKxkvB0/Yd9Rc5H278uMdjJvindYURgg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUEWqU5KDGq5a9VfoPvmLZoYV5xfR5zC+dnEbS3jQYkncRewnK
	n9jJHjFDMkshXsGAZL/gxz/eQUqn0H5KltkYYNC8+CYEuiroXbzx
X-Gm-Gg: ASbGncvQButBE1PnAKtG1+DCEIt1HwG0wzRsaZuWaameSIsHM160erxQpqTxNWYgPiT
	v1XBSOy6KjuOEbavtoxtaozYsWvbWJj6M+YIae5aGc8SuTW2sOrb4iH0i8EFCtx19zvkaWKjo9v
	VzYCNRMJkcXuhwq2Wm0jNxwC77pzQEijX1dEfYjLe/U/15hrO3Rto/5yO4uA5g90n1yruhYWYpC
	Qj+2XHPA+A4np5HtKFvgnhFZDdTarhk858k2Tr1bxOjvl3ar+XkEWBF4ck4YXR0YKV+bjwg1uuK
	dFlbK1nPWUhvThvgYi5XyA==
X-Google-Smtp-Source: AGHT+IFubc5w1GwArkfUm2wYuLBD6zhCQaR7Tbp8g3XURKKlpZTfkEzbGo2CJasy4U3o+foCvJ2C5A==
X-Received: by 2002:a05:6870:c69b:b0:29e:4a13:603f with SMTP id 586e51a60fabf-2b8d644c5efmr2872725fac.4.1739381104281;
        Wed, 12 Feb 2025 09:25:04 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b826262333sm5089109fac.37.2025.02.12.09.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:25:04 -0800 (PST)
Message-ID: <67acd970.050a0220.1eb03a.101e@mx.google.com>
X-Google-Original-Message-ID: <Z6zZbu5dABW8IrQC@neuromancer.>
Date: Wed, 12 Feb 2025 11:25:02 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 00/26] drm: sun4i: add Display Engine 3.3 (DE33)
 support
References: <20240929091107.838023-1-ryan@testtoast.com>
 <cfc66e71-4af8-43c8-8b86-0bf5208b5c42@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfc66e71-4af8-43c8-8b86-0bf5208b5c42@gmail.com>

On Mon, Sep 30, 2024 at 03:30:45PM +0200, Philippe Simons wrote:
> tested on 6.12-rc1 with RG35XX-H
> 
> Tested-by: Philippe Simons <simons.philippe@gmail.com>
> 
> On 29/09/2024 11:04, Ryan Walklin wrote:
> > Hi,
> > 
> > V5 of this patch series adding support for the Allwinner DE33 display engine variant. V5 is rebased on torvalds/master as of today with the 6.12 drm-next patches included, with no code changes required. V3 and V4 were in turn rebased on top of the layer init and modesetting changes merged for 6.11. No functional changes from V4, fixes and reviews from previous V1-4 added, and relevant issues found by checkpatch.pl corrected.
> > 
> > Original blurb below:
> > 
> > There is existing mainline support for the DE2 and DE3 AllWinner display pipeline IP blocks, used in the A64 and H6 among others, however the H700 (as well as the H616/H618 and the T507 automotive SoC) have a newer version of the Display Engine (v3.3/DE33) which adds additional high-resolution support as well as YUV colour formats and AFBC compression support.
> > 
> > This patch set adds DE33 support, following up from the previous RFC [1], with significant rework to break down the previous relatively complex set into more logical steps, detailed below.
> > 
> > 1. Refactor the existing DE2/DE3 code in readiness to support YUV colour formats in the DE3 engine (patches 1-4).
> > 2. Add YUV420 colour format support in the DE3 driver (patches 5-12).
> > 3. Replace the is_de3 mixer flag with an enum to support multiple DE versions (patch 13).
> > 4. Refactor the mixer, vi_scaler and some register code to merge common init code and more easily support multiple DE versions (patches 14-17).
> > 5. Add Arm Frame Buffer Compression (AFBC) compressed buffer support to the DE3 driver. This is currently only supported for VI layers (for HW-decoded video output) but is well integrated into these changes and a subsequent patchset to enable the Video Engine is planned. (patch 18).
> > 6. Add DT bindings for the DE33 engine. (patches 19-21).
> > 7. Extend the DE2/3 driver for the DE33, comprising clock, mixer, vi_scaler, fmt and csc module support (patches 22-26).
> > 
> > Further patchsets are planned to support HDMI and the LCD timing controller present in these SoCs.
> > 
> > Regards,
> > 
> > Ryan
> > 
> > Jernej Skrabec (22):
> >    drm: sun4i: de2/de3: Change CSC argument
> >    drm: sun4i: de2/de3: Merge CSC functions into one
> >    drm: sun4i: de2/de3: call csc setup also for UI layer
> >    drm: sun4i: de2: Initialize layer fields earlier
> >    drm: sun4i: de3: Add YUV formatter module
> >    drm: sun4i: de3: add format enumeration function to engine
> >    drm: sun4i: de3: add formatter flag to mixer config
> >    drm: sun4i: de3: add YUV support to the DE3 mixer
> >    drm: sun4i: de3: pass engine reference to ccsc setup function
> >    drm: sun4i: de3: add YUV support to the color space correction module
> >    drm: sun4i: de3: add YUV support to the TCON
> >    drm: sun4i: support YUV formats in VI scaler
> >    drm: sun4i: de2/de3: add mixer version enum
> >    drm: sun4i: de2/de3: refactor mixer initialisation
> >    drm: sun4i: vi_scaler refactor vi_scaler enablement
> >    drm: sun4i: de2/de3: add generic blender register reference function
> >    drm: sun4i: de2/de3: use generic register reference function for layer
> >      configuration
> >    drm: sun4i: de3: Implement AFBC support
> >    drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
> >    drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
> >    drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support
> >    drm: sun4i: de33: csc: add Display Engine 3.3 (DE33) support
> > 
> > Ryan Walklin (4):
> >    dt-bindings: allwinner: add H616 DE33 bus binding
> >    dt-bindings: allwinner: add H616 DE33 clock binding
> >    dt-bindings: allwinner: add H616 DE33 mixer binding
> >    clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
> > 
> >   .../bus/allwinner,sun50i-a64-de2.yaml         |   4 +-
> >   .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
> >   .../allwinner,sun8i-a83t-de2-mixer.yaml       |   1 +
> >   drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 ++
> >   drivers/gpu/drm/sun4i/Makefile                |   3 +-
> >   drivers/gpu/drm/sun4i/sun4i_tcon.c            |  26 +-
> >   drivers/gpu/drm/sun4i/sun50i_afbc.c           | 250 +++++++++++++
> >   drivers/gpu/drm/sun4i/sun50i_afbc.h           |  87 +++++
> >   drivers/gpu/drm/sun4i/sun50i_fmt.c            |  99 +++++
> >   drivers/gpu/drm/sun4i/sun50i_fmt.h            |  33 ++
> >   drivers/gpu/drm/sun4i/sun8i_csc.c             | 341 +++++++++++++++---
> >   drivers/gpu/drm/sun4i/sun8i_csc.h             |  20 +-
> >   drivers/gpu/drm/sun4i/sun8i_mixer.c           | 226 +++++++++---
> >   drivers/gpu/drm/sun4i/sun8i_mixer.h           |  31 +-
> >   drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  41 ++-
> >   drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
> >   drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 133 +++++--
> >   drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       | 115 ++++--
> >   drivers/gpu/drm/sun4i/sun8i_vi_scaler.h       |   2 +-
> >   drivers/gpu/drm/sun4i/sunxi_engine.h          |  34 ++
> >   20 files changed, 1269 insertions(+), 205 deletions(-)
> >   create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.c
> >   create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.h
> >   create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.c
> >   create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.h
> > 

I just wanted to add my Tested-By to this patch series. That said, I can confirm
that we also need to add support for the clock and reset before we activate the
display engine. I'll submit patches for that in a different series (it's a
pre-requisite of this but can be done independently).

Additionally, I do have a few comments on the yaml documentation.

Tested-by: Chris Morgan <macromorgan@hotmail.com>

Thank you,
Chris
