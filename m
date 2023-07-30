Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337A8134C8
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jul 2023 22:19:48 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3177163aa97so4191722f8f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jul 2023 15:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690755587; x=1691360387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wc/+C+AJRRP3wZqyNPfzz3Cgo44jHnLGmmlbexMEhKA=;
        b=cl5onc+TkxuEATcjD6uyVY7nH/Vz7ZkRqu9JxWsgfv4SoPnzoPuj4UYgsSxMX4DmhN
         EbKH4KNoyGqNS1sDmy9WPnVudE7zyM5LAixHPtl9LhQN4/Y11NaWw5hciNNR9xqmFpDI
         jUxLHWGe2o7k91QBJv2Dj0G7vecaM5dVGMn3rpNojwwl/nBKXvfX62Zgd2Wk+PNHMd5F
         lciKG1RUQTDhjvSskhmAgEEOj5rAaI9Raeqr53hWDgXglo54RMDQ5w9HCfxSz+ehAeUe
         14kbku6uFYUNnBKXbK5+sabAjDsDY50Q+XhPkTCq6JzLn9+4yXYHCvueRbhilg/sLmRN
         sVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690755587; x=1691360387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wc/+C+AJRRP3wZqyNPfzz3Cgo44jHnLGmmlbexMEhKA=;
        b=TR9xCudqjdM65nOCfwUJNRjZ4WSe45sZ1EVQPL/rYClnZjaI3tNVKkcWhj7/ehekkM
         0CqVZU7gffBezv+xqRnzk1HpIntktCD/D0nq36sTRCcYTwWk/LybVMgxfDcrio67gsl8
         QVynaXkYW831Y0eJ1Ogl5WKADMBw0VMum0gfd4OQk9n7ayxkDt0pHhflDViPKipSgzU9
         5gFCsgGHpDsz42p+D6YabudsFXVUvDFoBYH1BcQCryig3fu1otrOG6O5xVW2pRyr4j+e
         ACkuIgC/klo3X0NyKKE99/lUtPgMxzDCDDpoK9q5zkCk/sKvVrA0RzztBAEK662encNv
         vVMg==
X-Gm-Message-State: ABy/qLbvgsFt5aH5oyvnc8Elq8reO1qGtNI74Tkxjto1p0efgHX/jD7m
	LVS234eHhXwc/Pjz8orjo14=
X-Google-Smtp-Source: APBJJlGn9QQ0KC3d+6nE6FU7hS1U6dLdyswmnOJX3ZD6J+r5QpKVi1LURDmwkv8hjOYhZJhMt1p4yQ==
X-Received: by 2002:adf:e50e:0:b0:317:57f0:fae with SMTP id j14-20020adfe50e000000b0031757f00faemr6721588wrm.63.1690755587148;
        Sun, 30 Jul 2023 15:19:47 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d5005000000b00311d8c2561bsm11020850wrt.60.2023.07.30.15.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 15:19:46 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-iio@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Leonard =?ISO-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
 William Breathitt Gray <william.gray@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Mike Looijmans <mike.looijmans@topic.nl>,
 Maxime Ripard <mripard@kernel.org>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 4/4] riscv: dts: allwinner: d1: Add GPADC node
Date: Mon, 31 Jul 2023 00:19:37 +0200
Message-ID: <2150270.irdbgypaU6@jernej-laptop>
In-Reply-To: <20230619154252.3951913-5-bigunclemax@gmail.com>
References:
 <20230619154252.3951913-1-bigunclemax@gmail.com>
 <20230619154252.3951913-5-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 19. junij 2023 ob 17:42:27 CEST je Maksim Kiselev napisal(a):
> This patch adds declaration of the general purpose ADC for D1
> and T113s SoCs.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

Applied, thanks!

Best regards,
Jernej


