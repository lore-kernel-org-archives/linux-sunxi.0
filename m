Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D623FC7
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Sep 2021 15:16:01 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id g15so5937232vke.5
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Sep 2021 08:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=766FS/HzGzDEonfiPt4V52EBMkKW9u1/0R9KsOBkyeQ=;
        b=O8eNZCd0iaoDyl5gbCx+gSIU2+w7yyN/xPhbCWqPYrAlKQA0qd9bzNHh+2t0AJDqLa
         RZbyFg6x3Zc8sgAu40brDUdxAVXmMaAfwt+8howTV9SjCUGIYlRJvEOy9kCiKY2tjJcR
         9MQ3DOIlzGyN4s5kbAmWMa52RzepzCwNUi7H6TvlXmPmPKmPbguqJhg8hM52CaroH3WH
         MQ3UCo0CopvZPmM8Gq6jk22awBTv9hq7SDXbcRbrzNLRPFtctCYka1cRz77dwuIhY+YC
         vnseJhQQkWnjDQAQBfcOtrVqaZYj1YQnPCVgDFIluxEVFkdKVPIjGAmsgEaa9HzRxPYn
         MsHw==
X-Gm-Message-State: AOAM532v1CUEkGwhLwXlgT6NHzKmhEMDDmKqvJalWCRvFdDdc67xVeFH
	eXPX4DM3vA/omUuXu7B4XgGCxvRPxsRV2w==
X-Google-Smtp-Source: ABdhPJzNQP89v6tzcHSgTVyjA6cue/8D8KnDwLeldy/W3L5oz8G6dMoj9gQfRVgJiIPwmAGWqlEbbg==
X-Received: by 2002:a1f:9bd5:: with SMTP id d204mr13687834vke.8.1632669360230;
        Sun, 26 Sep 2021 08:16:00 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id z79sm797792vkd.54.2021.09.26.08.15.59
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Sep 2021 08:16:00 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id n17so15317562vsr.10
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Sep 2021 08:15:59 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0c:: with SMTP id b12mr9373742vsu.13.1632669359580;
 Sun, 26 Sep 2021 08:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210924071614.868307-1-maxime@cerno.tech> <20210924071614.868307-3-maxime@cerno.tech>
In-Reply-To: <20210924071614.868307-3-maxime@cerno.tech>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 26 Sep 2021 23:15:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v65JmoLJvX9pVg7FS6U-dG0rBhpsJ=ZUeSkX-iqRgaqy6A@mail.gmail.com>
Message-ID: <CAGb2v65JmoLJvX9pVg7FS6U-dG0rBhpsJ=ZUeSkX-iqRgaqy6A@mail.gmail.com>
Subject: Re: [RESEND v2 3/3] dt-bindings: mfd: Convert X-Powers AC100 binding
 to a schema
To: Maxime Ripard <maxime@cerno.tech>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Lee Jones <lee.jones@linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-sunxi@lists.linux.dev, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 24, 2021 at 3:16 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The X-Powers AC100 hybrid devices are supported by Linux thanks to its
> device tree binding.
>
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
>
> Cc: Lee Jones <lee.jones@linaro.org>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Chen-Yu Tsai <wens@csie.org>
