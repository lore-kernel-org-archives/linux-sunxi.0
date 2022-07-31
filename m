Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1043C1C
	for <linux-sunxi@lists.linux.dev>; Sun, 31 Jul 2022 16:02:42 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id q14so6782583iod.3
        for <linux-sunxi@lists.linux.dev>; Sun, 31 Jul 2022 09:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=1cJGXIDlYaNEYUvR2NRGrr9WocwvB3UiAWtCmIk18EA=;
        b=dAwEVtucTN7KojFHwhIcmYV+FhK9E6RxzeNCpIUEUjRZL5wbRuyYkDKRXEpxYiaLK2
         /dBiP154uHq+gibLpz/K7dZXoti330ce+TL3j981cjm4Jq3TrKiVLXPUtVkjsvzJYZ6I
         uYdZtiAi8HkKd+C2WWYbao6YLXf0VnRVDyJx8lQubxjZkXFch7X2RjzN0lBCUCLTY4m/
         0mB/xvRvQ4whg1gu+fdIg+m81SZ+jj5EjVnwD/qilSaMN1VvusKAdzqFT7WljVSVtcb4
         CPsYYWbp7LspNMzm5l1rokBcUFrVQvXYgO52OQ49jNvsSFYU4x9JP75+TLlC/3861EqT
         fPpQ==
X-Gm-Message-State: AJIora+yqCaDAbxgAPumq9jdhIDOL6cbeKPbEqg5yk7TErU/pGXJqVXV
	MLoJPrsFcUJL3CE0UmGZAw==
X-Google-Smtp-Source: AGRyM1sYNl3f2m8lc+L6zGIH26tQMfzr0kEk09cofcdtvYk92Axw48a86G07BJTzHcMr9cde/FMepg==
X-Received: by 2002:a05:6602:2ccb:b0:67c:3d7c:c896 with SMTP id j11-20020a0566022ccb00b0067c3d7cc896mr4263761iow.153.1659283361719;
        Sun, 31 Jul 2022 09:02:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b71-20020a0295cd000000b00339df77c491sm4265856jai.114.2022.07.31.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 09:02:41 -0700 (PDT)
Received: (nullmailer pid 3380583 invoked by uid 1000);
	Sun, 31 Jul 2022 16:02:39 -0000
From: Rob Herring <robh@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>
Cc: jernej.skrabec@gmail.com, samuel@sholland.org, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, lgirdwood@gmail.com, linux-sunxi@lists.linux.dev, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, broonie@kernel.org, wens@csie.org
In-Reply-To: <1659271861-3481-1-git-send-email-fengzheng923@gmail.com>
References: <1659271861-3481-1-git-send-email-fengzheng923@gmail.com>
Subject: Re: [PATCH v7 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC controller
Date: Sun, 31 Jul 2022 10:02:39 -0600
Message-Id: <1659283359.419677.3380582.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Sun, 31 Jul 2022 05:51:01 -0700, Ban Tao wrote:
> DT binding documentation for this new ASoC driver.
> 
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Maxime Ripard <maxime@cerno.tech>
> ---
> v1->v2:
> 1.Fix some build errors.
> 
> v2->v3:
> 1.Fix some build errors.
> 
> v3->v4:
> 1.None.
> 
> v4->v5:
> 1.Add interrupt.
> 2.Keep clock and reset index.
> 
> v5->v6:
> 1.None.
> 
> v6->v7:
> 1.None.
> ---
>  .../bindings/sound/allwinner,sun50i-h6-dmic.yaml   | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml:79:4: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

