Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F06820E8
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 20:34:05 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id n8so767481eda.0
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 13:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OLWwuKwhDGZ5AVt1p7fFud+w2xnXRC2cyekV81w3MDU=;
        b=dheqE6WHwvec6tvb6t2RbF5VQNheGf73O7aOBbWBM90uPgRY7rjxLwdopKqx72QETI
         9+X7x7jSPVLe35HXCDQldILySK6vIaAFKfnX3HPBP0/j95N8DUoKhHp7021brMu9adLG
         yQGG2iTCry+dnpBEIfhwqQI3FsMWrs6gaWN1SzhlRdwlpU7TA0f87EBVzhZUvyEl9p+v
         naGmnvUsNkzChfpTJPj4aM2kXkZNXpdjNvCCAz1DtdjOEQXU3H55lUVo3BTVg3PJr9qn
         krDTRJOYoa/gMT7+yRFcL+eTIiPJv1z1iYTuQSFygvCy6I+O2QDSnCP6uUX6MCdwidHK
         IKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OLWwuKwhDGZ5AVt1p7fFud+w2xnXRC2cyekV81w3MDU=;
        b=go88SwvY48KIlFCkc0A1BMa6mZPoN4Gg8WdI4zhOlHBpq/TJnblsspbIymZudaOsnU
         FXE19F49F/8Ehx6xEzJiiIQhk8z8XhIkMTupjJWLXsHDCQCCFKYR39nFLYxJkWWN+g4V
         HttKGwjNi1KbNO6yn8uMb50vl7hwLVBv6mTodI9cfAlAUhJHDqPx62VZgq0hURL8xJO7
         j0KP50UsJ2//BserGD7HrZLCdqs0rdNuPvLE4BI62emRcjxWFjdkeNjb7UJbAWnea+FB
         jsBX6EyYkK6FPUUQCFfzSLQ5H3S2XIx43BryInBw5kDBJbIp4Hes50jDIYnUk+3Eibpx
         EO6Q==
X-Gm-Message-State: AJIora8TpB/KesOJCNWo2iBtEQVpGrgRRtYldV6Bx14kNuQ+vrs6mJCP
	YvBBKMebGIg2gAbQaN0Oa9w=
X-Google-Smtp-Source: AGRyM1t+7vYQ+AGGmRmAHAA6HQWSIKQ56fM95D1r6YAj+WD+1Y+PPYMi6z7Zq+alDcC2KC05jXGFig==
X-Received: by 2002:a05:6402:280b:b0:437:9efc:a065 with SMTP id h11-20020a056402280b00b004379efca065mr5648487ede.3.1656362043648;
        Mon, 27 Jun 2022 13:34:03 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id b9-20020aa7d489000000b004358243e752sm8120949edr.5.2022.06.27.13.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:34:02 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Ondrej Jirman <x@xff.cz>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/6] pinctrl: sunxi: Add I/O bias setting for H6 R-PIO
Date: Mon, 27 Jun 2022 22:34:00 +0200
Message-ID: <4405996.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20220626021148.56740-3-samuel@sholland.org>
References: <20220626021148.56740-1-samuel@sholland.org> <20220626021148.56740-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 26. junij 2022 ob 04:11:43 CEST je Samuel Holland napisal(a):
> H6 requires I/O bias configuration on both of its PIO devices.
> Previously it was only done for the main PIO.
> 
> The setting for Port L is at bit 0, so the bank calculation needs to
> account for the pin base. Otherwise the wrong bit is used.
> 
> Fixes: cc62383fcebe ("pinctrl: sunxi: Support I/O bias voltage setting on
> H6") Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Did you noticed any improvement with this properly set? In theory, 3.3 V bias 
should always work, right?

Best regards,
Jernej


