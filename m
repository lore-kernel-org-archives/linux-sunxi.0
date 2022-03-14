Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6684C1B73
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Mar 2022 14:35:27 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id w128so8444932vkd.3
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Mar 2022 07:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=ZysgtXfsvATJN+SzsQw8W599UCzEtICCfKvj8cL/+Gg=;
        b=vVaNc9rfn+hTBPrEF4bvI99CeobBz8NMV/UOb7qd/TZBGNf7faNMCUsoM/muJ+n5jw
         DOWwKBhmKdHDOzBDDOZWlOV932csqOYOelJ6a0nM8RxPobjsoIOsl6IdABG1GgK62cvW
         Ie3RfAFUbUNG6kWFiuFnzZIIjRcdwGQ3YT+h/Kmbiz9o35AQ705bm7uOK6YPVYUEcKU9
         HiATCxym4jX7QTv05IE9V4ymYfXxMeyBTFF9c6bGQ17lLo/myQI7ZOFBLslC60RtFfvo
         WmEhbi2VJOgsjMQxJjRHpYyccYr0+lsJoc1BFpf0WgO2PrVpcdiM8/EwrzBTKWiFvNaH
         2lxA==
X-Gm-Message-State: AOAM5314Q14yYR0C0sjZuCAapZCrgY9OW4SiHECVr5+h0AuvU7CJYzqA
	cZVpsvuxkrvAHxLLHHWc24E6Y20idhro4g==
X-Google-Smtp-Source: ABdhPJwtOclXuTcsUMrERQb7ZIlXN+Ab1SiN7kEKU7CtAvTxmocrAecaLZrNKk3h8Sb2NovDuD3qrg==
X-Received: by 2002:a05:6122:a11:b0:337:8705:7592 with SMTP id 17-20020a0561220a1100b0033787057592mr9697598vkn.3.1647268526135;
        Mon, 14 Mar 2022 07:35:26 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id b13-20020a67b34d000000b0031b582439e3sm2184464vsm.5.2022.03.14.07.35.25
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 07:35:25 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id v128so17300596vsb.8
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Mar 2022 07:35:25 -0700 (PDT)
X-Received: by 2002:a05:6102:364a:b0:322:b4b4:6407 with SMTP id
 s10-20020a056102364a00b00322b4b46407mr7372287vsu.39.1647268525337; Mon, 14
 Mar 2022 07:35:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220314115354.144023-1-Julia.Lawall@inria.fr> <20220314115354.144023-22-Julia.Lawall@inria.fr>
In-Reply-To: <20220314115354.144023-22-Julia.Lawall@inria.fr>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 14 Mar 2022 22:35:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v65eFvx+by=t3DEqV1w3ciQ4ruWtDXW=6teSFDqKMWzXxg@mail.gmail.com>
Message-ID: <CAGb2v65eFvx+by=t3DEqV1w3ciQ4ruWtDXW=6teSFDqKMWzXxg@mail.gmail.com>
Subject: Re: [PATCH 21/30] spi: sun4i: fix typos in comments
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-spi@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 14, 2022 at 7:55 PM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Acked-by: Chen-Yu Tsai <wens@csie.org>
