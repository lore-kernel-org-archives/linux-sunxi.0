Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CC272
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Apr 2021 02:40:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D6856145A
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Apr 2021 02:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619664001;
	bh=bxaOdh1GJadqZrk1QP2neiie7OjfP6XuNprfVsLRP9E=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Xxpba4jbzuymHKKEs5/lvpaZipk/0OQC4K2l38fWQuUaTbI1BmJ3YMME5IfN/4t45
	 5wzW3/pnjqt6PhelwAIE2FuFceQ9X8Ui6znzhnWJHdAqmrU9YVmjPhiaqItoaalROK
	 I8dUUzSHdiAri0PUVw9q/wkJZAUjX9KDXNaLOcr/0ZPYgjcZkZr8A2RjcudGtYMEZ2
	 KwgXH/PZivXBjd0RqGSvNG2P7gg/7QeMD1dUrht1kPO95ikFRWVv435PgnpGnnGZ4s
	 bAEGZAOKFDQ42VgSz28ZZWNwMSW0gTmWqviD9AvtCoZZFiad1n6s8vR4iV+IOiY+yp
	 jZN7Fl/zCna/Q==
Received: by mail-lf1-f44.google.com with SMTP id j10so9335458lfb.12
        for <linux-sunxi@lists.linux.dev>; Wed, 28 Apr 2021 19:40:01 -0700 (PDT)
X-Gm-Message-State: AOAM5327m9efSTDPrTtf7cDY9Gxely1ruSZhPIHAQ8ZFdWiHhicLIZn5
	/Lh4suWvqpZGLq8SzMc9kE2iRdJBN3YOfC9slh8=
X-Google-Smtp-Source: ABdhPJw2WnBZFfX45JL45AehyiHx0sTFP0QHhTkpoLUgkbkZ3xRVn64Q/V6w6mV3Wkzks84qPeQi0/Whz+0KldyjRr4=
X-Received: by 2002:a05:6512:3910:: with SMTP id a16mr23292893lfu.303.1619663999672;
 Wed, 28 Apr 2021 19:39:59 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210428225304.23788-1-andre.przywara@arm.com>
In-Reply-To: <20210428225304.23788-1-andre.przywara@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 29 Apr 2021 10:39:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v6555jgiG20FHRas7qdAbXOmezOdzxdVorKO-hwSC=g7nA@mail.gmail.com>
Message-ID: <CAGb2v6555jgiG20FHRas7qdAbXOmezOdzxdVorKO-hwSC=g7nA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH] sunxi: H616: Enable full 4GB of DRAM
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec <jernej.skrabec@siol.net>, 
	Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, Simon Glass <sjg@chromium.org>, 
	Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	linux-sunxi <linux-sunxi@googlegroups.com>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Apr 29, 2021 at 6:53 AM Andre Przywara <andre.przywara@arm.com> wrote:
>
> The H616 is our first supported Allwinner SoC which goes beyond the 4GB
> address space "barrier", by having more than 32 address bits.

Nit: I wouldn't say it's the first. The A80 supports up to 8GB address
space with LPAE. It just never shipped with more than 2GB DRAM.


ChenYu
