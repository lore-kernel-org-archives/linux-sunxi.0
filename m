Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF8B2C9D
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Jan 2022 10:38:22 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id x6so6557520lfa.5
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Jan 2022 02:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=my1JYoEiT1gg/0wBQ3AmYSF58BomzlSIMMv9wEH/Wj8=;
        b=LssndgcLu0hMWC6Zaltu/L4Ygbgam74yEK5Mc3g+kkSWR37FnDKmHLpYl6l7eiJGPr
         fX/PBU5TpP5v3h621MkentElJF+hQbAWCoLx6kElctBlyqqhTcJaghbUn9mx1l+zZudm
         GOTTp9bxDhk2nd8NEL1P/nVMnSSisXZLFm72b3TIjgO2KekhR/W8sOQFoOoHEKBgLQcF
         S6RX33TVr0CwBO0iudfHkIaTh5hP6pSiBBjoEj6nQYOnh2bjAkOosWe9zNt+qVGeNdi4
         RErx5IdjaensUOxj37M5rUkhyDl9skppod/kbd933aqHCIULu002QPwIDLRamhuCn1Sc
         cs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=my1JYoEiT1gg/0wBQ3AmYSF58BomzlSIMMv9wEH/Wj8=;
        b=src3j4OOHKOQ0dn8yP3EQrUhSLYZ8iD1tUap6iUcFW9zYHs1A2XVVUaztz674A94CK
         mPOwPe4oKvwOor4vvuDAk/6a/3kzkwe0bus3bqZpvcVxtc/uQAxrEixUVZ4IAK+OMWyP
         AfDcFoqoHXvY0oJcYodBeBJx0JmzstGW5qY/2nkqiM2N/YzF7LlsOowEhdSiCy5SRsIk
         id5l2VoY3xIGZ1b/CkBhe+CEB+ras889J7GaDLoF/s+FlKfN8gfQ3uKf3wNXyI6U5GoP
         IwnAWGnTzUPkvg764vPX2LJscmAuUOWYsci8UO/AO569UJeVLO+BjSFh4o5N9oFwLohx
         bUKw==
X-Gm-Message-State: AOAM533Ay86TarTSMuSzR01i7CwnZRJyFqGzn9SmEhVK+zQrPhn+TQZA
	ZDEZzNvQA6oA1H3NN1YeN8Y0scCaBwYbXb7uoPeLaQ==
X-Google-Smtp-Source: ABdhPJxNLa3Ky4ELrS281ZBj7vXZdGR+ehC76qbhJRH36UFdnXSeLB0v0lqH+5U/BaOdmBopCoSVQvBbkn9Vc8GIY6c=
X-Received: by 2002:a05:6512:400f:: with SMTP id br15mr4970479lfb.233.1641983900527;
 Wed, 12 Jan 2022 02:38:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220104060325.3957-1-michael@allwinnertech.com> <20220112093415.wdy3ht5yizw5lffl@houat>
In-Reply-To: <20220112093415.wdy3ht5yizw5lffl@houat>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Jan 2022 11:37:44 +0100
Message-ID: <CAPDyKFrD_c36Di66_TCJP3hFFwGHmAgH-DQAPLkJLx-m57VQvw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sunxi-mmc: check ocr_avail on resource request
To: Maxime Ripard <maxime@cerno.tech>, Michael Wu <michael@allwinnertech.com>
Cc: wens@csie.org, samuel@sholland.org, andre.przywara@arm.com, 
	jernej.skrabec@gmail.com, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Jan 2022 at 10:34, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Tue, Jan 04, 2022 at 02:03:25PM +0800, Michael Wu wrote:
> > Some platforms have no regulator, discrete power devices are used instead.
>
> Is it really the case? vmmc at least should be mandatory so a platform
> not having a regulator would violate the binding itself.
>
> > However, sunxi_mmc_probe does not catch this exception when regulator is
> > absent in DTS. This leads to sd or eMMC init failure.
>
> This will still happen with your patch though?
>
> > To solve this, a fixed vmmc regulator must be hooked up in DTS, like this:
> > reg_dummy_vmmc: dummy_vmmc {
> >       compatible = "regulator-fixed";
> >       regulator-name = "dummy-vmmc";
> >       regulator-min-microvolt = <3300000>;
> >       regulator-max-microvolt = <3300000>;
> > };
> >
> > mmc0:mmc@4020000 {
> >       compatible = "allwinner,sun50i-a100-emmc";
> >       device_type = "mmc0";
> >       vmmc-supply = <&reg_dummy_vmmc>;
> > }
> >
> > In this patch, we print an error message and abort the probe process if
> > the regulator is not specified in DTS.
>
> I'm fine with the patch itself, but it's really not clear to me what
> situation is being fixed or improved here.
>
> You're first mentioning that this is fixing the driver probing even if a
> regulator is absent, but then states (rightfully) that in such a case we
> should use a fixed regulator. So we should always have a regulator then?
>
> I assume that you want the driver to properly error out instead of going
> on if either a regulator is missing or if its voltages are out of range?
>
> If the former, then we should probably check if host->mmc->supply.vmmc
> returned an error. If the latter, then yes, checking ocr_avail is
> probably fine but we should make it clearer in the error message that
> it's what it's about.

Just wanted to mention that I just had a very similar discussion
around another patch [1]. Please have a look at that discussion to get
my opinion on this.

Kind regards
Uffe

[1]
https://patchwork.kernel.org/project/linux-mmc/patch/20211215130711.111186-4-gsomlo@gmail.com/
