Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE0271
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Apr 2021 02:16:38 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id r128so26514687lff.4
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Apr 2021 19:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=n61yGtJZyCGljbJcAu8LO/oqfzd6a+DBZ7YJWNVUUPM=;
        b=gxGmyS/6mUxKL8boe3AW0P8lwp8HwxuiCp9SasMHbvdmD/twmwMvl+R1IUIxYwsMPG
         fHjkRyeJ1tN0VncjR3HgCDHwwreU/mbqubOGy28A/5X0RMgkBK3VRfsIOw5Uh38J4/FH
         Z/Eg19J/ZrxQIcCiBeHHPfFhuy9a26B5oR0eeVzTEk4JPPZSci9GjjSPOtKlgZvy6wig
         NLIPWgMx3T19WbEctQIZ5MtZjwcn9DgeBVCM0Ool5iDSSpRBsKUluAgB+nFQ5j0/L8pL
         MkSZmsQ9K3tWEPJY0ELrZRXF1yrn9DCRna0nLbCQMM56Bd4eS6enkUgjAlL9KHhtsHCZ
         xmeA==
X-Gm-Message-State: AOAM531dD+Sp63eQ/L/QF4B/6gdF1oZuqkQEaUeZqE40OSwDtJwGNsrR
	lnMx9HFL+y4s/vdUQxuZHOLYfFKIoekXZw==
X-Google-Smtp-Source: ABdhPJy2L6wYyO78Gq/pYJi5/Qz5oEC3tPFKBjW2XAAp+ciO+LErwLLJLS0cBIh6fDMUXEtyU8ovKg==
X-Received: by 2002:a05:6512:b0f:: with SMTP id w15mr10786016lfu.333.1618798596326;
        Sun, 18 Apr 2021 19:16:36 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id w25sm1656660ljo.61.2021.04.18.19.16.35
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Apr 2021 19:16:35 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id g8so53546258lfv.12
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Apr 2021 19:16:35 -0700 (PDT)
X-Received: by 2002:a05:6512:487:: with SMTP id v7mr4379009lfq.57.1618798595558;
 Sun, 18 Apr 2021 19:16:35 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210419015815.38910-1-samuel@sholland.org>
In-Reply-To: <20210419015815.38910-1-samuel@sholland.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 Apr 2021 10:16:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v67cs5nVJihF7+zfPv7f2y+xxDG5ihAJ4pciZ9zm0b5nOw@mail.gmail.com>
Message-ID: <CAGb2v67cs5nVJihF7+zfPv7f2y+xxDG5ihAJ4pciZ9zm0b5nOw@mail.gmail.com>
Subject: Re: [PATCH] nvmem: sunxi_sid: Set type to OTP
To: Samuel Holland <samuel@sholland.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@siol.net>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 19, 2021 at 9:58 AM Samuel Holland <samuel@sholland.org> wrote:
>
> This device currently reports an "Unknown" type in sysfs.
> Since it is an eFuse hardware device, set its type to OTP.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
