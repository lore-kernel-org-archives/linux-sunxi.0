Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F7257D
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 18:58:44 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fe98583a6fso3216551e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 11:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1691953122; x=1692557922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbRMQLgn6q8vxhzEowCXC6DM0VIy22uIjp0J0FlZhHw=;
        b=mEZqOEzFE/NHDpIJnP+f47/xucTwmNrnya1FWJHPVprnNFpuerfe0PTM7FEVUY1eMw
         wfkq7myj4csEPiDqvJaRm1KHqZmGGATAB+0+jNoGlNI4qCPmJuRpO3tWgV3vNcUgm+Bf
         CuuJ5jGA+lAAw3IKAFw4npqGdwJbujzYEu4d6y6zYhYV+Iwdpr0HArrzYUpaJ8EkJDo0
         9JGxpKtO/W/ysympLiTnDg+sy87A7Kfoxgy6XhODa6oTCk+XqhxFkpoQr6p/sEHmB3lK
         wrJs5jPCUzjHntDOzh3meRkoCNPBtaOUwlrxdjstHx94D5a+W8LBnxSc5wyvgkUspT0G
         /6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691953122; x=1692557922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbRMQLgn6q8vxhzEowCXC6DM0VIy22uIjp0J0FlZhHw=;
        b=dweFlknbTXdg96tiQRYBMizM9fPlkfVIKCI5JPDLJlhPurLSOl06OL7w+kcLWk7VOB
         tl6LIKLoQPPUfhoSJVwNPib4yV+q9s8tLPt5K3YzXQZwfp0qlFC69i6YRcB6H7JPbs9M
         6wTNPkz1YwInNP4yoc6U7dnimgcB5U+aFCpihyUQTBNv5TSc1pRbT/7Mi6ts4YW9NrXF
         0SG2DBr0Dc+vkdp2S68/4TKhu0K8BLdBli5De1K4Z076wIscTYLDWQYVqIZ0PuzdPWwS
         rkCfkYKF0e/U9lGVImvIxMqj+0wCBh2T53h45LCXfTuYs5N64+LbS0vGZB8TzZSAGbaj
         tUlg==
X-Gm-Message-State: AOJu0YzFbjbesghg5o+qfdTivYM1I2VXaAfTFya/xk34qehdrpgMjBbI
	TwJVmPeu5SE4NYcKSXLhF9lM6fblGKb5yZqzpo/WOg==
X-Google-Smtp-Source: AGHT+IEvpOk8ea7m2X3vZBrE0Ny9SDQyHNrazCNWd1S+UiFY+XEC89xad6T9d4vx8VCEZ/bYmPfek7fR6mdGzHzZntc=
X-Received: by 2002:a05:6512:a8d:b0:4fb:748f:604e with SMTP id
 m13-20020a0565120a8d00b004fb748f604emr6617146lfu.36.1691953122076; Sun, 13
 Aug 2023 11:58:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230811194032.4240-1-aboutphysycs@gmail.com> <4850013.31r3eYUQgx@jernej-laptop>
In-Reply-To: <4850013.31r3eYUQgx@jernej-laptop>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Sun, 13 Aug 2023 21:58:31 +0300
Message-ID: <CAH3L5QoVd45nR9HmAkSKJh7EnVXr1Jx6wqQ9j=x0AtNdqGjDaA@mail.gmail.com>
Subject: Re: [PATCH] thermal: sun8i_thermal: remove unneeded call to platform_set_drvdata()
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	Andrei Coardos <aboutphysycs@gmail.com>, samuel@sholland.org, wens@csie.org, 
	rui.zhang@intel.com, amitk@kernel.org, daniel.lezcano@linaro.org, 
	rafael@kernel.org, tiny.windzz@gmail.com, anarsoul@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 13, 2023 at 6:32=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne petek, 11. avgust 2023 ob 21:40:32 CEST je Andrei Coardos napisal(a):
> > This function call was found to be unnecessary as there is no equivalen=
t
> > platform_get_drvdata() call to access the private data of the driver. A=
lso,
> > the private data is defined in this driver, so there is no risk of it b=
eing
> > accessed outside of this driver file.
> >
> > Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
>

Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>

> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Best regards,
> Jernej
>
> > ---
> >  drivers/thermal/sun8i_thermal.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/thermal/sun8i_thermal.c
> > b/drivers/thermal/sun8i_thermal.c index 195f3c5d0b38..61a2f287ac90 1006=
44
> > --- a/drivers/thermal/sun8i_thermal.c
> > +++ b/drivers/thermal/sun8i_thermal.c
> > @@ -489,8 +489,6 @@ static int sun8i_ths_probe(struct platform_device *=
pdev)
> > if (!tmdev->chip)
> >               return -EINVAL;
> >
> > -     platform_set_drvdata(pdev, tmdev);
> > -
> >       ret =3D sun8i_ths_resource_init(tmdev);
> >       if (ret)
> >               return ret;
>
>
>
>
