Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5FB71
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Apr 2021 08:40:56 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id j10so4745719lfb.12
        for <linux-sunxi@lists.linux.dev>; Wed, 28 Apr 2021 01:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oVYoHb0j5VFpSmctH5aR8XGJ4ktZiFaaq0zVF+LId6M=;
        b=VmsGeVNhBij6WOHJ1eY4hSlEkPPsps8a7tFi36TLwEKoHl8nZdwE1/LgTd1Zscl3lS
         l5JyzVZKh4Uoiawv1bs2Qwho0siLbLViBIhfa147ATHN8KIECJHBlDS5zM5F2efuzjg+
         4yXj3IYXKVfY4P61gl5P7cdnbFfqGpd7nYy9bLtBPi8VPYqRLmP+xRT6TaynchVkqVHc
         +zFjKDvG4BFm+y0hOAmutAKije5e8uslKiP64BJvnaYvHFe+iI9rMxVNzIUvWiY0JpWx
         EvUJ+7BYCtxK9Aw/+xyZOgqc/u98NqF3QnVE37EQPbWtUY+2ilLhnpQHnDN4zHfAvA4K
         ke0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oVYoHb0j5VFpSmctH5aR8XGJ4ktZiFaaq0zVF+LId6M=;
        b=FrfMwNx0kBpHOkfRI2UFmf0gA3ElrOwwk745a+3l0DbYNVU78gR4t4/7QAJx6jVOmV
         AOWNQpibMgsw3gxhSMSztOCsBQrr/8mAY3wbLLFbRet00gZclkCA7D9qqK/tXZN5dtrf
         E1HO/lCS94Ze7Hu7lO6Z3wjDbnUPrAJpW8idT5BiS5/lsm6qaUqreqYggRFjAVu5TaeF
         rjSLm20/TNvS/bbg+hbII2CvGzM3yoVn2rYhb/HM6OE2UN10BQim7ar3G0bN5dD6aspu
         VPR7w3pUnCPSBcZuKj+CqWAc4G4ncaxCUIyTwql2jzdFcelJjr1jDx1nNOXRQ7avdoeb
         8QuA==
X-Gm-Message-State: AOAM531LGYZ+XJYJNRCfDKcdyuoCtYP50zrwmyypCH11kirt8LeQRy14
	6vwy4EIA9iK5QWRDQJuYirA=
X-Google-Smtp-Source: ABdhPJyoXlMRwGItruwsciGuyz3DA7HhF4EfUhAvxkd5DHvXOkbFQAE5LlaG+9S92qRtX/BA+PDpFQ==
X-Received: by 2002:a05:6512:3c8c:: with SMTP id h12mr19976447lfv.388.1619599254899;
        Wed, 28 Apr 2021 01:40:54 -0700 (PDT)
Received: from [192.168.1.100] ([31.173.87.27])
        by smtp.gmail.com with ESMTPSA id a20sm1005787ljd.105.2021.04.28.01.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 01:40:54 -0700 (PDT)
Subject: Re: [PATCH] ata: ahci_sunxi: Disable DIPM
To: Timo Sigurdsson <public_timo.s@silentcreek.de>, axboe@kernel.dk,
 mripard@kernel.org, wens@csie.org, jernej.skrabec@siol.net,
 linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oliver@schinagl.nl, stable@vger.kernel.org
References: <20210427230537.21423-1-public_timo.s@silentcreek.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <24eb672c-9772-4e3f-e3de-0fe3390c659f@gmail.com>
Date: Wed, 28 Apr 2021 11:40:44 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210427230537.21423-1-public_timo.s@silentcreek.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello!

On 28.04.2021 2:05, Timo Sigurdsson wrote:

> DIPM is unsupported or broken on sunxi. Trying to enable the power
> management policy med_power_with_dipm on an Allwinner A20 SoC based board
> leads to immediate I/O errors and the attached SATA disk disappears from
> the /dev filesystem. A reset (power cycle) is required to make the SATA
> controller or disk work again. The A10 and A20 SoC data sheets and manuals
> don't mention DIPM at all [1], so it's fair to assume that it's simply not
> supported. But even if it were, it should be considered broken and best be
                             ^ was

> disabled in the ahci_sunxi driver.
> 
> Fixes: c5754b5220f0 ("ARM: sunxi: Add support for Allwinner SUNXi SoCs sata to ahci_platform")

    The "Fixes:" tag should immediately precede the signoff tag...

> [1] https://github.com/allwinner-zh/documents/tree/master/

    And this line should be immediately after the patch description.

> Signed-off-by: Timo Sigurdsson <public_timo.s@silentcreek.de>
> Tested-by: Timo Sigurdsson <public_timo.s@silentcreek.de>
[...]

MBR, Sergei
