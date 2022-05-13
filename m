Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81624256E
	for <linux-sunxi@lists.linux.dev>; Fri, 13 May 2022 23:05:51 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2fb965b34easo104749737b3.1
        for <linux-sunxi@lists.linux.dev>; Fri, 13 May 2022 16:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=20vdP+atjEjZhs5yJgS5YKDTDHHJ9Ifpl/sT0aKWLY4=;
        b=m+j5i6KqT3vzPFbJFYRsLAjZL1f88dlKxieE3PyBGCRC5fENmJJq5KL2nwLE+r4Usw
         KFU7MTr/YV0/GCVcSi6w+xvuXb4gnpZ6SXGuf1Ppm5u5OJlH4kX9wKcf6IAB3YynBhim
         7OuzeTVgvAzbEH9fewdjbBloKzSJ4LgUH4CBq6p3wmNP5GBm7Vt8rmfgdME13K0FXdv/
         oYbDGxVyEdZB4BhihJn3sDaggnAt6GJrbMySkcjanP2zYDs/y5+SAoTWiq2lwZZI8RzF
         YQXvOQi8vTjCWZiERQclgs63hI+tBqKjlZQ1xnnIyIe53ADFoMbIielktYi+PZjOPOn4
         9ZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=20vdP+atjEjZhs5yJgS5YKDTDHHJ9Ifpl/sT0aKWLY4=;
        b=lPiZZJHysULfJw5zXTI8vc/mDqdDjSKWBlyqta68oT2LiqPoEYRwaOtFQiQ5NUj1Cx
         VlWm8i1KmdxKW6kvWTYGa6kihaPtxu88vDaCLtX5jdWRXtMkFRcvI/G4et/hSPEE7aQu
         zRYAKJazebbnnDCOoSVN8SHow+qb/BLYXcl9sDsS2PT5fqUmZrxEQGtgykMb0olByxeW
         IXgXpBRp9fpp2bGS9e1p2HgTgWbtNF6WYg6KfRAo0nQ0t48YSu29NsewtK9gjWD1FDJt
         iVyFFnsAob9+UY4V2Fo6gIttFzIzoDRe1mfnJ1bHepLZkJV3BBqBW3p8HEldy8mwexLM
         tIBA==
X-Gm-Message-State: AOAM530zkHPioYmMSs3pSW0kY7gXeP0Fc/U5X8sQ0mPwJIPIp+5FV0y7
	+7F6rc8up+kBJepwaycGXLWwvAT2GEqzsll69zIE+Q==
X-Google-Smtp-Source: ABdhPJwg1gn4vyXSCAsXn7nzUnuz1q4FEzRjyuG4DMDgINbyOAJx6cpdY0REFXSha0pTwtIuBOdhvRVhGfAgD/v8v0k=
X-Received: by 2002:a0d:e612:0:b0:2fb:103f:4067 with SMTP id
 p18-20020a0de612000000b002fb103f4067mr8515792ywe.151.1652483150531; Fri, 13
 May 2022 16:05:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <tencent_70C1308DDA794C81CAEF389049055BACEC09@qq.com>
In-Reply-To: <tencent_70C1308DDA794C81CAEF389049055BACEC09@qq.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 14 May 2022 01:05:39 +0200
Message-ID: <CACRpkda2AEVf__6neYPOddnjL1=Www=HoHvyNzcBvjua7GeVQg@mail.gmail.com>
Subject: Re: [PATCH] arm: sunxi: fix f1c100s pinctrl function.
To: IotaHydrae <writeforever@foxmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, May 4, 2022 at 1:59 PM IotaHydrae <writeforever@foxmail.com> wrote:

> 1. change suniv f1c100s pinctrl,PD14 multiplexing function lvds1 to uart2
>
> When the pin PD13 and PD14 is setting up to uart2 function in dts,
> there's an error occurred:
> 1c20800.pinctrl: unsupported function uart2 on pin PD14
>
> Because 'uart2' is not any one multiplexing option of PD14,
> and pinctrl don't know how to configure it.
>
> So change the pin PD14 lvds1 function to uart2.
>
> Signed-off-by: IotaHydrae <writeforever@foxmail.com>

Thanks, fixed up the subject as indicated by Andre
and applied.

Yours,
Linus Walleij
