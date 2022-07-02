Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158601FA8
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Jul 2022 19:06:10 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id fd6so6711830edb.5
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Jul 2022 12:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N0yu1El6vOD8A0gSx756Jt25HtpMxiSxwi6fNvLtoxg=;
        b=I4sXXmxDa/iZ225kkuLhwo9R+auGLloq99vC99wWuA7xov8rtKLRnD4nCrU8UbINB3
         6xypnAMT5Waiixv3xn8tW1xeyEQ3+ClVhd81CjOcKXGVDOeUkT13SqX3XM6EoCl4mZNF
         +gupnlPKVrv0MSsooUatuOJEyIqAypMd/4gRbTSOt3QzPcMyq7FsIVVW1SQM/uuDIXkZ
         gVa6joh8wIdt8MOBwVgeGryWLGywj8xdbq7UKuJjQGapV49d7kXlcme/mY3W+5Sygbsf
         ea11/cp1vHsccmOcFr8rrgx2yEulKEoC9ytXTXwOwDo4/zZTf5D1RGcoti6J8eK3cMXC
         v4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N0yu1El6vOD8A0gSx756Jt25HtpMxiSxwi6fNvLtoxg=;
        b=iFtQMZk4scrikSEDy9lK2TNbn/1BZXgvJk3hKvNQRRWv/GV+fyTJEmTX4/41pjlTJf
         /dnzU4l4PZdOW/bIXmVQ3kdhjyES9Rjso5uUnWmbvI2I1Ywkk7zLqBjd4Krc0la52sN9
         UP+tQpsNq+yS42H1XXFPQlLxHa9ThJ8fMaowtALxgbH8vRSUgYb+WLKfcNaH1dJ7fL+w
         /bks5KZRbeoZ+gPKzf1dki80resa+xvJLhROqZ390f8ZUtSVhmb38up3rVzwbb9iwB32
         VWx2fYxwzXQmnie29XtSHn4Lk1KbBYLlPBQsboOGQM57jSao2vGbPnVyJYyppNrMZw1h
         6f1A==
X-Gm-Message-State: AJIora+3WauZU8MCR9NC10RAO7RNNL1YTdc12O2PCy3I+p0IMikfnVdT
	KW8XIH/gDJqRdkrjLmY9EQc=
X-Google-Smtp-Source: AGRyM1uMMhIQ4Yw/s8eXzx+VpJdxchNQa9w2WGeJr1Rl6GkGJCDIxVskSkBGawHb9dTWaD4Ev/CxTA==
X-Received: by 2002:a05:6402:1774:b0:435:7fea:8c02 with SMTP id da20-20020a056402177400b004357fea8c02mr27136096edb.213.1656788769330;
        Sat, 02 Jul 2022 12:06:09 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id c22-20020aa7c756000000b00439c146efc9sm1244786eds.60.2022.07.02.12.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 12:06:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: display: sun4i: Fix D1 pipeline count
Date: Sat, 02 Jul 2022 21:06:07 +0200
Message-ID: <3674367.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20220702032921.22433-1-samuel@sholland.org>
References: <20220702032921.22433-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 02. julij 2022 ob 05:29:21 CEST je Samuel Holland napisal(a):
> When adding the bindings for the D1 display engine, I missed the
> condition for the number of pipelines. D1 has two mixers, so it
> will have two pipeline references.
> 
> Fixes: ae5a5d26c15c ("dt-bindings: display: Add D1 display engine
> compatibles") Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


