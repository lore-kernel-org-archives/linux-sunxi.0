Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FBC2F27
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Feb 2022 01:21:30 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id p12so2277545edq.9
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Feb 2022 17:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XqZZDgbvJEjaslswj4iQyILOdNO9ek9ynag5i2p74cg=;
        b=dBpZR56WH7Ny729m95TVGiETRMj3GHX7i18H6Ddp35sEcnsyqcBRKKbDgM67YcRFhs
         zy+u3RQAucW0E05VZOQe5j8j/5PVTqsMamybmUvrsczY8dkXjg+7nm8VHQrep976ABLj
         ZWK6ezTWCbxhWy5hGT7dz7tPvQ/aEYusRh39vC3tbgVCfouaqiL6Fb2Rn2cr/GwK8MbC
         qSmzCUYF9pTtFVEEiU/yZNYjfhtTDPXM5CkmTDb2mgRMddoX9adV5raRUZ1YN1rGqHFp
         00FMTWY1mcY1n/hz6bYk4JVFwI48YGjUnBvuJ+u0PvLNrXSqd+3xpXkaPr6/XQmN0rVo
         QYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XqZZDgbvJEjaslswj4iQyILOdNO9ek9ynag5i2p74cg=;
        b=kgd8aTTIKbkGzL4TEB2EU/pM1JLatH7aUkXQvFrdEmZQR1fhECI9wkBC09rJpOfNuj
         yTL3P+jbax/vBm1FZqdR5/z5NtfQcMrBKLeLbdPOH5mVKZcmr6aTIRcW+BZbeT78I9bI
         ejQ55VPLA6ieavRLYUvtW2jacAgv4LligY0O4OoAf6EEMQef7kO8THt9FbxFHa0IWM7e
         S/ewHSbamDAXlX9B6ZDR6M4SoEZjZtNU8yzeMe0JaMoeVokT93vlcNGzqdYahiLiu8mp
         0SPvRR/TZwHvixfnbee9MdHNQutCSPpa+wvHID19UEQZnSI4PyigOvKThRkS1oVMvuQ+
         UvCw==
X-Gm-Message-State: AOAM530NHUgwDJq4tTNTUUqFbJQLoPNDt3kuYzqzrS6fGDUJQKqUsyg2
	HliByFzEhPq1owO770TzPcF4pnjqjGbq++1QbYA=
X-Google-Smtp-Source: ABdhPJyDjLkdw6Aj6qAQhdz6KNG/1AkiNIBn1qOQnZG95iToeYZB5PABtH7VVda65bMK5RCeYmhCSxIYtGWoDzOxrGI=
X-Received: by 2002:a50:ec12:: with SMTP id g18mr33298838edr.208.1643851288726;
 Wed, 02 Feb 2022 17:21:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220201014116.25864-1-andre.przywara@arm.com>
 <20220201014116.25864-3-andre.przywara@arm.com> <b63d95a1-42e9-27c7-920a-254e7d789f4d@sholland.org>
In-Reply-To: <b63d95a1-42e9-27c7-920a-254e7d789f4d@sholland.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 2 Feb 2022 22:21:19 -0300
Message-ID: <CAOMZO5CwC8nj-gozkkEnFFprALYO6wnPDsDiAQt71_naYAdkJg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] sunxi: move Cortex SMPEN setting into start.S
To: Samuel Holland <samuel@sholland.org>, Sven Schwermer <sven@svenschwermer.de>
Cc: Andre Przywara <andre.przywara@arm.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, 
	U-Boot-Denx <u-boot@lists.denx.de>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Samuel and Andre,

On Wed, Feb 2, 2022 at 10:06 PM Samuel Holland <samuel@sholland.org> wrote:

> >  ENTRY(cpu_init_cp15)
> > +
> > +#if CONFIG_IS_ENABLED(ARMV7_SET_CORTEX_SMPEN)
>
> There is no SPL-prefixed symbol, so you probably want plain old "#if defined"
> here instead. Otherwise, this code will always be omitted from SPL.

Yes, it would be nice to set the SMP bit for all CortexA7 devices in SPL too.

Sven has sent a patch doing it for the i.MX CortexA7 devices:
https://lists.denx.de/pipermail/u-boot/2022-January/470781.html
