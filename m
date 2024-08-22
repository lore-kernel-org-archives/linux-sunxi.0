Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF0B4C74
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Aug 2024 00:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286959; cv=none; b=uOW7gRlpgPOQnaDY0ZYEnja7hpArMlUA9Z6E8RIuKI5tAc6/RoEHAet21lpwPrksJInw7qXee+XNc6mg6Q5DgrCZiOZZWfSbc/jt1gNl+6eT0xq4p9zAIKN/trtJ3cjPyx8D2kY+DPKgrh/32hw+7olDCy9gw4GQstB8kQCk5HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286959; c=relaxed/simple;
	bh=5MhG4H5fiBM7tHVKwlGcSJFdOHF6L+Ner2aE272rbRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olNdTH0ng2lqQWLUh2uPo2CSMzrnl5f4C3NcMXhaBF+WhktxbRXbYwCs0FezZPHrDIXkpZAU/A+T/1qDTFlFrk19BNHRl/FUywt6SYS1p08sH3dYDr3iZWJUr4dsDv5knLoKa7INtrH+6NZs+xjX6lUU0ONsHNJxgfz6em5TqFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNeOSDFs; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNeOSDFs"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6bf84c3d043so1102906d6.3
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 17:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286956; x=1724891756; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22zWPOj1TpYR/jHva6dX8P4bxYu0jWvouDXLuCxJapI=;
        b=JNeOSDFsh0mo2LV47PQGvtWXCL1htPrMTaXEQ12KGgClAgiG64pX88F7iRA6FSrhoc
         Fz5rEQXvwms1cA4jWyg7dWZoaSGGugb2Ifxc2f5RWm4+iRPomPEf3Jjt6ojKXl3LVHkN
         klpS28KMO5yNtvSCRaCZJkc/RlegcGWXWUfMjWOIi2j42h70hf+qSNYHiIhX9se5e12f
         6Vh8+eulnhEEd6wF/EYjylj10RrOhv2ka+LjF+J/OGeDoYUAG0EDsIqfj23d4mvSndKt
         /aCnAtjQemGSBTh5VgonWoIiCATCvnOllelTtrH6B+bunwnvud6eqRbHVS+CHdcalS81
         cAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286956; x=1724891756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22zWPOj1TpYR/jHva6dX8P4bxYu0jWvouDXLuCxJapI=;
        b=d0hYcLHsYqdJOQsM3cG9y0Oi0QXRQ3q5UFLmtpGqnQL+87mCVulvXYvjmGTAR6fmWo
         9z8n7l3+SHzXxJFJW28bvB15M8inaf1KO5qhfhu/zSTCLMkIQy1kdmXRpkcElIEXS+Ip
         x02Z+9IpXVZWv0icSj2g6nzwaXFmS6yeZtX1nC8b74A+DTv+4xzOXRvzdd0xMBwc/qL1
         tGTN22kkpJRGhx248ReXfxFyetxYcXrgCoXpoHpvPGmxbnIiROZYZsJCmfmVexKqN2t/
         sMQvNRfGx47V8emH9UPHDsPkGUIGq9ct3Jea1daWgyaXnrq6djU3X1jFceiYQzw20Agf
         s57g==
X-Forwarded-Encrypted: i=1; AJvYcCWIRjpM+Q1jW4lUbjrKbSKQndNxqqBe6rIjjG4vTL0hIpbRq4UDWBDAIzaZIwQGtCc4+44jAppoMkWPPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaGCuIITBGdJZJZGLVnsS3lIFRQeaepoFcxuFJ+7y2euiYIc0x
	56LBHsU6IFepJ4TPlnsCAN/4Afk20Tvd1GTgV1vNj1e7Mf8B2dtOj1MkQBdN3pPbgoTEr2GFeGg
	MV6kXQNZ3FLeV+/YvhYgZw9sPmRA=
X-Google-Smtp-Source: AGHT+IFA7v3PE7COTekEBnadVG/BYIOlP9BEhcpwuRDzMHbYs2DiX9GTE7X59ozXJ7MpVRg4cwF21rX4O6OpKBulwMg=
X-Received: by 2002:a05:6214:4520:b0:6b7:ae86:e33e with SMTP id
 6a1803df08f44-6c155e09dfdmr34354096d6.37.1724286956259; Wed, 21 Aug 2024
 17:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240820125840.9032-1-rongqianfeng@vivo.com>
In-Reply-To: <20240820125840.9032-1-rongqianfeng@vivo.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Thu, 22 Aug 2024 10:35:45 +1000
Message-ID: <CAGRGNgXn94ZPROLN4JButpnc+ffFFr1SwtTFM=bvcPH95DFQgQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: Use devm_clk_get_enabled() helpers
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rong,

On Tue, Aug 20, 2024 at 10:59=E2=80=AFPM Rong Qianfeng <rongqianfeng@vivo.c=
om> wrote:
>
> Replace devm_clk_get() and clk_prepare_enable() with
> devm_clk_get_enabled() that also disables and unprepares it on
> driver detach.
>
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 13 +++----------
>  drivers/gpu/drm/sun4i/sun6i_drc.c         | 15 ++++-----------
>  drivers/gpu/drm/sun4i/sun8i_mixer.c       | 13 +++----------
>  3 files changed, 10 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/su=
n6i_drc.c
> index 0d342f43fa93..f263ad282828 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_drc.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
> @@ -42,33 +42,28 @@ static int sun6i_drc_bind(struct device *dev, struct =
device *master,
>                 return ret;
>         }
>
> -       drc->bus_clk =3D devm_clk_get(dev, "ahb");
> +       drc->bus_clk =3D devm_clk_get_enabled(dev, "ahb");
>         if (IS_ERR(drc->bus_clk)) {
>                 dev_err(dev, "Couldn't get our bus clock\n");
>                 ret =3D PTR_ERR(drc->bus_clk);
>                 goto err_assert_reset;
>         }
> -       clk_prepare_enable(drc->bus_clk);
>
> -       drc->mod_clk =3D devm_clk_get(dev, "mod");
> +       drc->mod_clk =3D devm_clk_get_enabled(dev, "mod");
>         if (IS_ERR(drc->mod_clk)) {
>                 dev_err(dev, "Couldn't get our mod clock\n");
>                 ret =3D PTR_ERR(drc->mod_clk);
> -               goto err_disable_bus_clk;
> +               goto err_assert_reset;
>         }
>
>         ret =3D clk_set_rate_exclusive(drc->mod_clk, 300000000);
>         if (ret) {
>                 dev_err(dev, "Couldn't set the module clock frequency\n")=
;
> -               goto err_disable_bus_clk;
> +               goto err_assert_reset;
>         }
>
> -       clk_prepare_enable(drc->mod_clk);

Am I reading this right: is this changing the init sequence so that
the clock is enabled before setting a rate?

This is the sort of thing that might cause glitches and issues in some
hardware, so it'd be polite to test such a change on the actual
hardware before posting it.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
