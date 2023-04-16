Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FE11C11
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Apr 2023 13:32:00 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id xd13so23540410ejb.4
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Apr 2023 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681651918; x=1684243918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JdNGYn7ATErhvA1sUBmn8DjGAPLnDdtrFLVnGWMoc4=;
        b=CKDBa6gKS+JJAQOxB3ElN/nd9k2MKyzH1GLlWozxzcaJR2dJ3bKuGYKnmi1mMLGXCS
         FrZXfuBtPgf5E7G65C1gDgKxLCcfBeOBvPzgG9lH3V6BkNTT/PaUdJpY3v2kneykuk9s
         KaP56hDIiccMScOjuAlY3WlIQsCoYZmEx0gkgbl+PoQY5rNZIKMYHVvZUiaDGJzPsIU+
         fat7UlrKFKPmunxWauMHMHXNliZziRKEVDlPwRMKxaEuk+Zc+5HGhqslxzYm3cjTTCQe
         WwWQSWd5ngHpamlDBhVvdeksdtOuoaeluI+8CPsJ2xI1Kt4qLC/5fHUI9zJDhrdYb7dZ
         2KwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681651918; x=1684243918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JdNGYn7ATErhvA1sUBmn8DjGAPLnDdtrFLVnGWMoc4=;
        b=Qd1hEOoSioZbFZG1yjcTsp3+iR7B/Y4wm5ificfnIRyAON5+jUsPc+pFKtZKcT8f8q
         bJI8sWm6VepXeKnxhrPnC8nc1KHkmVpILmZZ/vZaUOMTfU6eJMyJAXAtWSwrWpoWv6VJ
         nEFCXFlODRjgLOGqod+XoEQ2woyAD1891EIbiABIYNrmbodTuN3vZQDfPPUgOpTWlJpY
         SNiUpleosKu9nnLT5uPRD/lndtXGUGdqI7LGkJST+qAUog2xXh8MJOIpstZ8DbI7+/Jl
         nIzyZXmz+rG+wmQPvnFVRVSNxrmbz8z5twUHwvnJBAgLZGNxsdPIJhMRDU/z7Xs7627P
         uupw==
X-Gm-Message-State: AAQBX9dp/IujVvvOvkyDsnmumcexaB51ZRuvBEnB8SsCO/1T9VH+m56/
	ElBsFJ6QG881I8Db+A7SK1pAqcknu71ZRE4w
X-Google-Smtp-Source: AKy350agXy7aE/aJS4jJ15TKpLErwEJZj78+qOwH9nVYLbGTOcJD/smUnMqrvq5muFXhioghT0nC7w==
X-Received: by 2002:a17:906:30c3:b0:94e:e1c7:31b4 with SMTP id b3-20020a17090630c300b0094ee1c731b4mr4474093ejb.48.1681651918086;
        Sun, 16 Apr 2023 06:31:58 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id ww4-20020a170907084400b0094f62a3197asm560513ejb.202.2023.04.16.06.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 06:31:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wens@csie.org,
 samuel@sholland.org, jonas@kwiboo.se, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
 hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: h3: beelink-x2: Disable DW-HDMI CEC
Date: Sun, 16 Apr 2023 15:31:56 +0200
Message-ID: <2675247.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230416132531.GA28551@pendragon.ideasonboard.com>
References:
 <20230415104613.61224-1-jernej.skrabec@gmail.com>
 <20230415104613.61224-4-jernej.skrabec@gmail.com>
 <20230416132531.GA28551@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 16. april 2023 ob 15:25:31 CEST je Laurent Pinchart napisal(a):
> Hi Jernej,
> 
> Thank you for the patch.
> 
> On Sat, Apr 15, 2023 at 12:46:13PM +0200, Jernej Skrabec wrote:
> > Beelink X2 uses software implementation of CEC even though DW-HDMI has
> > working hardware implementation.
> 
> Why ? The reason should be explained in the commit message.

Maybe I should reword this differently. It uses software implementation through 
GPIO pin. Dedicated DW-HDMI CEC pin is left unconnected.

Best regards,
Jernej 

> 
> > Disable unused DW-HDMI CEC.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> > 
> >  arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> > b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts index
> > a6d38ecee141..38f40d69e5c5 100644
> > --- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> > +++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> > @@ -150,6 +150,7 @@ &emac {
> > 
> >  };
> >  
> >  &hdmi {
> > 
> > +	snps,disable-cec;
> > 
> >  	status = "okay";
> >  
> >  };




