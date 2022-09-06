Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F34317D1
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 05:17:42 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id o2-20020a17090a9f8200b0020025a22208so6567606pjp.2
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Sep 2022 22:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=8BL6o4IX1wUUdMQMOvYouiU2H1/IxMVvREYC6zLqjSM=;
        b=TWVCL/xy2HDW+mX4jbgIhLGwdV/WxyPA4RoAN/5cH9gLWKElDmudiSt+BLgWyygYUL
         auKw1A2QkYSevImuO2n+o1XgSBLll2Nco8q4XhnA187HbOc+U5Cp2i67rR50rs/ELzDy
         NOtzxC8RjpPfc87jCp8e46Po/HF2L2I6nSSJbvvD4JIfQX74pWpHmEYRtB4vJrLGTYca
         4ujNx+OlzLtM/0sqxh9DgCzOQT2n5EXHKZTz1lQZ/Fd6ziMtNu6WBBgU06Oqa3MTPYnl
         hX27qfDSveO7p6PQRACejLid/fnq8hfCpPvh9G5VqGJjnxXq7xfwCNID6B7qc2jqgHMK
         vsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8BL6o4IX1wUUdMQMOvYouiU2H1/IxMVvREYC6zLqjSM=;
        b=B0rUxgJEi5utvvF10PJuwslqAgaRMg8QNlesWUKhXaRFm1W2miEKV0QAa6LkqWcO/x
         mSC13sXF6BHlLJCNSMHS9Ql817tYLwmVNVZbQ416+e6q3JI1oAQZmuNayU08vyMoeGIF
         iZ7g0KOjNB06cohEC4ZYY0uqxIsaybZoVavvYWwaItXHJvl1x6B3qgPEBaJUkEB9qezm
         Fra7H3lgxwEuG2TvfplYpsTZRoID9JtqlZAAitpV3/lsnm+RiX2m7Ls7bIyLKH+MX68O
         jIldQY8zNBS2EWBFwtecu+6fEBOqDvXNixAz3bZKGnzZQRorjkijEY63t9P/pBv/GSVv
         aTCw==
X-Gm-Message-State: ACgBeo2IdSIi2mO+UTNQHG2X9/E7I+EYdXuHKyKJqsHvc1U47eVDqW1j
	doCtLPP3WCSimZ/oq6fsLWkfBg==
X-Google-Smtp-Source: AA6agR4vigj/R654EMDF6SU1v26ypc66waj+AKqfllO/bMw5BRTXkx05tlGvD43pNns3B2wikjG6YA==
X-Received: by 2002:a17:902:9007:b0:176:9f9d:463 with SMTP id a7-20020a170902900700b001769f9d0463mr10844798plp.32.1662441461799;
        Mon, 05 Sep 2022 22:17:41 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id cp15-20020a170902e78f00b00176ae5c0f38sm3276959plb.178.2022.09.05.22.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 22:17:40 -0700 (PDT)
Date: Tue, 6 Sep 2022 10:47:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommended
 one to configure and enable regulator
Message-ID: <20220906051738.doyrdfcas7f5avkp@vireshk-i7>
References: <20220905171601.79284-1-peron.clem@gmail.com>
 <20220905171601.79284-5-peron.clem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220905171601.79284-5-peron.clem@gmail.com>

Your subject is 87 columns long, better to squeeze it a bit.

On 05-09-22, 19:16, Clément Péron wrote:
> devm_pm_opp_set_regulators() doesn't enable regulator, which make
> regulator framework switching it off during regulator_late_cleanup().

This isn't the normal behavior as it works for everyone at the moment.
You need to explain what special you are doing here, because of which
you are reaching such a situation.

i.e. you are disabling some code that uses GPU ? Please specify exact
code so others can reproduce it as well.

> Call dev_pm_opp_set_opp() with the recommend OPP in
> panfrost_devfreq_init() to enable the regulator and avoid any switch off
> by regulator_late_cleanup().

The regulator is already enabled I think at this point by the
bootloader. What you are doing here is syncing the state of the
hardware with the software, which would disallow disabling of the
resource unnecessarily.

> Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 5110cd9b2425..67b242407156 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -131,6 +131,14 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  		return PTR_ERR(opp);
>  
>  	panfrost_devfreq_profile.initial_freq = cur_freq;
> +
> +	/* Setup and enable regulator */

Similarly here, explain why this is required to be done.

> +	ret = dev_pm_opp_set_opp(dev, opp);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
> +		return ret;
> +	}
> +
>  	dev_pm_opp_put(opp);

Do this before checking if (ret), so the resource can be freed all the
time.

>  
>  	/*
> -- 
> 2.34.1

-- 
viresh
