Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4985CA4E
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 08:22:15 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id t5so6156494edc.11
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 01:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=TNUwlG9nzp/Ftl8DzRydchfqZilNnNf9wCNcd4Axyyc=;
        b=AsEa44Yc9lPon5nq4b7t2lUsgYwtl38nBM80b4OEIXUmDvPFUK3Ea6watTDnpUP//5
         Rb98C1RrEplCcahkDx0onVcQi+FRIR7igDeitUo5JDX7ticQ9DMh7lcgWORZeQp91drj
         R24codiDwS6kHVQjc9ersi82pyV7oarHgP1ciRxLTG7A55VD5YeP5DOLk+/A9fjJ4t8I
         k7TabjpB8lNP/QZNXWjBh8i7keS9+fd3eZktH4i4fGTOuIExnwWyj4ph0qQ7EC1CG/mF
         L2EjVFwHKrGF6fC+F47yDlL5eM03xDo7ILVRxOiyuOgRrUjC9cl+mdOTtDzK86BkhhhH
         GFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=TNUwlG9nzp/Ftl8DzRydchfqZilNnNf9wCNcd4Axyyc=;
        b=ngWMX6x/1Fw08J2mHGT3Rv3Pto7uHX/DdIRsSNnfIYNxrbCh7EtqWT+xR4V2Ur2K24
         VdHq0ZIQElooXoJwwfwAJJKZNTlSHlVeYSOG2O3gHbF+zh5afHtA6fFPwaxdj19AK7y3
         F353a478kJbEbxg53bszryGBSw7xeiOuns4Ht5ueGHPj9oLIyt6UJuXp/0EeDffmCEHI
         JNh0dRSClxeviOhGzcOopWghIZySe5qPV1Obi2oqG0svEEHWPNY0wQ4mid5jWc97VFlB
         Onb5njEj5MU1bcO6ESTVNnKGP85CV5cUj3oFpjja7+N6jY7T+WxmlIDcUgHU+16/qntj
         GQFA==
X-Gm-Message-State: ACgBeo0wwfIczH253G+dmKIJBoVlJ/cqObrh1krVIOj1EFypW1aCE3KM
	yE4HFuqbpTNtKChDBgJxfRY=
X-Google-Smtp-Source: AA6agR7CV8kNq1XXv7XP88MrV1HeSYkUOz8GKDEpxx8jnl28DpZxeL/ERxuzAJd0fcrNHGowxnjkng==
X-Received: by 2002:aa7:d795:0:b0:43c:eb00:fc77 with SMTP id s21-20020aa7d795000000b0043ceb00fc77mr9816545edq.284.1660465333601;
        Sun, 14 Aug 2022 01:22:13 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id z5-20020a1709063ac500b007306df330e5sm2774748ejd.12.2022.08.14.01.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 01:22:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <maxime@cerno.tech>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] mmc: sunxi-mmc: Fix clock refcount imbalance during unbind
Date: Sun, 14 Aug 2022 10:22:11 +0200
Message-ID: <21565294.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20220810022509.43743-1-samuel@sholland.org>
References: <20220810022509.43743-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 10. avgust 2022 ob 04:25:09 CEST je Samuel Holland napisal(a):
> If the controller is suspended by runtime PM, the clock is already
> disabled, so do not try to disable it again during removal. Use
> pm_runtime_disable() to flush any pending runtime PM transitions.
> 
> Fixes: 9a8e1e8cc2c0 ("mmc: sunxi: Add runtime_pm support")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Did you get any warnings for unbalanced disable calls?

Anyway:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


