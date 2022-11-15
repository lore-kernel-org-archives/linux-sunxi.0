Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BC52F31
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 10:18:57 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id t4so9327535wmj.5
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 02:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y0jhQ5wWDkw9YieqTPmmqrGIOhq9gcBh4/aIkZ5lXzM=;
        b=57noagd9/+GLWjNU9l6zkY9huepwbD69VwGHB+sQGnTHr1xZHyfKABbg4l4A4KRW5k
         ruJ0W7plLAqEVfC09oNuWRQrNTDypUejVAyHQIkLAnJCp74Khfg64VJUWos7+NcX6iLa
         gnpsgeEnzLVmexr7TFZoqkPbevxOTsmvfyDZNkQcpy4hgkvg6yV4FixJKueRVN9ew+RH
         k3JhIE9cHIfqpGyzVApsoLHiZyKF1/AROnnTIWkNvB+JDtHB2g6fC+7RSqNn6EbGLU0t
         E+q80oRh3vJmfeGrdASC8eTGBIOumDLS/VfT5BhurOOvdpPDzwq/M/wQqZKiRX2G3SeS
         M+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0jhQ5wWDkw9YieqTPmmqrGIOhq9gcBh4/aIkZ5lXzM=;
        b=evj3YzsMRfpWCU7eC2+7Cdq1ggtXO8oGX/VCWIqUwPkYAHRovc9ImVgmsZYleMdIjS
         KScgScn/wh12ZW0YRz//iixHgpQV/8B3fEHzvpSGQc2vl+gEdN1awbSfhKVfxXGx4qoJ
         CpvQZVmlvDG8VnMUZQMOzn8GEZfXuRvzRJt0+8h0dP81clnsjIVAMCGVnsmjadhPsXrk
         AqBuKCrSeD0fKyzQGzBzi2BGSW7CZUVHYvc+ZqZkMQEvQ4vGkrx6pGQJh+Jc1m/UIUTz
         Z8XqPik4pcnHK/klbHUlHsFIilUGWiDbgEEJXA1ESiX8FcXgNWcyU07zcRbKIkEXHwQe
         v57g==
X-Gm-Message-State: ANoB5pkgixbmkNRGzsb5O7SlBOcJWb0OSZuJUweVjR0tQ2Z7eeo1ZUqD
	QyuDKRFTij+AmIDnAArOYYhJpg==
X-Google-Smtp-Source: AA0mqf4ITJ/zq/QXos6q8t7wiTwkyykTspLsX8kURJcVbV6wRrgRL+pLuPL1gqJw44YPrazacqtxSw==
X-Received: by 2002:a05:600c:314a:b0:3cf:7dc1:f432 with SMTP id h10-20020a05600c314a00b003cf7dc1f432mr791063wmo.148.1668507536327;
        Tue, 15 Nov 2022 02:18:56 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id f7-20020adfe907000000b0023677081f3asm11717345wrm.42.2022.11.15.02.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 02:18:55 -0800 (PST)
Date: Tue, 15 Nov 2022 11:18:50 +0100
From: Corentin LABBE <clabbe@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: andrew@lunn.ch, calvin.johnson@oss.nxp.com, davem@davemloft.net,
	edumazet@google.com, hkallweit1@gmail.com, jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
	lgirdwood@gmail.com, linux@armlinux.org.uk, pabeni@redhat.com,
	robh+dt@kernel.org, samuel@sholland.org, wens@csie.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 1/3] regulator: Add of_regulator_bulk_get_all
Message-ID: <Y3NnirK0bN71IgCo@Red>
References: <20221115073603.3425396-1-clabbe@baylibre.com>
 <20221115073603.3425396-2-clabbe@baylibre.com>
 <Y3Nj4pA2+WRFvSNd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y3Nj4pA2+WRFvSNd@sirena.org.uk>

Le Tue, Nov 15, 2022 at 10:03:14AM +0000, Mark Brown a écrit :
> On Tue, Nov 15, 2022 at 07:36:01AM +0000, Corentin Labbe wrote:
> 
> > It work exactly like regulator_bulk_get() but instead of working on a
> > provided list of names, it seek all consumers properties matching
> > xxx-supply.
> 
> What's the use case - why would a device not know which supplies
> it requires?  This just looks like an invitation to badly written
> consumers TBH.

Hello

The device know which supply it have, but I found only this way to made all maintainers happy.
See https://lore.kernel.org/netdev/0518eef1-75a6-fbfe-96d8-bb1fc4e5178a@linaro.org/t/#m7a2e012f4c7c7058478811929774ab2af9bfcbf6

Regards
