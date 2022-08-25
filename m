Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4051C2E
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 20:50:59 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id e20so25540593wri.13
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ycn3CsR1iWHNGED1GDVpfA/87x3QqwpXsbLUpADdraQ=;
        b=bol+gBDkBo1VMcISuBNdzLclSLVqvh573NNoMjLdlmP1yyj8f3MJeT6AboKjeaiSGI
         0/daGmDLQG/9OA1SJMF0LsBovpJE9BAgUAef48cuzfISAD1S1aTihSF7JGeM/7OO7DQD
         495EdzxTgDFvKHDf88ckMc/sjafE7lrIbmzTjE6jIQ3+rBeiYo6RrCGXeWUdi9zhs6G+
         eb5nBvRRaCKnmB5NC1JUyulCkN+kIiK1VRIXYV4J6ZF8hFNL5s1Ydlm2G23LHlf4+Pwc
         xfK74m0plG+MNfq+AWuQxeh7OpVObn5S+rIY9DHRS+sIHPa2mhubXcvBVfJcbWlQLSH3
         PZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ycn3CsR1iWHNGED1GDVpfA/87x3QqwpXsbLUpADdraQ=;
        b=fRo1pIskt+mKSOhoEYOPWsJyBkVfaLDLxBeq+35qzhfKLxKiD/FR6oroYA+H+V/a4/
         4XbgreVvg9C0yNCV3Ac7b14tUE6bie3qzY2nzIrkktgumFh8wnuYYYsopovXlRl95uKD
         H/WfK6MBKBVJMx3TE0BEPOur6I3CVuy0Q3bvWzwv2zGfO1lTiveHYiR16qgkqg9SdFtj
         p95J2XsX+mFIFf2P8Kkd7gOp6OVzko5JsKF9rZY8GhEXGV1ivbokVfHvms0r3vKdCMI2
         kRkF5nKrlbDP2bur03AmlknloUjY6eZMXB5dgd41DR3K6utXtDilUmubz2/HDzc2Z1UT
         0Dvw==
X-Gm-Message-State: ACgBeo2gsDn6qoDvId4R3X0wZjlYkRTVuDDwXFFlN/ZZJGYTo8YA9QLZ
	01Tca9VDzNWuHxKxnXC72VE=
X-Google-Smtp-Source: AA6agR6zAtMnvY10hfD6sffzNF0D5ClJkG/OeP4X0NXPmQeTBXTYIB0Lw/Fj0n9D5VwM2LHQte9fWA==
X-Received: by 2002:a05:6000:144c:b0:222:c5db:6caa with SMTP id v12-20020a056000144c00b00222c5db6caamr3190372wrx.421.1661460658024;
        Thu, 25 Aug 2022 13:50:58 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id n4-20020a05600c3b8400b003a608d69a64sm6356134wms.21.2022.08.25.13.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:50:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: yong.deng@magewell.com, mchehab@kernel.org, wens@csie.org, samuel@sholland.org, wangjianli <wangjianli@cdjrlc.com>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, wangjianli <wangjianli@cdjrlc.com>
Subject: Re: [PATCH] sunxi/sun6i-csi: fix repeated words in comments
Date: Thu, 25 Aug 2022 22:50:56 +0200
Message-ID: <3184312.aeNJFYEL58@kista>
In-Reply-To: <20220823143820.29860-1-wangjianli@cdjrlc.com>
References: <20220823143820.29860-1-wangjianli@cdjrlc.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 23. avgust 2022 ob 16:38:20 CEST je wangjianli napisal(a):
> Delete the redundant word 'the'.
>=20
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c index
> 682c26536034..fac004389b6b 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> @@ -177,7 +177,7 @@ static int sun6i_video_start_streaming(struct vb2_que=
ue
> *vq, unsigned int count)
>=20
>  	/*
>  	 * CSI will lookup the next dma buffer for next frame before the
> -	 * the current frame done IRQ triggered. This is not documented
> +	 * current frame done IRQ triggered. This is not documented
>  	 * but reported by Ond=C5=99ej Jirman.
>  	 * The BSP code has workaround for this too. It skip to mark the
>  	 * first buffer as frame done for VB2 and pass the second buffer
> --
> 2.36.1


