Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1910C2C5
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 15:43:34 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f871c93a5fso1460530e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 08:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687189413; x=1689781413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=By9LviJpFD6M31Xuvf8iRdC/f7qq5558NMtCfn3H0qE=;
        b=IsdcirYiybQ9DgqSQax5rr1IUuYvwIv8sXacQA3PptD5vmSsVvVnua0Yyw0/pIB3E1
         /+5dbWfz5ouAnktDaYJhrRkNVW6mWTnZ7rw8UomJq8jQwTJUjodwJ3XOvnbyQAkM1Hwv
         w6H1RvNeuFcs5lsSFjnaTXW1BVUcG5+BaDtiw2r4UBqeGQtKbevlf9sPYWMGcYmx88mg
         Zfw80n71GUExELHO8yISSdiI61YS+seyOJgr0EgA3yXTwqsjADWuyw0VI3an+rmKSbAE
         aIqCU925PykndGkDQm1Ojm0o/6vQmeXBlc/jSmpYVEUmL6LiC3po0OP19K6Npx/UM9RS
         o0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687189413; x=1689781413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=By9LviJpFD6M31Xuvf8iRdC/f7qq5558NMtCfn3H0qE=;
        b=BKPobxefGGPaTbUahMVRa9t4EopaxFeMQSvNIv2R2cyaM8iDOo/FSv1EgjNgSnluq6
         rxg/8Ow3ocpsIOFrlKGPeaFwrbJl1/rFsBVV+4D0MYtTVCzzBqZrDocCMz6Lf/5K19Bd
         ZTDJUqsIXWQ2MHqQPUXU3bqw7pNL6o1CqEr1yqTtx93F4H0lwJ/YsqfZD5XWlpXjVI8B
         /aNYpc/prf2yesbeYH5ljmJcGKSFC8iclOmLPcKS2dVcYaofpfp5VObrQr3ZrQjvFj+P
         MwzQdlTgxT38lcR7wO1d3vJhyOuE+9ZkByNXpABb2mLk4r58sSqPzrqm8gn81/htNKMS
         RdXw==
X-Gm-Message-State: AC+VfDxliNulsil3YFxCWCNjhaUDSXgdbFD5fEc/pukeSykjJmUhWuNZ
	Dh+vSMHtPnN+CUWCyGU5h2I=
X-Google-Smtp-Source: ACHHUZ7SZr0BfAlnP0I+J+Ztm3YUYwpYJ5m1CVqsbJXoe5r6Dql+Pd7bzmdwb6JD3xJgMILfAb2W3w==
X-Received: by 2002:a19:f201:0:b0:4f4:dd51:aec7 with SMTP id q1-20020a19f201000000b004f4dd51aec7mr4719115lfh.54.1687189412587;
        Mon, 19 Jun 2023 08:43:32 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id f11-20020a19ae0b000000b004f85e53250bsm1207144lfc.191.2023.06.19.08.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:43:32 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 1/4] iio: adc: Kconfig change description for Allwinner GPADC
Date: Mon, 19 Jun 2023 18:42:24 +0300
Message-Id: <20230619154252.3951913-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619154252.3951913-1-bigunclemax@gmail.com>
References: <20230619154252.3951913-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds SoCs names to Allwinner GPADC description to
make it more informative.

Fixes: d1caa9905538 ("iio: adc: add support for Allwinner SoCs ADC")
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/iio/adc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index eb2b09ef5d5b..d93868684c7b 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1105,7 +1105,7 @@ config STMPE_ADC
 	  built-in ADC block (stmpe811).
 
 config SUN4I_GPADC
-	tristate "Support for the Allwinner SoCs GPADC"
+	tristate "Allwinner A10/A13/A31 and similar GPADCs driver"
 	depends on IIO
 	depends on MFD_SUN4I_GPADC || MACH_SUN8I
 	depends on THERMAL || !THERMAL_OF
-- 
2.39.2

