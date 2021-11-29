Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3461872
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 17:16:45 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id i6so35538898uae.6
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 09:16:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=fBdrgGv6tktc6qHM+QrJHNp1TEWCu/zp5THtBD27tLk=;
        b=rjxknCcPOAStnMDAQbKHyJI1aDfCMfIV9eJomig5cBf+LG/0xQsSwrsF1vLcAum1D2
         UgYjwcV8HQOhIWxTJn6MOFUOoqecd7Z/mLgbmeLN6P/1bNbPG1aroYQ1B+wo551UHbnR
         SXyV1cjjMzRvmbuOefZWiEYqS0PbHSzdwxDnnnACMLOPtnP2KEchdcK6ZrpZfcqTyoLg
         5ZPnb6+iHGFhUjbotSsy0cAoTr1AtpVd+cpeVBS+zQNAG0HTrVCVLanV8zsq2hPn2AON
         ZOf3+p6+8umNphCwvZvM10+pizxbyV9rAskDBYXKPT7zQEcJObXosWe3HvI0FwvLrsCA
         c4MQ==
X-Gm-Message-State: AOAM533NBXisECoubhpVAJ3U109FJPIIr1ZWN7PgOWSs0YTfKHTi9km6
	iMt2hGoWGNDtf8ZGm4ZlmPnR6S02BuWoew==
X-Google-Smtp-Source: ABdhPJwhxHFlnMWt/DfLa2tYvxYePW3YouE4KTiHHbVI8bLnrIInn4+35cbW3j4JUujJjA54zrzW/g==
X-Received: by 2002:a67:6bc6:: with SMTP id g189mr35537496vsc.63.1638206203981;
        Mon, 29 Nov 2021 09:16:43 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id q20sm9608172uae.17.2021.11.29.09.16.43
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 09:16:43 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id ay21so35551712uab.12
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 09:16:43 -0800 (PST)
X-Received: by 2002:ab0:6d8c:: with SMTP id m12mr52235612uah.105.1638206203112;
 Mon, 29 Nov 2021 09:16:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211129165510.370717-1-jernej.skrabec@gmail.com>
In-Reply-To: <20211129165510.370717-1-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 30 Nov 2021 01:16:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v67M2Qi5tUq0BNbgahTsY4bbYGQeqzjoH8RZ6fYWzrWsYA@mail.gmail.com>
Message-ID: <CAGb2v67M2Qi5tUq0BNbgahTsY4bbYGQeqzjoH8RZ6fYWzrWsYA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: sun8i: Adjust power key nodes
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, Michael Klein <michael@fossekall.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 30, 2021 at 12:55 AM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> Several H3 and one H2+ board have power key nodes, which are slightly
> off. Some are missing wakeup-source property and some have BTN_0 code
> assigned instead of KEY_POWER.

It might have been that after shutdown there was really no way to
"power on" the board with these GPIO power keys, so we didn't use
KEY_POWER for them?

> Adjust them, so they can function as intended by designer.
>
> Co-developed-by: Michael Klein <michael@fossekall.de>
> Signed-off-by: Michael Klein <michael@fossekall.de>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
