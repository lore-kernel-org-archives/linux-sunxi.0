Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E6170
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Jul 2021 14:22:45 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id c17so34389884ejk.13
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Jul 2021 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KXznDDoKxPvronr6ZB/8oix8P+kbXwv/iUS7d/f7KFg=;
        b=lZNLFjX+u81zO0Q773q7YkwEXePP/o3hQVa2F+rKErxqibLR+c8FLOvs8avXO8yAPg
         1/WHlGO09f1yLhr5IOBL9NCwgUcwOzVEyac5mxBAB+JhzVPscRDNGiMbbmwUKlTNJT5E
         sFbcharYwQrE6dL8+wVONusgk4PGsb8lLy0oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KXznDDoKxPvronr6ZB/8oix8P+kbXwv/iUS7d/f7KFg=;
        b=XiOhMGDvHSvOGluUc2xBld4xRfhyFWG0/tIpMxh0DfXQrCG2uZ73OfDvc6urOTaeJc
         bTxaenwcwRhrtFKuiM4bOQNJ9uE8C2nCywfiMsjYSMlSe1Qusj6V2A4j5NzDyQm4pyyS
         xT/Din3cqxhb1OlJwKDPzYYUI0ofe/Siaw4Neho/dmZlhZtDPD6XCrzv0CVunlF5jONZ
         dj7KSSMKQdmVxrV110vT8V7S546intyxsHFINoOppB+r6z7D9ewjJZstrylWE75xCjBY
         C9Miiym/yAKOanMVpKcAcX53ZcfoIyUKsvlYV406NarVqsNDafRI2R2WQZnMgbkdZZ7+
         nAvw==
X-Gm-Message-State: AOAM531HotVi+gqO+arCwxZDTUQC8DlvZ7dE4LUUYAZ1n2C6HMqiYDwP
	0P2esJ/xFgFNSEKtXyzqmuXss31G8IiPzCSNdnCtNQ==
X-Google-Smtp-Source: ABdhPJxY3de/fa6HtiJ0aSkMxFnIfe8IFC58ychndTovYKjZPvABuH+YHjXHb8kBtYndJRw1GDEMJpUbNulY0CR9/zE=
X-Received: by 2002:a17:906:5d12:: with SMTP id g18mr18761112ejt.186.1625581364144;
 Tue, 06 Jul 2021 07:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210705230445.14834-1-andre.przywara@arm.com> <20210705230445.14834-2-andre.przywara@arm.com>
In-Reply-To: <20210705230445.14834-2-andre.przywara@arm.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 6 Jul 2021 19:52:33 +0530
Message-ID: <CAMty3ZDURDZtPRmzbm9KOjUDZWGN6oXFpkw6nhbmPMu1SUeVjA@mail.gmail.com>
Subject: Re: [PATCH 1/3] sunxi: SPL SPI: Allow larger SPL
To: Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	U-Boot-Denx <u-boot@lists.denx.de>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 4:35 AM Andre Przywara <andre.przywara@arm.com> wrote:
>
> The more recent Allwinner SoCs BootROMs can actually load SPL images
> larger than 32KB. We use this on the H616 to fit the extra code needed
> for the PMIC into the image, and have provisions in board.c to respect
> that larger SPL size when booting from MMC.
>
> However the sunxi SPL SPI loader has a hardcoded load offset of 32KB,
> which will fail on the H616.
>
> To fix this, use the same algorithm we use for MMC: if the SPL size is
> smaller than 32KB, we use 32KB, otherwise we expect the U-Boot payload
> directly after the SPL code.
>
> This prepares for SPI booting with larger SPLs like on the H616.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
