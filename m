Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580637C
	for <linux-sunxi@lists.linux.dev>; Tue, 24 May 2022 19:08:56 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id rs12so25525112ejb.13
        for <linux-sunxi@lists.linux.dev>; Tue, 24 May 2022 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2OulZq3Irlc58uEaDk3npzMcuhHJigRPmtDLvl24/rI=;
        b=WyOcrh4LJIMo3HCPOQWirbN/TJkvHif36lLojpxyJDhYud5TualgotcCkgcTvRO/pq
         fX1q0MxY4T7EUloEsrlNE/ubBG25fPlKLtE+zICmsYR9xVa8f0DZQ/3XC/00d/ZrfBj5
         7mjAAMXBwdKl4PzJmzUoqmFmmnuKiU6taXgjxER0By1YWVzrnw9+cfXMG3kuX9fW9+nZ
         H/pGzVoOP6cLrBSqzgjj71UYdJ5pstv9aa7alosWyvC1UzTvPQLrZD3+9UR+e6ggOa9h
         OeHRY9LY3AgoQUPrh4lnsrQwSO4hGnqeyP2gbTb7soQ6ieftA61Nf93Eig9+zZEDAu+H
         nTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2OulZq3Irlc58uEaDk3npzMcuhHJigRPmtDLvl24/rI=;
        b=D2DknqBoXHF1OXlq8Qdn4asV/0/Ki1Mtr2i6C3NvXd03Z1UM55ZTGCDnEiid5wkxjK
         zsiXkVSm/GHBq2ib2Rq89SN9Q+8Vabj8UgYuN7mi2YFw6bNCwTxLes2jyFI/4vQ9WgzD
         2Q6Y2UHkeMqBbF172CFkH6Y01fOcICx1sBx2bU7/yXObcuSX8QuPv0hmkDtnODIK5b/b
         kqgUUzkyn3S6M+YBExLoN6HhNGPyJpAJfPuw3heb7vUJCy/GyWe+4NUfAUPLouR4HW9v
         A+YvnSWgvMMFpCs5b2sfyVBPPVeB4162UpBuOm3b+in5dCRNAIG4P3Xnl4ZeC8MIm1Pb
         RfrA==
X-Gm-Message-State: AOAM531Vf4yey9gFIyebwmntH4qbPCwSVtdaEO2Vlabc6GIaB4Tj96PP
	GnC5LULq7iA2DjxMx5Vv5Q/YCUTIkfzobg==
X-Google-Smtp-Source: ABdhPJy6tiBlS7Y9PEG2y6NKd0gtJct5hHGBgdFkw2WWZBgKIw/lQUaM7aC1rncE2M7LApgGvxxnRQ==
X-Received: by 2002:a17:906:4787:b0:6f4:2f25:f9ff with SMTP id cw7-20020a170906478700b006f42f25f9ffmr27258921ejc.116.1653419334498;
        Tue, 24 May 2022 12:08:54 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id w9-20020a1709064a0900b006fed85c1a8fsm2777972eju.202.2022.05.24.12.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 12:08:54 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard <mripard@kernel.org>, wens <wens@csie.org>, "benlypan@gmail.com" <benlypan@gmail.com>
Cc: airlied <airlied@linux.ie>, daniel <daniel@ffwll.ch>, samuel <samuel@sholland.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi <linux-sunxi@lists.linux.dev>, linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH] drm/sun4i: mixer: fix scanline for V3s and D1
Date: Tue, 24 May 2022 21:08:53 +0200
Message-ID: <4711779.GXAFRqVoOG@kista>
In-Reply-To: <202205221848264427024@gmail.com>
References: <20220521133443.1114749-1-benlypan@gmail.com> <3173956.44csPzL39Z@jernej-laptop> <202205221848264427024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 22. maj 2022 ob 12:48:27 CEST je benlypan@gmail.com napisal(a):
> Hi Jernej!
> 
> > Which SDK? All SDKs that I have or found on internet don't mention YUV nor 
RGB
> > scanline limit. That doesn't mean there is none, I'm just unable to verify
> > your claim. Did you test this by yourself? Also, please make YUV scanline
> > change separate patch with fixes tag.
> 
> Here is the code about scanline config for V3s:
> https://github.com/Tina-Linux/tina-v3s-linux-4.9/blob/master/drivers/video/
fbdev/sunxi/disp2/disp/de/lowlevel_sun8iw8/de_feat.c#L55
> https://github.com/Tina-Linux/tina-v3s-linux-4.9/blob/master/drivers/video/
fbdev/sunxi/disp2/disp/de/lowlevel_sun8iw8/de_rtmx.c#L1212
> 
> And here is for D1:
> https://gitlab.com/weidongshan/tina-d1-h/-/blob/main/lichee/linux-5.4/
drivers/video/fbdev/sunxi/disp2/disp/de/lowlevel_v2x/de_feat.c#L182
> https://gitlab.com/weidongshan/tina-d1-h/-/blob/main/lichee/linux-5.4/
drivers/video/fbdev/sunxi/disp2/disp/de/lowlevel_v2x/de_rtmx.c#L1588

Thanks for the links!

> 
> I was tested it on V3s. Without this patch, the plane will not display
> correctly if src_w large than 1024, for both YUV and RGB. I don't have a
> device with D1, so D1 is not tested. But according to the SDK code of D1,
> the scanline value of mixer1 is 1024.
> 
> I'm new to submitting patches, So may I ask a question? If there is no
> problem with this patch, what I need to do is to send new patches as you
> suggested?

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

I already requested changes, so you need to send v2. But wait until discussion 
is finished.

Best regards,
Jernej

> 
> Best regards,
> Genfu Pan
> 
> 


