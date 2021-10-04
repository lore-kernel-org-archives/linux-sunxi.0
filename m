Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C473FC9
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Oct 2021 18:26:10 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so22745108otq.7
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Oct 2021 11:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o8bwhkN79EalIrTbnnOWRqEA3DSi10UHvsR2eJcQa94=;
        b=Dr1D1Oq0DcbIIlWFgQknqnSccJG3EnyOFJVWL7R277eJbOGluzr81NhnpbcpwFHSdW
         d1j0A/V8XKR/OFQJyHA0n9VV+D4i7nbZQkq+FYYfiDCetaXUTeSm3MJAlp0JgoTWdpVA
         7bzAnuWecsKSJzp/oBfZvhH9WQoq8GKVzosUcm2XfCd7PqMo2me0rxTlcrgXwSQWTRKt
         zm0uIMR7xIH1469ljmULmWOSJHAqPYTB7x8/ScccZ6rVyxI8ZLGTfKMPY2mEGpzZFRDQ
         4OSNQg3XQ4QWEPQW53J//hFxbU5lJXnTGd0iAgZjTZjrAv7fZkGoYdkD1syWaa4OXNvG
         mMZg==
X-Gm-Message-State: AOAM533rsJG8qgRVutxaJ0Qo/hce38wt5yfUfXCvvXwoicKw+H/ZeW0H
	UJQPR14xZpnSx1nicAgP9A==
X-Google-Smtp-Source: ABdhPJz2K7KCGZfqZNBbWPfWIgbCS+HZoWQP3+s7HnKACw+3nQsHcrlj9kQ5sRUN6acBuzNlHkKtng==
X-Received: by 2002:a05:6830:1616:: with SMTP id g22mr10744306otr.79.1633371969600;
        Mon, 04 Oct 2021 11:26:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j24sm2186115otq.72.2021.10.04.11.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:26:09 -0700 (PDT)
Received: (nullmailer pid 1608195 invoked by uid 1000);
	Mon, 04 Oct 2021 18:26:08 -0000
Date: Mon, 4 Oct 2021 13:26:08 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: rtc: sun6i: Clean up repetition
Message-ID: <YVtHQMMzPn00tLDw@robh.at.kernel.org>
References: <20210928080335.36706-1-samuel@sholland.org>
 <20210928080335.36706-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928080335.36706-2-samuel@sholland.org>

On Tue, 28 Sep 2021 03:03:27 -0500, Samuel Holland wrote:
> - Use "enum" for compatibles instead of several "const" alternatives.
> - Merge the H6 clock-output-names minItems/maxItems constraint into the
>   identical block above.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> Changes since v1:
>   - New patch.
> 
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 28 ++++++-------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
