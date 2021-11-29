Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539E42CA0
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 23:10:45 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso27659211otj.11
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 15:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=77kfHfyKGJ2HztDbkf8db8E89hhLx3pJaRAlA+q2WdA=;
        b=5blu4qRcDtJ+zANPAEcV9U+Gu1hcpsMZydsKmOjuuAeBi7f+N7DfatRFTkUq/2Osvd
         4xJXY7aL0pQDIRvXoGcW3G9ZsEzsCzBZ0f6bPAc1A1MUdZ1Czs3EWrOd+z7x0uUScwmY
         P0AP7lM0wQV+FqjXx6siWpmHcOdnQY/xcagBlFK7TP7EikoxNNkRwBd5p3MsIBxnCNla
         2upU2JeA9G1k3XHfak+W57VFm5z/JMLfEzCY3+m/QbD66FaGNHRdb78rnRT1H+sAgpbk
         D2VPllbi7YZAk2lPrAyvRb002Alei1QMbn/3oO2AGh0ErmqddlSNxjVWStEh/kc1qQZ1
         +tkg==
X-Gm-Message-State: AOAM5304PRStmS/d1fS5qXLidael73b6wqHMAK38VcFxuY+rTHGIxhYr
	3mOYQjZv1Epd0XTUfPzfeA==
X-Google-Smtp-Source: ABdhPJzrS04xDvnfnIZ1XN9JO4RsOgrUAO7Dh8tTPy7CGy/xndNLVkSkQDhjeCH8MEhP+1xzk0C//w==
X-Received: by 2002:a9d:390:: with SMTP id f16mr48399715otf.325.1638227444397;
        Mon, 29 Nov 2021 15:10:44 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j10sm2466931ooq.5.2021.11.29.15.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 15:10:43 -0800 (PST)
Received: (nullmailer pid 785298 invoked by uid 1000);
	Mon, 29 Nov 2021 23:10:42 -0000
Date: Mon, 29 Nov 2021 17:10:42 -0600
From: Rob Herring <robh@kernel.org>
To: Evgeny Boger <boger@wirenboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Quentin Schulz <foss@0leil.net>, Lars-Peter Clausen <lars@metafoo.de>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: adc: document TS voltage in AXP
 PMICs
Message-ID: <YaVd8j4fj69pmsnU@robh.at.kernel.org>
References: <20211118141233.247907-1-boger@wirenboard.com>
 <20211118141233.247907-3-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118141233.247907-3-boger@wirenboard.com>

On Thu, 18 Nov 2021 17:12:33 +0300, Evgeny Boger wrote:
> Most AXPxxx-based reference designs place a 10k NTC thermistor on a
> TS pin. axp20x IIO driver now report the voltage of this pin via
> additional IIO channel. Add new "ts_v" channel to the channel description.
> 
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> ---
>  .../devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
