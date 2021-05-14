Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C1572
	for <linux-sunxi@lists.linux.dev>; Fri, 14 May 2021 13:07:07 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id q7-20020a9d57870000b02902a5c2bd8c17so26403041oth.5
        for <linux-sunxi@lists.linux.dev>; Fri, 14 May 2021 06:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=l2eXy9z3afSwFgDJvgpFD/dJeeyQ7yGcCchF95C+EYo=;
        b=lXWWSsZNR/OW/A0/7PMUnjtBz0FBYL0eY9SaYoQ3+V2iz6uV205XobZN/2PJrVmjiw
         ssrhM7WPuM0ctl5aaTb+ISrqVigYnwAynUWpJb4D5fww45ryAivs7HjlZNOBxpEFXtgI
         AODCQYpbu1W6x2SnHt0cjFCKtDQWnp/CMtRXsXGkwFj+CJb1h4MnDNuRAV4mdPrazcm3
         U2uOMh0Z5LYpg+omsmEQVEeQDq5jX3ErC5rfrtxgRTEQs6MlvvMItkDw8mh//1RXKZ1d
         z8t7mECSUIUmUyXRCiyVBvZeGM0KVIIXO/yvah2hP+jKe3ZHy0KU7utCZwDH3tL6uCXS
         M+ww==
X-Gm-Message-State: AOAM5319FOJilcOvR6/+6Gy1iTxI5f/VZIAreCvHV5ZmQ9nmXzWs3/Qx
	LddbXpls70zNhug7DAf7GQ==
X-Google-Smtp-Source: ABdhPJwxT9wq5KV3S8bxY0nu4XKjmrJVihBR6WLFWVuWar1OZi3pT3atscgWLMtmxfBX5YT16XPM8w==
X-Received: by 2002:a9d:6c86:: with SMTP id c6mr21822666otr.9.1620997626366;
        Fri, 14 May 2021 06:07:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i130sm1195577oif.49.2021.05.14.06.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 06:07:05 -0700 (PDT)
Received: (nullmailer pid 3936692 invoked by uid 1000);
	Fri, 14 May 2021 13:06:56 -0000
From: Rob Herring <robh@kernel.org>
To: Tobias Schramm <t.schramm@manjaro.org>
Cc: =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20210513233024.2076725-5-t.schramm@manjaro.org>
References: <20210513233024.2076725-1-t.schramm@manjaro.org> <20210513233024.2076725-5-t.schramm@manjaro.org>
Subject: Re: [PATCH v2 4/7] ASoC: dt-bindings: sun8i-a23-codec-analog: add compatible for Allwinner V3
Date: Fri, 14 May 2021 08:06:56 -0500
Message-Id: <1620997616.593902.3936691.nullmailer@robh.at.kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Fri, 14 May 2021 01:30:21 +0200, Tobias Schramm wrote:
> The analog codec frontend of the Allwinner V3 is compatible with the
> analog codec frontend used on the Allwinner H3.
> This patch adds a compatible string for the analog codec frontend on the
> Allwinner V3 SoC.
> 
> Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
> ---
>  .../bindings/sound/allwinner,sun8i-a23-codec-analog.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml:21:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1478254

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

