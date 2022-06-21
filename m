Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BF67499
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 21:03:56 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id m16-20020a7bca50000000b0039c8a224c95so7878176wml.2
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 14:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:from:to:cc:subject:in-reply-to:date:message-id
         :mime-version;
        bh=v2qblIOiEq3IV+Rw5HWdpUsMOXZ3HPIB/MKM16Vrm1A=;
        b=fwTohF+N5txaueZetr08UocKNsHSlc0pzESbB1F/y7wPIx38EW4abh69DjLIIjg/mK
         PU5/PAH62EX7TRCqSDP8SsNK5QMFUusTly5FVdavQPdaKxAMzKjYBMDAGreFR6ilv4x4
         Q9rSo5W3HuGDB4NIyUy4Zy9cXxhJnNXFdpWoE0dRh5GS0J/K7eqtjcrwyZq0CH6X+1Y0
         mIk+D/RxPlF8lPrxMUpcP798DAj0/aM/TM0peucKs2oabnmprSy/oo94jxdJiLKNHOgW
         GMSyJCSCHgyPxF2XER+hKCvjGlgXmLCvJq8G4/sS5aro8+uViOglPu+6dioavbEmSzZY
         9VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=v2qblIOiEq3IV+Rw5HWdpUsMOXZ3HPIB/MKM16Vrm1A=;
        b=KdHH2yRWvmEqxuRmVOeZTpJiM7tCUGK1SoHao7YMRm54XSwNfdQBxK2z+ZGemFBzwI
         zVhcw2Ii2cSqsTwSGviZXWAUKXNKvlR7HxyDRp8v6/afKe1CQQw2JZzkM3CWrUAvJ5w1
         9FUwP+IcKbY16RcVw4pob0EusU38Vlo+z0vNJCYyGGX6P7bhnWM9+MRPo5m6S5clXriQ
         g7CLL6fD/D8yvIZLNKJkJsmzAVPwu+e4AmhadiGk5GPlPJUECCktDKh3GEp//E0y5/Cx
         B+XzuqQrZ9V9BfX4avoSYWp6lIY1VpFcxFdacaLrsm5qxAJQft3rCAXErS5o0z+VQ7MG
         B9/Q==
X-Gm-Message-State: AJIora/aEySzfZUVmNeoJ/n9XqvyBdz3OvZfbGodK0K6k2/3+oY7z+wb
	scHk0WxjXfylD52s4NVTOF8=
X-Google-Smtp-Source: AGRyM1seawZlN42pmJSLDQJ3ijOHsGsLAxYpv/JRO9LAGuWDU9AGN2HjpN9wo6nVNwoUmKfzn+8ozg==
X-Received: by 2002:a7b:cf2a:0:b0:39c:4eef:29e with SMTP id m10-20020a7bcf2a000000b0039c4eef029emr117762wmg.28.1655845434599;
        Tue, 21 Jun 2022 14:03:54 -0700 (PDT)
Received: from localhost (92.40.168.123.threembb.co.uk. [92.40.168.123])
        by smtp.gmail.com with ESMTPSA id w3-20020adfec43000000b0021b89c07b6asm11227967wrn.108.2022.06.21.14.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 14:03:54 -0700 (PDT)
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <YrH7JurP2LAl1uYU@sirena.org.uk>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: agross@kernel.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, bgoswami@codeaurora.org,
 gregkh@linuxfoundation.org, rafael@kernel.org, cw00.choi@samsung.com,
 krzysztof.kozlowski@linaro.org, b.zolnierkie@samsung.com,
 myungjoo.ham@samsung.com, michael@walle.cc, linus.walleij@linaro.org,
 brgl@bgdev.pl, tglx@linutronix.de, maz@kernel.org, lee.jones@linaro.org,
 mani@kernel.org, cristian.ciocaltea@gmail.com, wens@csie.org,
 tharvey@gateworks.com, rjones@gateworks.com, mazziesaccount@gmail.com,
 orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com,
 jernej.skrabec@gmail.com, samuel@sholland.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org
Subject: Re: [PATCH 00/49] regmap-irq cleanups and refactoring
In-reply-to: <YrH7JurP2LAl1uYU@sirena.org.uk>
Date: Tue, 21 Jun 2022 22:04:59 +0100
Message-ID: <oewDtaKXJJctSx2HcLTI4xuAmbzWo8Vb@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Mark Brown <broonie@kernel.org> writes:

> On Mon, Jun 20, 2022 at 09:05:55PM +0100, Aidan MacDonald wrote:
>
>> Here's a bunch of cleanups for regmap-irq focused on simplifying the API
>> and generalizing it a bit. It's broken up into three refactors, focusing
>> on one area at a time.
>
> This series is very large and the way it is interleaving patches for
> several different subsystems adds to the difficulty managing it.  As
> you've identified there's several different subserieses in here, if you
> need to resend any of this (I've not even started looking at the actual
> patches yet) it would be easier to digest with some combination of
> sending as separate serieses and reordering things so that all the
> things for each subsystem are grouped together.  That'd help with both
> review and with merging, both large serieses and cross subsystem
> dependencies tend to slow things down.

Thanks for the advice. After reading this and some of Andy's comments I
think I understand how to organize this better.

I'll send a trimmed down series including only regmap changes, and
instead of removing things right away I'll just mark them deprecated.
Then the driver patches can go by subsystem (one series per subsystem?)
and once everything is merged the deprecated stuff in regmap-irq can be
removed at a later date.
