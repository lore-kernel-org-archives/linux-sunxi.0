Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7DE21CC9
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 20:59:46 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-965ac4dd11bso1539291866b.2
        for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 13:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683752385; x=1686344385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7iiVpNS2TbezgmpT9ZKv1CtTBR6JW8urFYOpMbLQIE=;
        b=Ve84bY8EFJx6v5kYiXJIW4l38TbjweukQ9WPJ6EbKvaOLLh081oFWKHsluTDupOCmg
         EgQ2VgSu1zl+F5zx/otyUBmafq657FY6qzHR/gAXtygP1fxPk7pW/RnQSI5wFSPnZFww
         6RmKXFADFOlhsqW9PTuM++FK0p9pu7tusMpanqQTRHMNjv+Dy1GL9aZud/QcI+dsFCnQ
         vQCa0EYiDIPqjztsz31dqgLbRnBBGZwwXX/NitSrvpYh3Q6U75nBzB9X6SqeNPZUp5Gv
         bZbHAXNCNx3VUDFbS4roIkGZCwnZGai/7bkWX2JlW+XPd9KR3JjArqQIkml0W+1MR9Vj
         WvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683752385; x=1686344385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7iiVpNS2TbezgmpT9ZKv1CtTBR6JW8urFYOpMbLQIE=;
        b=NZg9kFj2uWjEUiEpnP3H9gOvVjBT4d/jUTkW5bf5BpdpnSqUVGYpzhLPdlzHEaFYSa
         RLx6jG4e45KMYH1D9SwApx4n2cDcJxxlLroGmYE/LkWjLQcKu0AqqymtrkRJZlq+0XIr
         MjHtkZu7lDz0rbYntXxY6L8ANwFDmQPMA7KCB0nvn7CQOuzmkWbNdAcPyJlkp9mL013Z
         lBWi0KoFlCJ0w9aaGQ7bJMccs3ac9W2hWJOoWef8W2Y9btRxecZvipp4wLP8GZcOR3Xe
         I9c1ADU7ABe3b+Ld4nSi24OKLRbXJmY6IHWr0k/LUMN1VR0G25j46mX3tBRG6fdwJqsX
         ovMg==
X-Gm-Message-State: AC+VfDxz4XWRvOsArDPgIOft0aR/oLamoCMv65rM0PsG7jL5mlMSMOui
	UuG8b00yovoZup7VfwDD+DA=
X-Google-Smtp-Source: ACHHUZ6672faX07heGWs3B0PV7ZJkqYGuQNoX8YzdTu1PeXrQ3hCuaiW5DPyaliV7S7XcyE3AyDzgA==
X-Received: by 2002:a17:907:94d3:b0:96a:58a:6cd8 with SMTP id dn19-20020a17090794d300b0096a058a6cd8mr6734541ejc.9.1683752384784;
        Wed, 10 May 2023 13:59:44 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id p15-20020a17090653cf00b0094ebc041e20sm3072028ejo.46.2023.05.10.13.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 13:59:44 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Maksim Kiselev <bigunclemax@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject:
 Re: [PATCH v5 5/5] riscv: dts: allwinner: d1: Add SPI controllers node
Date: Wed, 10 May 2023 22:59:42 +0200
Message-ID: <1932306.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20230510081121.3463710-6-bigunclemax@gmail.com>
References:
 <20230510081121.3463710-1-bigunclemax@gmail.com>
 <20230510081121.3463710-6-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 10. maj 2023 ob 10:11:12 CEST je Maksim Kiselev napisal(a):
> Some boards form the MangoPi family (MQ\MQ-Dual\MQ-R) may have
> an optional SPI flash that connects to the SPI0 controller.
> 
> This controller is the same for R329/D1/R528/T113s SoCs and
> should be supported by the sun50i-r329-spi driver.
> 
> So let's add its DT nodes.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


