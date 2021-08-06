Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81A072
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Aug 2021 21:42:34 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id n19so14313472ioz.0
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Aug 2021 14:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6dNm4/ayIKAUGrrE4umEzhHFHKl/3I8/jdHqQJ6Pdo8=;
        b=uK01HKzsVd/5q6rSOb6DA/eLeVTxkNNkjZ2+9PistHrwCvQKbxOe4KgJRTkMsmqMtt
         OuSrB/7I0WU9ZBNZqC4BzX+czhGjhPGQbBmKsl+Ors9IGgxdgZPp+o2GMCLsQyzF9Eac
         IQiXxvI318CcAJTz9+AkAeY4yfi9XVL8DMzynmDODTcDX7C452E9zD2zsPUhcmXR2+Lj
         htX+Z0uxxkeSXXgJax+U0zqPw7yNBaV+IwgHPUWFV1jb9N3p77bPy5FScmWSJ8WfXeSM
         SULdjMDyTtQDTM0NLfnLesKD1/xI5ZZu2jP/fFmn3ql84rkxkPw4J57CLJFbongsPMF6
         IW8g==
X-Gm-Message-State: AOAM5335eXVwKK799ivYxVGcICnDGOcBPWV1ft8F6CtL0GoJML2T7m8c
	bEeKorsg9Aw0OiFDqMrSVQ==
X-Google-Smtp-Source: ABdhPJxjvpIzcJ+Q1ncETcICb7qXJ/KAhp09G2GpESQjQUNQfAZiWS+hDruh5FQG9de3TYUm07UcQw==
X-Received: by 2002:a5d:8154:: with SMTP id f20mr106230ioo.89.1628286154032;
        Fri, 06 Aug 2021 14:42:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n14sm5013066ili.22.2021.08.06.14.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:42:33 -0700 (PDT)
Received: (nullmailer pid 1854231 invoked by uid 1000);
	Fri, 06 Aug 2021 21:42:31 -0000
Date: Fri, 6 Aug 2021 15:42:31 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@sipeed.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/17] clk: sunxi-ng: add support for Allwinner R329 CCU
Message-ID: <YQ2sxynJYuMEBNRD@robh.at.kernel.org>
References: <20210802062212.73220-1-icenowy@sipeed.com>
 <20210802062212.73220-12-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802062212.73220-12-icenowy@sipeed.com>

On Mon, Aug 02, 2021 at 02:22:06PM +0800, Icenowy Zheng wrote:
> Allwinner R329 has a CCU that is similar to the H616 one, but it's cut
> down and have PLLs moved out.
> 
> Add support for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>  drivers/clk/sunxi-ng/Kconfig                |   5 +
>  drivers/clk/sunxi-ng/Makefile               |   1 +
>  drivers/clk/sunxi-ng/ccu-sun50i-r329.c      | 526 ++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun50i-r329.h      |  32 ++
>  include/dt-bindings/clock/sun50i-r329-ccu.h |  73 +++
>  include/dt-bindings/reset/sun50i-r329-ccu.h |  45 ++

Same here.

>  6 files changed, 682 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-r329.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-r329.h
>  create mode 100644 include/dt-bindings/clock/sun50i-r329-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun50i-r329-ccu.h
