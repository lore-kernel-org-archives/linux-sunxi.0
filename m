Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2952F31
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 10:17:13 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so9907572wmi.3
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 02:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pdA+gwN2rGjIMgTg0+noXMRaLEEwMRfBfXbs4I6k2H0=;
        b=Zt4y1g4rmSHuLcI5wrSBoJC1/bJZw2N1T33WD2n9Qb8IBlR1eLqi6P9A0BhbWejE62
         E34CT+hKgpOjDAwiNPfoTzHeDL2jDkSAV9+G4er8c03aCKCQ9uyAI2EJwWCzgAyYs50X
         Bz5oSywEK7R0Y+mEHhxMRaPoUuJf4UbbmCc9rxN7DIioOVIilQJrLa/W6W77ujR6lrGn
         19QYhndgs/u+nkIEFGtrmgVO6Ld9gv16LH3tSvXuAEarZtspl3KkesRmOwCtuQtjudpJ
         U3j1VNQNkqIlRhWxc6u9jiM5cnQSeJ7rS3MA7kKZENYebyzNZlq++yTkGwNJ6BK/DWMk
         pBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdA+gwN2rGjIMgTg0+noXMRaLEEwMRfBfXbs4I6k2H0=;
        b=VNCZQwZ+w0cIlpH46i1pxFim6asIjv8LBflGWE7uAwiJrxYB3KVUWraOL5hz84uArV
         zsW2FDqW7+A3Ex/q8QXlmN1fV3I99DVOwRe+q/6zcBu2R2cqY92HVbkYHoUVUPnE1154
         wTnzD9ZwG2my79re7PiLOZFa4GQ2mW3RFT6GdXRZeWN02zzPy6EVl/HTg3Mj/V+cCFZx
         fipJbSPvy71JK6/e4n/iDYua35yZ9BwDFMoUEVVLa1US7i0eNv4J1gtfnSZNf1uvSGhf
         RNx0LAjA8l8Z8bn3reerYTCTfYL1WkML20qul92o8ctMCvOsP0D7xvEwOOvmRmF1T/KC
         +Nfg==
X-Gm-Message-State: ANoB5pk4COIT29Ji9RCRaWhW/KZO0N5w4SYevEbGz9gg/hXMkRxH+uh/
	YH1yaC+21oF0NedTRkYstisajjjpTYMl7+SvSHI=
X-Google-Smtp-Source: AA0mqf45yhGOLNnomZV1m1B41PUv6FMTJnYvnvkOMdD2PbN7256eD/TfR3VwkF4MpPtEbO3KdP0b3cslKtqJAlmMk9s=
X-Received: by 2002:a05:600c:31a2:b0:3cf:6e9b:21f1 with SMTP id
 s34-20020a05600c31a200b003cf6e9b21f1mr273842wmp.90.1668507431832; Tue, 15 Nov
 2022 02:17:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Tue, 15 Nov 2022 12:17:00 +0200
Message-ID: <CANhJrGNPUA6f9Ea5qwdKx-4t6285+xE8CxxDTF2X13ZCSeVPTQ@mail.gmail.com>
Subject: Re: [PATCH 00/18] mfd: Clean up deprecated regmap-irq functionality
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc: lee@kernel.org, mani@kernel.org, cristian.ciocaltea@gmail.com, 
	wens@csie.org, tharvey@gateworks.com, cw00.choi@samsung.com, 
	krzysztof.kozlowski@linaro.org, brgl@bgdev.pl, orsonzhai@gmail.com, 
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, jernej.skrabec@gmail.com, 
	samuel@sholland.org, linux-kernel@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Aidan,

la 12. marrask. 2022 klo 17.19 Aidan MacDonald
(aidanmacdonald.0x0@gmail.com) kirjoitti:

> Here are some trivial updates to replace old, deprecated regmap-irq APIs
> with the new equivalents. There should be no functional changes, but none
> of the patches have been tested (besides compile testing).

> Link: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/commit/?id=84498d1fb35de6ab71bdfdb6270a464fb4a0951b
>
> Aidan MacDonald (18):

Just a small suggestion. Would it work if the CC-list was generated
separately for each of the patches for a large series targeted to
various individual drivers like this one? I think that many of the
recipients are not interested in more than one or two of the patches +
cover-letter in this 19-mail series...

I know it can be a pain to hassle with the recipient lists and
message-IDs - so I am glad if anyone can find some help from my
personal playground - or even better, share their versions with us :)
So, to open the window for any work-flow improvement suggestions...
...I've personally started generating patches using the following
shell-script (which is inefficient and lazily written but seems to
mostly work for me):
https://github.com/M-Vaittinen/linux/commit/9045670f8d3d4638b9032d96cff955704a6d438e

It can be freely used as a source of inspiration (or perspiration - no
guarantees it works as intended or is feasible for anything) when
generating the next series ;)

Yours
    -- Matti

-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
