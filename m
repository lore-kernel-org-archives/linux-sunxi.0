Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552F11865
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Jul 2022 03:28:15 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id c13so3377759pla.6
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Jul 2022 20:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wvpJcRf6oUgX+QTmJOMTVRuB6ZpQWygO0uE6iOwv3EY=;
        b=OT22HNUXNQMXJ8QFqf2Ppbo9WsAw44UUVwPFI2ZRqLBMIsK+PxOfalK5+Yoesp7fA6
         btFqpIfbjtLE4kxZp62YiNkErFz+3OK6g2QbxcLEg7WN2BAT8heMUVIOp2HdMwuaLGkk
         qqMrQDjBtmaxs2uSpYOT58uJo3B/cUsJPw+sccWiIStcejXidcfYDHK0DM2sUpLOMSJR
         y6XQIKNSxmVWq45hI1hwzBdrINXzOEyf5Rm4m4WU1l05g26hxpuLivuyeApdG3zdQwuX
         3tEeabcjsfCmKXs5SfVpxX3nSM6j570wFc8cNSZ7XdXM6EN2tJ+ysPbyvk7qBoaHhG7j
         CUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wvpJcRf6oUgX+QTmJOMTVRuB6ZpQWygO0uE6iOwv3EY=;
        b=lSQT6qfPk1UqvGiE8H+QAAKsCGOWcEJH29+XUja4WQpNpvggeyPyOC9kLDTEWWkabi
         Vz3BNy7VOIWk3K0PTW626PXZvw7ahU7RvoJXVBdYHDR2yozefGRAfp9zXIKtdrgp2Klp
         C+hiIt954PM6iOCGnTctHg+DjD2xpWJGm7QZ/hJAfciQET3l58DIGeb7K9axtqIGG5HD
         NtXjcSWaIEwgaGX1q9Bl6rOHWKFNQ2hFoZ37Sm8qrhgnCgHdQhKeJMtSthylKv2mqI4x
         7Y4qo5Q0w24n9u2d3OMUP1g10bsaE0a58NDjaEpsgCWLYt6ByNl24yUhAFS9eMhqVPtY
         MqvQ==
X-Gm-Message-State: AJIora8cpj08gsdZ9rd6PxIrJ8dOlEc+OaH9vX9PWOQVmuinuiQyWx7E
	Cisv3fB+pJCrqAysd6f7Sxs=
X-Google-Smtp-Source: AGRyM1toH/cAS/LDlQiylUhVdo5tejUnCGLAKWX1fMPdZ4XeRBtTApKS4ROZLiTcRHyu+7wY5gJtIw==
X-Received: by 2002:a17:903:2447:b0:16a:3b58:48c1 with SMTP id l7-20020a170903244700b0016a3b5848c1mr17049132pls.44.1657510094625;
        Sun, 10 Jul 2022 20:28:14 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:fe1c:af2d:8734:b8ac])
        by smtp.gmail.com with ESMTPSA id 4-20020a620404000000b00528d880a32fsm3569832pfe.78.2022.07.10.20.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:28:13 -0700 (PDT)
Date: Sun, 10 Jul 2022 20:28:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linexp.org>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, rui.zhang@intel.com,
	khilman@baylibre.com, abailon@baylibre.com, amitk@kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH v1 28/33] input/drivers/touchscreen_sun4i: Switch to new
 of thermal API
Message-ID: <YsuYyxTY6Ils/snA@google.com>
References: <20220710212423.681301-1-daniel.lezcano@linexp.org>
 <20220710212423.681301-29-daniel.lezcano@linexp.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710212423.681301-29-daniel.lezcano@linexp.org>

Hi Daniel,

On Sun, Jul 10, 2022 at 11:24:18PM +0200, Daniel Lezcano wrote:
> The thermal OF code has a new API allowing to migrate the OF
> initialization to a simpler approach.
> 
> Use this new API.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>

I assume you want to take this through thermal tree if you get everyone
to agree. I am OK with it, but please use "Input: <driver> - <subject>"
format for input patches, i.e.

	Input: sun4i-ts - switch to new OF thermal API

Otherwise:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
