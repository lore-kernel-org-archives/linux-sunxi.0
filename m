Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012E672
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Apr 2021 12:25:51 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id zg3so2515318ejb.8
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Apr 2021 05:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0+JadggMV2zos6ZtyZTbNPLIeuKsh7aFmG74ARyFmHk=;
        b=Tk8TzuXKbNTkYrvDAQaZ1YCDWpotQLTCxek2U2nU2CGL469GUB1b3k0mqyO7jtwCFQ
         oHRENC2ShHMs40nrz1T41D9rZbyoxp0rOjVramQxUvDWXP6AEfl+ibQZWi7Mh3X+0v66
         d+rHvaPCnbb+nr2K+RIIzo434qyRP4LjdBark=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0+JadggMV2zos6ZtyZTbNPLIeuKsh7aFmG74ARyFmHk=;
        b=YALBKLPodGiCeYEDWP7n54IkxMzgGvfhGtGMYuYNeICBe1s6x9dlznqwXrtRqDxZ8T
         QL+UaKXPvga5Pn1qi7sNBs24I2M8TqAc1pempldvC0tgNIpakE2aw8g7G2L56qU3381u
         cmNidESPlecHRzJqiOekNbS0sj2u6NyCZz8QHmTnLxp4dO3oKHh4mGI9q+x1EQ7y5vAK
         kAN1SPmfImgnKpEOp+WB/ssiALxsDIY7wZwLoW/BQ527Aiccxi7bsV30K6ENHm3QmH+L
         2SbLp5W6IuNYuTAhul3HlGOvfc573IVaAy95qLfC/1RMRJkdV3+or2oDOMxXgZ/S8qCq
         4EYw==
X-Gm-Message-State: AOAM531Mb761KGROv4aVFWkA3QHLvw90ytqNq8gfZGSXLSKqesGaB/C/
	SFLSoIZwX6NeVXpzy2iDFst5SzfWYN9bqknLDPSa+Q==
X-Google-Smtp-Source: ABdhPJxx0HOvdpTbWnnEaK0FSuT1dxFgz7H7ExOVLdI2gggtJuaDUebiWAvhhL2Ecs4QMt3xsN0S5N0BEydvw3JtSQE=
X-Received: by 2002:a17:906:5855:: with SMTP id h21mr18466339ejs.522.1619439950358;
 Mon, 26 Apr 2021 05:25:50 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210426121446.8013-1-andre.przywara@arm.com>
In-Reply-To: <20210426121446.8013-1-andre.przywara@arm.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 26 Apr 2021 17:55:39 +0530
Message-ID: <CAMty3ZC8nEDZjsmigoSDCzqpJFwrQR30xHXnm9aUve2jROQ32A@mail.gmail.com>
Subject: Re: [PATCH] sunxi: board: Add H616 MMC2 pins
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Samuel Holland <samuel@sholland.org>, 
	Icenowy Zheng <icenowy@aosc.io>, U-Boot-Denx <u-boot@lists.denx.de>, 
	linux-sunxi <linux-sunxi@googlegroups.com>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 26, 2021 at 5:45 PM Andre Przywara <andre.przywara@arm.com> wrote:
>
> We hardcode the pinctrl setting for the MMC controllers in boards.c,
> since we need them also in the SPL, where there is no DT yet.
>
> Add the respective setting for the H616 SoC, to enable eMMC on boards
> with this SoC as well.
> Also to make diagnosing this problem easier, print a warning if a board
> tries to setup MMC2 pins without a respective SoC setting being defined.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
