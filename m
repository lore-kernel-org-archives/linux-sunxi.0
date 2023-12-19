Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E26358AF
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Dec 2023 17:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwzlnCoN"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a1fae88e66eso538363966b.3
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Dec 2023 09:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703006044; x=1703610844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9vtfVLly14ekhlTunGy1vRxwLpd8U5NIsSj2AVK3Vk=;
        b=LwzlnCoNC4daOdhmVqZ7FQvGBDP2OqP6dmm9qxntFpXjeHP2Fxw6AKw9ft3khmXREW
         qBvFz2uLTBW2OVIupvptCgQ6T9Ajqn+oVKt5FsykSTg4D/uCu0MpUX44JZCLT/5LAYQA
         pUlufsJbJGNVRumfUXoo7pHFW8vbGBsGfiuykb4uMsFwuepKzSfZaIbGGJZB0w2+CWBk
         s/EVBeqDB+FC23hLSxXMy9NXX+xZNA3NhU/Mza+Fazh+8jBqI8QIH8wJmYxHBjlONObP
         85RmXtHnPDZiFIZzoBEciPDsf8KvDEeLF1GahZaOud7s8CB0/rt19KMWhw7ruVfIS/EJ
         JeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703006044; x=1703610844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9vtfVLly14ekhlTunGy1vRxwLpd8U5NIsSj2AVK3Vk=;
        b=fC1BT4GKjJv95hAFuuERXltirDVRDcR69DYQgJvhnSWzezDdW5VK0i5BGxvwEjO1dU
         9vxuLSTkAJkw7PJol+k8v9VfKeR1C+LQnErpscCS8IVzeDPQSYGaru/C6FSlyhGjnAV7
         e4+U/j1l3BKMw7JiDRYdOXEvV5lY+o/tCb8vmjBQ+Mlgsq8mCHukCZbJSmjuzf6pAVPO
         Gid9ivg8j5dv9SCQ9S9q/K+Gvji+hz3BZ5RMUOZcG2DjAXe9/Q2lwsmc1afG1G5GKrUP
         2NDlVbyJvqFGlGjQxGH1U53kKjqx3FOMRwo4UW2JnOIMVoTKoo1mGvnHcUPAjf0THoir
         /Fxg==
X-Gm-Message-State: AOJu0Yw+JjF95u2SPqqBXEWw6VaSBtw6+oI+jGEH3/braC3BWMrYL3N1
	Pp9vOdlGx5bMNTh2o7zZA4M=
X-Google-Smtp-Source: AGHT+IG4srAKNtlRLgacln5AazC7R1jIUPMIg1CJHj5l9uMv+Lm+7DWv6+igpI5lY+xNGDiLnRvPEw==
X-Received: by 2002:a17:907:3d91:b0:9fe:57b3:bc08 with SMTP id he17-20020a1709073d9100b009fe57b3bc08mr11848783ejc.41.1703006044090;
        Tue, 19 Dec 2023 09:14:04 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id cx7-20020a170907168700b009fc576e26e6sm15541544ejd.80.2023.12.19.09.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:14:03 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Maxim Kiselev <bigunclemax@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 John Watts <contact@jookia.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject:
 Re: [PATCH v6 2/3] thermal: sun8i: Add D1/T113s THS controller support
Date: Tue, 19 Dec 2023 18:14:01 +0100
Message-ID: <1950771.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20231217210629.131486-3-bigunclemax@gmail.com>
References:
 <20231217210629.131486-1-bigunclemax@gmail.com>
 <20231217210629.131486-3-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 17. december 2023 ob 22:06:23 CET je Maksim Kiselev napisal(a):
> From: Maxim Kiselev <bigunclemax@gmail.com>
> 
> This patch adds a thermal sensor controller support for the D1/T113s,
> which is similar to the one on H6, but with only one sensor and
> different scale and offset values.
> 
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


