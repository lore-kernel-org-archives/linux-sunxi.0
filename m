Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC601841
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Apr 2023 07:07:41 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-504718a2282so1100921a12.0
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Apr 2023 00:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680937660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXoFjgpD9Cwq3kIRxNGd8ecDEoW5EyNl4Aqp94FhPuY=;
        b=T3cs/IbldKyYw0jlOQBYubSsMBksZ/OsOf01EiSQRyLFouIQ/LDT6VDaWTlzucFVme
         RSog9LR8VZ4x519GvDIpPxMIeqdaNYkx/9wcSNiDms+hRFIxycfbb2vt/vJSRXP7GG8/
         bq5r5YGs8GbCitPKhjmMiXFm917Yv4Osfscaa5ScKJNuBPNjLtOIIgnEdyfIz8CLEiy9
         KcDOBHFXhvjTUzSF/hP7E8h2EGvBLHJJNFz9vXMbRbOV0UqwzixgBXrC2WlY+5hJIogd
         CIHCqETGiVSLF9EXN2q69VUcLduz0rrPXxn/vxw0FT5shCF0rvelG2pwLZdE/ZSCRqsw
         uPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680937660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXoFjgpD9Cwq3kIRxNGd8ecDEoW5EyNl4Aqp94FhPuY=;
        b=eTQZyQQDjctSb2Nf8HsM3uvM5qwARk6KngfbSSbDpvG0nouTvlW5pypxtx5hqmvOhC
         UHdbLqWO7Dqyo9Z/n2bfPPhe9tK013YZLyQfuGPDpReVKCOYxieML3S2e9CIXgEe0A5d
         ZTgfMjoxw3LVCeNXEyiVXLB2iJ4A6DspIhv2NabJx1h2dKfugSwgPgN+LY9bSJ4aLczj
         0Qjstt4qlLSTRpdFBXNwDsKnvZnPR9plL93s19qXMu/X8j3/a2F8foZqE1BJISrqX7NH
         7pn7qrn8oyVTXEJQPCmtwZf6wgVNqkLA8wybSdulb+sAOY/SZ3W+08DL+wkP6htMeeMM
         txTQ==
X-Gm-Message-State: AAQBX9cLu3gSLP8ou02z6I4HfBvUDMpubkJmHp4ODZmWmGoSocK2hn5I
	FQ6Y30cDiIelf0SMxIFY7HI=
X-Google-Smtp-Source: AKy350ax5r2EKzYegd2xSOZGrwHN58yVwJQh5K3T49zBPaaDMonr78zO1J+MoRtd49ztjKFYPf0xuw==
X-Received: by 2002:a05:6402:b09:b0:501:cde5:4cc9 with SMTP id bm9-20020a0564020b0900b00501cde54cc9mr3621206edb.39.1680937659702;
        Sat, 08 Apr 2023 00:07:39 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id c90-20020a509fe3000000b005047d3c8700sm1285380edf.65.2023.04.08.00.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 00:07:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>, Roman Beranek <romanberanek@icloud.com>
Cc: Frank Oltmanns <frank@oltmanns.dev>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from TCON0_DCLK_REG
Date: Sat, 08 Apr 2023 09:07:37 +0200
Message-ID: <2219295.iZASKD2KPV@jernej-laptop>
In-Reply-To: <CROTQHUM88W0.2URPO95U5ZMS5@void.crly.cz>
References:
 <20230320161636.24411-1-romanberanek@icloud.com>
 <20230329195802.veybo3367zifw77n@penduick>
 <CROTQHUM88W0.2URPO95U5ZMS5@void.crly.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 05. april 2023 ob 14:34:11 CEST je Roman Beranek napisal(a):
> Hello Maxime,
> 
> On Wed Mar 29, 2023 at 9:58 PM CEST, Maxime Ripard wrote:
> > > In order to preserve semantic correctness however, I propose to preface
> > > the change with a patch that renames sun4i_dotclock and tcon-pixel-clock
> > > such that dot/pixel is replaced with d/data. What do you think?
> > 
> > I don't think it's exposed to the userspace in any way so it makes sense
> > to me
> Here's a new series that includes those renames:
> <https://lore.kernel.org/all/20230331110245.43527-1-me@crly.cz/>
> 
> It turns out however that the new dclk rates can't be set exactly as
> requested without touching pll-video0*, tcon0 now therefore gets
> reparented from pll-mipi to pll-video0-2x which, as it further turns
> out, breaks DSI. While simply forbidding the video0-2x mux option seems
> to me as the right way to go because there's not much use for it with
> non-DSI interfaces either besides the opportunity to power pll-mipi
> down, I'd like to run by you first.

It's been a long time since I looked at A64 HDMI clocks, but IIRC, pll-video0 
is the only useful source for HDMI PHY (as opposed to HDMI controller.)
So question remains how to properly support both displays at the same time.

Have you ever tried to make HDMI and DSI work at the same time? This is one of 
issues of the PinePhone IIUC.


> 
> Kind regards,
> Roman
> 
> * As pll-mipi doesn't have CLK_SET_RATE_PARENT flag set, pll-video0
>   retains its boot-time rate of 294 MHz set by sunxi-dw-hdmi driver
>   in u-boot. Why 294 MHz (as opposed to the default rate of 297 MHz)?
>   The driver actually asks for 297 MHz, clock_set_pll3 rounds it to
>   294 MHz though because it limits itself to 6 MHz steps.

Yeah, we added CLK_SET_RATE_PARENT flag to several clocks after initial driver 
was merged. Adding this flag sounds completely reasonable.

Best regards,
Jernej


