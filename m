Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835E638384
	for <linux-sunxi@lists.linux.dev>; Thu,  8 May 2025 18:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729303; cv=none; b=qHCxof0EBjl8X8BJXPJHhniEx8KGN+LL92Kzy65cvKAGc46w9UuUxgfEIA/GKzUavvgDmZaGVHCYZyKuOZPd4K/Cg6+cFrkAiPcL5mhNJXLbThR7B1G+PPkhZ+54kYdOxF3feLAjA/KlLBpRHFzsD2A3xKZ7iOtjRSIQRTyRBUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729303; c=relaxed/simple;
	bh=pve4kmBWjpJMouJmACKzohZUAEfULdHO46/0YMB2Ys8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z++EUHxk3ljqXMqMws1BkU8Xr8lzngJbjXOz4JiuAul3g7vNDuVL9rWHMb1CakXRn+yZpSxrrDGovpSCrcMULay0TfK84O/ugHhuTCIb980F9yVfF86Nu2WaN9yO0oPCmjM/UT7wq6qLfuyEMQ5NZlIvNsbFDvWlJxQM28RH7Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2H7h09E; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2H7h09E"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe574976so9210605e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 08 May 2025 11:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746729300; x=1747334100; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IVDbdK6tFT4p5qSPziDFcg0ZPFHZewJeUyaEpzkNkuw=;
        b=F2H7h09EyZTh9fjYBx+GndxQFGsM+ZzilnS0v7/kS83M6r+7ap19RhQEOi3N22iopf
         U7V6uLEQs7MVsqEzq1LoHNWEbBdggGwvvGIy5O/VfocrC5dStpdxP6twPpQvFbXfBxwQ
         ZnJzgEf6c0uytIRgSJlG+IKtVCUTOQdsjKRx2vSC7iebAwK/ki5gLwAQhIif26KC9Z+H
         QvK8+EYFY99rwyLVYu3nPMqn9Cdeve14x41KIbNrvc4faPQN3Ed2ksPDXjylH6GDxSkO
         TdaSFQIFJE0yyoUEiPGKvabGx+T83eNTXLJQSvQtixoj/Wa3SHWUuMnZPpf4EVnoHq1V
         1FtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746729300; x=1747334100;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVDbdK6tFT4p5qSPziDFcg0ZPFHZewJeUyaEpzkNkuw=;
        b=PpxbGXqFNqyULgCer3J/iJMB2Hg7evLPt1CFC0Epoby6FfGYME3tuLLVaSY52Sq1yg
         bHPjY71+gzGEe/Mgu0G5mVZESaYXUwbme+dhTxNAp1Og6Ajcqn5tK263dDwtDCI7uDyw
         WQPK1q0Z3kvFCCNB25iR/Lfxy8fW3lOGgV/6o/SYv7OIpUU6g4Jn1IG4nwNVdZQD8lfp
         agORjquBVs1MYCUJahFyhI3tuoFIz/ZYgW7O/svXb8kqwW5JoIr4tBd7SNevfo4eN18R
         gVcJpdyJcWkI+V/A4q1mFAVlSy3URVgt7fLFbVqk4dPcJT9mWtrBF52GsuAivoAQrZca
         ULzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt+YeLR7hBYdlxmyQZ/oNxQM4CZQz5bKRgsBDG4voh9/EgmZL32XNa4sTtzo9JcpLB9jCgzBIG/9tkrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrF46pI559gQy9TyiP/F+nYb+QCxQ2vg7jyk/kQ6REXT8YaKGS
	/canx2lztSSrJcrOH2eQhPtZj+wXV9IgbLs4q4wQ7wGNffl+C8Bm
X-Gm-Gg: ASbGncsNCVLOgKJEI/7jHbBtd5GnmQ6kE+/75Ry5ObHEl60AzSEp4VDCuuvxOhFQgJr
	3le5AoC5ae0/fjlLq/EUetRMVDNtnHtOmohe2FHCrXj9dThvpjGTw4pwqrspZeHvgoB/9MGyTeH
	VthgRORr+FEal6Js6mhuDq2mH4pl5jmdHnxUmgBhaNc9JqZg6r0FecDuqWb7MdkPU/m4DHPw1Wv
	98xSJ+iQCTRdqIFyxgPpvXU7NJlk87FPwrkXk5ki+mQ4JxaCk5UFV+bdkeAf/be0veNzNWfiA9y
	bnyPItNAFgHbDeg4s4t7UkFiP5qxegW0PuhZR2kITqkwyUU92am3
X-Google-Smtp-Source: AGHT+IHYSEjULgZ4gpU3lysdol2P4WoCbN6EmeFoDVpmXCq4aDj8KwVvWdJr2UTxFLSQOh9srCA+Tg==
X-Received: by 2002:a05:600c:1d16:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-442d6d44ac2mr3297615e9.12.1746729299349;
        Thu, 08 May 2025 11:34:59 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7dd5sm45158365e9.35.2025.05.08.11.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 11:34:58 -0700 (PDT)
Date: Thu, 8 May 2025 20:34:55 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
	tzimmermann@suse.de, maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
	samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
	conor+dt@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH V9 00/24] drm: sun4i: add Display Engine 3.3 (DE33)
 support
Message-ID: <aBz5T-jAnv_RVAmh@Red>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
 <CAL_Jsq+gtVi1XG7b2g+n-H=fDrkZRqVA0wNSAA5-Ot7EXqG2QA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+gtVi1XG7b2g+n-H=fDrkZRqVA0wNSAA5-Ot7EXqG2QA@mail.gmail.com>

Le Wed, May 07, 2025 at 04:13:38PM -0500, Rob Herring a écrit :
> On Wed, May 7, 2025 at 3:22 PM Chris Morgan <macroalpha82@gmail.com> wrote:
> >
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > I've spoken with Ryan and he agreed to let me take over this series to
> > get the display engine working on the Allwinner H616. I've taken his
> > previous patch series for Display Engine 3.3 and combined it with the
> > LCD controller patch series. I've also fixed a few additional bugs and
> > made some changes to the device tree bindings.
> >
> > Changes since V8:
> >  - Combined the DE33 [1] series and the LCD [2] series to better track
> >    all patches necessary to output to an LCD display for the Allwinner
> >    H700.
> >  - Added a required LVDS reset as requested here [3].
> >  - Added compatible strings with a fallback for
> >    allwinner,sun50i-h616-display-engine, allwinner,sun50i-h616-tcon-top,
> >    and allwinner,sun50i-h616-sram-c.
> >  - Added binding documentation for the LCD controller.
> >  - Renamed the de3_sram device tree node to de33_sram.
> >  - Corrected the LVDS reset for the LCD controller binding.
> >  - Removed the PWM pins from the pincontroller bindings, as PWM is not
> >    yet supported.
> >  - Reordered the patches so that a binding or a device tree node is not
> >    referenced before it is defined.
> >
> > [1] https://lore.kernel.org/linux-sunxi/20250310092345.31708-1-ryan@testtoast.com/
> > [2] https://lore.kernel.org/linux-sunxi/20250216092827.15444-1-ryan@testtoast.com/
> > [3] https://lore.kernel.org/linux-sunxi/38669808.XM6RcZxFsP@jernej-laptop/
> >
> > Chris Morgan (24):
> >   dt-bindings: clock: sun50i-h616-ccu: Add LVDS reset
> >   clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
> >   drm: sun4i: de2/de3: add mixer version enum
> >   drm: sun4i: de2/de3: refactor mixer initialisation
> >   drm: sun4i: de2/de3: add generic blender register reference function
> >   drm: sun4i: de2/de3: use generic register reference function for layer
> >     configuration
> >   dt-bindings: allwinner: add H616 DE33 bus binding
> >   dt-bindings: allwinner: add H616 DE33 clock binding
> >   dt-bindings: allwinner: add H616 DE33 mixer binding
> >   clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
> >   drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
> >   drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
> >   drm: sun4i: de33: mixer: add mixer configuration for the H616
> >   dt-bindings: allwinner: Add TCON_TOP and TCON_LCD clock/reset defines
> >   dt-bindings: display: sun4i: Add compatible strings for H616 DE
> >   dt-bindings: display: sun4i: Add compatible strings for H616 TCON TOP
> >   dt-bindings: sram: sunxi-sram: Add H616 SRAM C compatible
> >   dt-bindings: display: Add R40 and H616 display engine compatibles
> >   drm/sun4i: tcon: Add support for R40 LCD
> >   arm64: dts: allwinner: h616: add display engine, bus and mixer nodes
> >   arm64: dts: allwinner: h616: Add TCON nodes to H616 DTSI
> >   arm64: dts: allwinner: h616: add LCD and LVDS pins
> >   arm64: dts: allwinner: rg35xx: Add GPIO backlight control
> >   arm64: dts: allwinner: rg35xx: Enable LCD output
> 
> What's the base for this series? It didn't apply for me (using b4).
> 
> Rob
> 

I tested it on top of linux-next next-20250508 and revert "arm64: dts: allwinner: h616: Add Mali GPU node"


