Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B582D290F
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Sep 2023 10:32:13 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-401da71b7c5so23326045e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Sep 2023 03:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693909931; x=1694514731; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/OQBvJoch509LjspQeiUDjA39PXpbuvgijH49h9PaH4=;
        b=D3/cnO8U5yMClzNYmsdF/Jeh8ejWi5heNlN1eePm2kBFKb05A/RXjECRqI2KneWmtM
         uWH15AgIB88xhIapOp1tn+YMb5gNQXF+cnL3nyUJJbZb5R5ynhSZtIHCpZKOF5zVTx94
         r1ggHWwfm5f5lQdpEbLYVnVL70VGdHfsMRmi/w2ExF6s2HV1YnjBFjjvnoOrcQTXqXFE
         fs/dsKZPbQyHNPzL5up6dvSA+pJz5+eJO2nmYnytcl9vN5+AuvqNHN/fQVdrpjZqz4WH
         pyT3qcocuHAR8UTT2xm+0XggbbmnMSEvwZCpA4Yfa+To9ha/nsFWEea9Aauy1wl1QnXF
         6Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693909931; x=1694514731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/OQBvJoch509LjspQeiUDjA39PXpbuvgijH49h9PaH4=;
        b=XKnkwb5z2DHGowQOqYDieaf9Eux3U8BA6VVkzXq9gRjeYfbqbfKC0SKX4/gcRcoYsI
         9Gh6C83V38g2ImrxbQoIJuvGOA+FoO+Vcbns/w+QoFM60NZl8TTIabyLrdgxmO+GbaX7
         K0rPpUokO3CQI6qwpUjcWMu/Z3GYp6SlZQ92caGARRgCIWd2FIJK7VoBSXfwadd/o0DY
         MqUxd8JnmCjAS120MpUEZthCeXd7YYUC96w8ZXyYtScryllaVldp/b228tvJa+7WquI/
         C9f70eUhbBpgleF1UxRZGaPIj2YdK4ew6XhFbryeivuabsTrpEn0R0rwo0Ft5aroTd81
         Uefg==
X-Gm-Message-State: AOJu0Yy0v/z1oey0dtf2Zg01gcOLIkEoFDHEe4JVlkL34e8yfndJuVgm
	BUY3UQD2FgRGRocqsw1/oFco4w==
X-Google-Smtp-Source: AGHT+IEYlIuD3hm2wYNbYHvhWP97jISs6NsenOmr2XcKoguKkZOXo5z9CJuucBGE/1Kuq5gWR+1nnQ==
X-Received: by 2002:a05:600c:22d7:b0:3fc:114:c015 with SMTP id 23-20020a05600c22d700b003fc0114c015mr8218926wmg.39.1693909931598;
        Tue, 05 Sep 2023 03:32:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n26-20020a05600c3b9a00b00402c0a8a084sm11134162wms.17.2023.09.05.03.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 03:32:11 -0700 (PDT)
Date: Tue, 5 Sep 2023 13:32:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] phy: sun4i-usb: Fix a W=1 compilation failure
Message-ID: <e1a5eea0-33a0-4a58-912a-9548d249ea5d@kadam.mountain>
References: <0bc81612171baaa6d5dff58c8e009debc03e1ba8.1693735840.git.christophe.jaillet@wanadoo.fr>
 <20230904005855.658819b3@slackpad.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230904005855.658819b3@slackpad.lan>

On Mon, Sep 04, 2023 at 12:58:55AM +0100, Andre Przywara wrote:
> On Sun,  3 Sep 2023 12:11:06 +0200
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
> > With gcc 12.3.0, when this file is built, we get errors such as:
> > 
> > drivers/phy/allwinner/phy-sun4i-usb.c: In function ‘sun4i_usb_phy_probe’:
> > drivers/phy/allwinner/phy-sun4i-usb.c:790:52: error: ‘_vbus’ directive output may be truncated writing 5 bytes into a region of size between 2 and 12 [-Werror=format-truncation=]
> >   790 |                 snprintf(name, sizeof(name), "usb%d_vbus", i);
> >       |                                                    ^~~~~
> > drivers/phy/allwinner/phy-sun4i-usb.c:790:17: note: ‘snprintf’ output between 10 and 20 bytes into a destination of size 16
> >   790 |                 snprintf(name, sizeof(name), "usb%d_vbus", i);
> >       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Because of the possible value of 'i', this can't be an issue in real world
> 
> Would using "u8 i;" help? After all currently there are only 4 PHYs
> max, and in general this isn't expected to be more than a "handful", so
> 8 bits should be plenty. An unsigned is better anyway.

Generally unsigned types are trickier and cause bugs.  I've blogged
about this before.  The title is a probably more negative than it should
have been.

https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/

My blog mentions u8 i.  I would say avoid that unless forced by an API.

> It leaves a bit of a bitter taste, though, as we shouldn't do this kind
> type tweaking, especially not to work around the compiler trying to be
> clever, but then not seeing the whole picture (that "i" is bounded by
> compile time constants not exceeding "4").

Yeah.  There is always the option of just ignoring the static checker
when it tells you to write bad code.

You don't have to even look at the *whole* picture to know that GCC is
wrong.  The BIT(i) would overflow if i is more than 31.

regards,
dan carpenter

