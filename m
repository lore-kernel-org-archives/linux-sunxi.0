Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872136F
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Mar 2021 13:11:33 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id d13so8076730lfg.7
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Mar 2021 06:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=JP8FY7YIwKkpvsR6KDR8iYzr4x7tBNFx7Dd5AIVujS8=;
        b=JuDlBNaUMLPjsfWj/iM0A2pjWLouLV+bEL8RztKBLT9q69X6NY6eaPH8qFY+Bqux1p
         h06zUzXx6q6nyWFMBgBfWC43g2eQs9IG13+xPqkb/32Jl8bbwBtkig7GR9Qtnw6MUAKg
         W5jPAn3PFmie/znRTvT6ZOLYrFeDCKcxABPn8nFXkjk7t5r7fBZ7bjOUQe4ZU1CBizOl
         5KxARCLa2Xbk69j6tDBiUAdQtPl5TRxL+JQDq+ta8gtGsiDV3/otUXRLnZX8S32+KbKJ
         HofUfOY2U+AZak5wNo/06gZjM/zXlUb8EYxuDMDsjIqfzUL30QyK1gt5AXraNUPo5mt8
         FtUA==
X-Gm-Message-State: AOAM530M3ORLItuPBqp0I9fPBv2fMC1/o+6hryxNqsWVkhQ71DF0tvFu
	7avMqZ2RXxCbUc5welFzUSgzWq/dUZs=
X-Google-Smtp-Source: ABdhPJzU1obU16Pr8vZW2wvhfVlAKwunJiAjv/67Bcv8ggv37ISGfQIQO30mfOCZSVYhExQ7AZKqpg==
X-Received: by 2002:a05:6512:1192:: with SMTP id g18mr2091215lfr.408.1617196290210;
        Wed, 31 Mar 2021 06:11:30 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id k11sm230614ljg.119.2021.03.31.06.11.29
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 06:11:30 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id v15so29075757lfq.5
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Mar 2021 06:11:29 -0700 (PDT)
X-Received: by 2002:ac2:5312:: with SMTP id c18mr2254236lfh.618.1617196289610;
 Wed, 31 Mar 2021 06:11:29 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210331130830.64182-1-maxime@cerno.tech>
In-Reply-To: <20210331130830.64182-1-maxime@cerno.tech>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 31 Mar 2021 21:11:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v660MdRWXHxvqrean59z06mZgRooLcUYURCekmdMWwQkOw@mail.gmail.com>
Message-ID: <CAGb2v660MdRWXHxvqrean59z06mZgRooLcUYURCekmdMWwQkOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Add our new mailing-list
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 31, 2021 at 9:08 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> We've been struggling to get an LF-hosted mailing list for a while, but
> now that lists.linux.dev is there we opted in.
>
> Let's add it to MAINTAINERS.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Chen-Yu Tsai <wens@csie.org>
